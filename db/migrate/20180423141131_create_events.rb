class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string  :title
      t.date    :date, index: true
      t.integer :min_member
      t.integer :max_member
      t.integer :max_group_member
      t.text    :description

      t.timestamps
    end
  end
end
