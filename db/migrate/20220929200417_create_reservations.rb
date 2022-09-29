class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.integer :total
      t.integer :pet_age
      t.string :pet_size
      t.text :pet_description
      t.references :user, null: false, foreign_key: true
      t.references :lodging, null: false, foreign_key: true

      t.timestamps
    end
  end
end
