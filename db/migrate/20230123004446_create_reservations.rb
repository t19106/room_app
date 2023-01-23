class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :checkin
      t.datetime :checkout
      t.integer :guest
      t.integer :room_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
