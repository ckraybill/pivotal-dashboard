class WelcomeController < ApplicationController
  def index
    @stories = Story.in_progress.group_by(&:current_state)
  end

  def chatter
    @activity_feed = Feedzirra::Feed.fetch_and_parse("https://www.pivotaltracker.com/user_activities/6719535ac5ba30ac90329524c0d0aa43")
  end
end
