require 'application_system_test_case'

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".product", count: Product.count
  end

  test "lets a signed in user create a new product" do
    login_as users(:george) #, xhr: true

    visit "/products/new"
    # save_and_open_screenshot
    screenshot_and_open_image

    # page.driver.browser.save_screenshot 'screenshot.png'
    # Launchy.open 'screenshot.png' # or open manually

    fill_in "test_product_name", with: "Le Wagon"
    fill_in "test_product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
  end
end
