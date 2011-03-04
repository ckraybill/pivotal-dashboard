class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_build_feed
  private
    def load_build_feed
      @build_feed = Feedzirra::Feed.fetch_and_parse("http://g5search:g5rocks@sancho.g5search.com/projects/core-development.rss")
    end
end
