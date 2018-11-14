class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :start_address, null: false
      t.string :destination_address, null: false
      t.float :price, null: false
      t.date :date, null: false
      t.integer :distance

      t.timestamps
    end
  end
end
