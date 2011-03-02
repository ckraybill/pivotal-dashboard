class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :url
      t.integer :project_id
      t.string :name
      t.string :description
      t.timestamp :accepted_at
      t.string :story_type
      t.integer :estimate
      t.string :current_state
      t.string :requested_by
      t.string :owned_by
      t.string :labels

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
