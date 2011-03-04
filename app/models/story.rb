class Story < ActiveRecord::Base
  attr_accessible :url, :project_id, :name, :description, :accepted_at,
                  :story_type, :estimate, :current_state, :requested_by,
                  :owned_by, :labels

  belongs_to :project

  scope :in_progress, where("current_state in ('unstarted','started','delivered') and story_type != 'release'")
  scope :accepted_after, lambda { |project_id,date|
    where('accepted_at > ?',date).
    where('project_id = ?',project_id)
  }

  scope :accepted_releases, lambda { |project_id|
    where(:project_id => project_id).
    where(:current_state => 'accepted').
    where(:story_type => 'release')
  }

  def self.create_or_update_all_from_pivotal(pivotal_project)
    pivotal_project.stories.all(:modified_since => (Date.today-30).to_s).each do |pivotal_story|
      self.create_or_update(pivotal_story)
    end
  end

  def self.create_or_update(tracker_story)
    story = Story.find_or_initialize_by_id(tracker_story.id)
    story.attributes = tracker_story.instance_values
    story.save
    story
  end

  def first_label
    labels? ? labels.split(',').first : 'none'
  end

  def self.pending_release(project_id)
    last_release_date = self.accepted_releases(project_id).select(:accepted_at).last.accepted_at
    self.accepted_after(project_id,last_release_date)
  end
end
