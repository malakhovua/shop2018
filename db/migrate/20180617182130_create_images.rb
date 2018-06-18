class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :file
      t.integer :imagable_id
      t.string :imagable_type

      t.timestamps
    end
  end
end
