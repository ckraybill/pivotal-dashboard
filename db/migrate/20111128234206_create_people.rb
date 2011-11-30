class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :twitter_handle
      t.string :github_handle
      t.string :pivotal_name
      t.string :work_email
      t.string :personal_email
      t.timestamps
    end
  end
end
