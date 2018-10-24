atom_feed do |feed|
  feed.title "Who bought #{@product.name}"
  feed.update @lates_order.try(:update_at)

  @product.orders.each do |order|
   feed.entry(order) do |entry|
        entry.title "Order #{order.id}"
        entry.summary type: 'xhtml' do |xhtml|
             xhtml.p "Shipped to #{order.address}"

             xhtml.table do
              xhtml.tr do
                xhtml.th 'Product'
                xhtml.th 'Quantity'
                xhtml.th 'Total Pricre'
              end
             order.line_items.each do |item|
                xhtml.tr do 
                   xhtml.tr do
                     xhtml.td item.product.name
                     xhtml.td item.quantity
                     xhtml.td number_to_currency item.total_price
                    end
                end
             xhtml.th 'total', colspan: 2
             xhtml.th number_to_currency \
                order.line_items.map(&:total_price).sum
               end
              end
            xhtml.p "Paid by #{order.pay_type}"
           end
           entry.author do |author|
                 author.name order.name
                 author.e_mail order.e_mail
            end
         end
     end
end



          
