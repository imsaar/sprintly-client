require 'minitest/autorun'
require File.join(File.dirname(__FILE__), '..', '/lib/sprintly.rb')

class SprintTest < MiniTest::Unit::TestCase
  USER = 'xli@yzly.com'
  API_KEY = 'abcXYZ123123'
  
  def test_api_key_properly_set
    assert_equal(API_KEY, Sprintly.new(USER, API_KEY).api_key)
  end

  def test_user_properly_set
    assert_equal(USER, Sprintly.new(USER, API_KEY).user)
  end

  def test_base_url
  	expected_base_url = "#{USER}:#{API_KEY} https://sprint.ly/api/"
  	assert_equal(expected_base_url, Sprintly.new(USER, API_KEY).base_url)
  end

  def test_products_url
  	expected_products_url = "#{USER}:#{API_KEY} https://sprint.ly/api/products/1234/"
  	assert_equal(expected_products_url, Sprintly.new(USER, API_KEY).products_url(1234))
  end

  def test_product_items_url
  	expected_product_items_url = "#{USER}:#{API_KEY} https://sprint.ly/api/products/1234/items.json"
  	assert_equal(expected_product_items_url,
  		 Sprintly.new(USER, API_KEY).product_items_url(1234))
  end

  def test_product_items_url_with_options
  	product_items_url = Sprintly.new(USER, API_KEY).product_items_url(1234)
    options = {:limit => 5, :offset => 10, :frivilous => true} 
    options_string = "?limit=5&offset=10&frivilous=true&"
    expected_product_items_url = product_items_url + options_string
    assert_equal(expected_product_items_url, 
      Sprintly.new(USER, API_KEY).product_items_url(1234, options))
  end

  def test_items_limit_option
    # need to abstract the curl functionality before I can do this
  end

end
