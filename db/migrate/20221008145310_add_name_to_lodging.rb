class AddNameToLodging < ActiveRecord::Migration[7.0]
  def change
    add_column(:lodgings, :name, :string)
  end
end
