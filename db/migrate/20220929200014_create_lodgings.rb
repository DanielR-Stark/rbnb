class CreateLodgings < ActiveRecord::Migration[7.0]
  def change
    create_table :lodgings do |t|
      t.string :home_type
      t.integer :total_occupancy
      t.string :summary
      t.string :address
      t.boolean :park_dog
      t.boolean :park_cat
      t.boolean :bath_service
      t.boolean :walk_service
      t.boolean :special_care
      t.boolean :place_with_pets
      t.integer :price
      t.integer :animals_taken_care_of
      t.date :published_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
