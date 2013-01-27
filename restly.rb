require './lib/sprintly'
require 'json'
require 'pp'

$user = ENV['SPRINTLY_USER']
$password = ENV['SPRINTLY_API_KEY']
$product_id = ENV['SPRINTLY_PRODUCT_ID']

sprintly = Sprintly.new($user, $password)
pp sprintly.items($product_id, :limit => 2)
#puts sprintly.items_json($product_id, :limit => 5).size
