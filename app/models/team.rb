class Team < ActiveRecord::Base
  has_many :team_assignments

  has_many :members, :through => :team_assignments, :source => :person

  has_many :owned_stories, :through => :members, :class_name => 'Story'

end
