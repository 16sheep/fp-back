class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :booked, :default => 0

      t.timestamps
    end
  end
end
