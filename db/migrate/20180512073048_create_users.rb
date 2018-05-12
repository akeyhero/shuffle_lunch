class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
