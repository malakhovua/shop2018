class AddDescriptionToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :description, :string
  end
end
