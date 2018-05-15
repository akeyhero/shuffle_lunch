class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :group, null: false, foreign_key: true, index: false
      t.references :user,  null: false, foreign_key: true, index: true

      t.timestamps

      t.index [:group_id, :user_id], unique: true
    end
  end
end
