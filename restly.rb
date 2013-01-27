require './lib/sprintly'
require 'json'
$user = ENV['SPRINTLY_USER']
$password = ENV['SPRINTLY_API_KEY']
$product_id = ENV['SPRINTLY_PRODUCT_ID']

sprintly = Sprintly.new($user, $password)
$cmd = "curl -s -u #{sprintly.product_items_url($product_id)}"

p $cmd
result = `#{$cmd}`
puts JSON.pretty_generate(JSON.parse(result))
