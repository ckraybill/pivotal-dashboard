class WelcomeController < ApplicationController
  def index
    @stories = Story.in_progress.group_by(&:current_state)
    @build_feed = Feedzirra::Feed.fetch_and_parse("http://g5search:g5rocks@sancho.g5search.com/projects/core-development.rss")
  end

  def rebuild
    PIVOTAL_PROJECTS.each do |project_id|
      pivotal_project = PivotalTracker::Project.find(project_id)
      Project.create_or_update(pivotal_project)
      Story.create_or_update_all_from_pivotal(pivotal_project)
    end
    redirect_to root_url
  end

  def chatter
    @activity_feed = Feedzirra::Feed.fetch_and_parse("https://www.pivotaltracker.com/user_activities/6719535ac5ba30ac90329524c0d0aa43")
  end
end
