class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :event, null: false, foreign_key: true, index: false
      t.references :user,  null: false, foreign_key: true, index: true

      t.timestamps

      t.index [:event_id, :user_id], unique: true
    end
  end
end
