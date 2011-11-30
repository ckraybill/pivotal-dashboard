class TeamController < ApplicationController

  def index
    @teams = Team.all
  end
end
