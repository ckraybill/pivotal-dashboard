class Story < ActiveRecord::Base
  attr_accessible :url, :project_id, :name, :description, :accepted_at,
                  :story_type, :estiamte, :current_state, :requested_by,
                  :owned_by, :labels
  def first_label
    labels? ? labels.split(',').first : 'none'
  end
end
