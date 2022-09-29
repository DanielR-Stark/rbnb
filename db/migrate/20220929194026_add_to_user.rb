class AddToUser < ActiveRecord::Migration[7.0]
  def change
    add_column(:users, :phone_number, :integer)
    add_column(:users, :description, :text)
    add_column(:users, :profile_image, :string)
  end
end
