class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :event, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
