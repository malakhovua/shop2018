require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do

    post line_item_url, params: {product_id: products(:ruby).id}

    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: {  pay_type: @order. pay_type, address: @order.address, name: @order.name } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: {  pay_type: @order. pay_type, address: @order.address, name: @order.name } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    test "requires item in cart" do
    get new_order_url
    assert_redirected_to stote_index_path
    assert_equel flash[:notice], 'You cart is empty'
  end


    assert_redirected_to orders_url
  end
end
