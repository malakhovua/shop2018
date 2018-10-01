class Cart < ApplicationRecord

 has_many :line_items, dependent: :destroy

 def add_product(product)

 current_item = line_items.find_by(product_id: product.id)

 if current_item
  current_item.quantity += 1
 else
  current_item = line_items.build(product_id: product.id)
 end
 current_item

 end

 def remove_product(product)

 current_item = line_items.find_by(product_id: product.id)

 if current_item and current_item.quantity != 0
        current_item.quantity -= 1
       
 end

 if current_item.quantity  == 0
  current_item.delete
end

 current_item

end

def delete_product(product)

  current_item = line_items.find_by(product_id: product.id)
  current_item.delete
  
  current_item

end



 def total_price
   line_items.to_a.sum{|item| item.total_price}
 end


end
