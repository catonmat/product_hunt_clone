require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "the truth" do
    assert true, "prints true"
  end

  test "exceptions" do
    assert_nothing_raised { true === true }
  end

  test "product_count" do
    assert_equal 7, Product.count, "count products"
  end

  test "fixture 2 is google" do
    assert_equal("Google", product_fixtures(:google).name, "Second fixture should be google")
  end

  test "fixture 1 is rails"  do
    assert_equal("Ruby on Rails", product_fixtures(:rubyonrails).name, "First fixture is rails.")
  end

  test "fixtures load correctly" do
    product_fixtures.each do |record|
      id = record.id
      assert_not_nil(id, "obj exists")
    end
  end
end
