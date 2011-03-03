class Project < ActiveRecord::Base
  attr_accessible :name, :current_velocity
  has_many :stories
end
