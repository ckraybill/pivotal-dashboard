class AddCurrentToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :current, :boolean, :default => false
    add_index :stories, :current
  end

  def self.down
    remove_index :stories, :current
    remove_column :stories, :current
  end
end
