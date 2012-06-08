class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_build_feed
  private
    def load_build_feed
      #FIXME: Move the feed url to the Project and set a CI type
      @build_feed = nil
    end
end
