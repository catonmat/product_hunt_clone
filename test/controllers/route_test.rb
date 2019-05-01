require 'test_helper'

class RouteTest < ActionDispatch::IntegrationTest
  test "homepage route works" do
    assert_recognizes({controller: 'products', action: 'index'}, {path: '/', method: :get})
  end
end
