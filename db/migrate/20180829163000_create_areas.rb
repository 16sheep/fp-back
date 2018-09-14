class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :description
      t.integer :festival_id
      t.string :icon
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
