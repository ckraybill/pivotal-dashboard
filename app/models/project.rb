class Project < ActiveRecord::Base
  attr_accessible :name, :current_velocity
  has_many :stories

  def self.create_or_update(pivotal_project)
    project = self.find_or_initialize_by_id(pivotal_project.id)
    project.attributes = pivotal_project.instance_values
    project.save
    project
  end
end
