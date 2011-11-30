class Person < ActiveRecord::Base
  has_many :team_assignments

  has_many :teams, :through => :team_assignments

  has_many :owned_stories,
           :class_name => 'Story',
           :primary_key => 'pivotal_name',
           :foreign_key => 'owned_by'

  has_many :requested_stories,
           :class_name => 'Story',
           :primary_key => 'pivotal_name',
           :foreign_key => 'requested_by'

end
