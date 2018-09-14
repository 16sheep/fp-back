class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :area_id
      t.integer :festival_id
      t.integer :user_id
      t.datetime :time_from
      t.datetime :time_until
      t.string :category

      t.timestamps
    end
  end
end
