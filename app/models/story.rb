class Story < ActiveRecord::Base
  attr_accessible :url, :project_id, :name, :description, :accepted_at,
                  :story_type, :estimate, :current_state, :requested_by,
                  :owned_by, :labels

  belongs_to :project

  scope :in_progress, where(:current_state => ['unstarted','started','delivered'])

  scope :accepted_after, lambda { |project_id,date|
    where('accepted_at > ?',date).
    where('project_id = ?',project_id)
  }

  scope :accepted_releases, lambda { |project_id|
    where(:project_id => project_id).
    where(:current_state => 'accepted').
    where(:story_type => 'release')
  }

  def first_label
    labels? ? labels.split(',').first : 'none'
  end

  def self.pending_release(project_id)
    last_release_date = self.accepted_releases(project_id).select(:accepted_at).last.accepted_at
    self.accepted_after(project_id,last_release_date)
  end
end
