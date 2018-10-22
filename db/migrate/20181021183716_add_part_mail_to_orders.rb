class AddPartMailToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :e_mail, :string
  end
end
