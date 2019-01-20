class ChangeDescriptionToBeTextInCustomers < ActiveRecord::Migration[5.2]
  def change
=begin
    change_column :products, :description, :text
=end
  end
end
