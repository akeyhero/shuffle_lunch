class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string   :title, null: false
      t.datetime :date, index: true
      t.string   :venue
      t.integer  :min_member
      t.integer  :max_member
      t.text     :description

      t.timestamps
    end
  end
end
