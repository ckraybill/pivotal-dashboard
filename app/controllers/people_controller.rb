class PeopleController < ApplicationController
  def index
    @people = Person.find(:all)
  end

  def show
    @person = Person.find(params[:id])
  end
end
