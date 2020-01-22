require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get _carts_url
    assert_response :success
  end

  test "should get new" do
    get new__cart_url
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post _carts_url, params: { cart: {  } }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    get _cart_url(@cart)
    assert_response :success
  end

  test "should get edit" do
    get edit__cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch _cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart)
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      delete _cart_url(@cart)
    end

    assert_redirected_to _carts_url
  end
end
