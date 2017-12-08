require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit products_url
  #
  #   assert_selector "h1", text: "Product"
  # end
    test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "Welcome to the game!"
  end
end
