require 'test_helper'

class ProduitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produit = produits(:one)
  end

  test "should get index" do
    get produits_url
    assert_response :success
  end

  test "should get new" do
    get new_produit_url
    assert_response :success
  end

  test "should create produit" do
    assert_difference('Produit.count') do
      post produits_url, params: { produit: { name: @produit.name, panier_id: @produit.panier_id, price: @produit.price } }
    end

    assert_redirected_to produit_url(Produit.last)
  end

  test "should show produit" do
    get produit_url(@produit)
    assert_response :success
  end

  test "should get edit" do
    get edit_produit_url(@produit)
    assert_response :success
  end

  test "should update produit" do
    patch produit_url(@produit), params: { produit: { name: @produit.name, panier_id: @produit.panier_id, price: @produit.price } }
    assert_redirected_to produit_url(@produit)
  end

  test "should destroy produit" do
    assert_difference('Produit.count', -1) do
      delete produit_url(@produit)
    end

    assert_redirected_to produits_url
  end
end