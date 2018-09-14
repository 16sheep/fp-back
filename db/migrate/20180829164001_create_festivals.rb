class CreateFestivals < ActiveRecord::Migration[5.2]
  def change
    create_table :festivals do |t|
      t.string :name
      t.string :secret
      t.string :location
      t.string :logo_img
      t.string :map_img
      t.datetime :date_from
      t.datetime :date_until

      t.timestamps
    end
  end
end
