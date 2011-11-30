class CreateTeamAssignments < ActiveRecord::Migration
  def change
    create_table :team_assignments do |t|
      t.integer :team_id
      t.integer :person_id
      t.timestamps
    end
  end
end
