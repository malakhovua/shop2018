class ChangeDescriptionToBeTextInCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :description, :text
  end
end
