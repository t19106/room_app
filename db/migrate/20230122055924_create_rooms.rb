class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :summary
      t.integer :price
      t.string :address
      t.string :detail
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
