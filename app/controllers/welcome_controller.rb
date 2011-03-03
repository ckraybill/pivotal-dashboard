class WelcomeController < ApplicationController
  def index
    @stories = Story.in_progress.group_by(&:current_state)
    @build_feed = Feedzirra::Feed.fetch_and_parse("http://g5search:g5rocks@sancho.g5search.com/projects/core-development.rss")
  end

  def rebuild
    PIVOTAL_PROJECTS.each do |project_id|
      project = PivotalTracker::Project.find(project_id)
      project.stories.all(:modified_since => (Date.today-30).to_s).each do |story|
        persistent_story = Story.find_or_initialize_by_id(story.id)
        persistent_story.attributes = story.instance_values
        persistent_story.save
      end
    end
    redirect_to root_url
  end

  def chatter
    @activity_feed = Feedzirra::Feed.fetch_and_parse("https://www.pivotaltracker.com/user_activities/6719535ac5ba30ac90329524c0d0aa43")
  end
end
