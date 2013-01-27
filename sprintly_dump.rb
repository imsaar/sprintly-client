require './lib/sprintly'
require 'json'
require 'pp'

$user = ENV['SPRINTLY_USER']
$password = ENV['SPRINTLY_API_KEY']
$product_id = ENV['SPRINTLY_PRODUCT_ID']

$COLUMNS = %w(number type status title score tags last_modified assigned_to created_at created_by short_url email product description)

sprintly = Sprintly.new($user, $password)

def print_header
  $COLUMNS.each do |column|
    print column + ' | '
  end
  puts
end

def print_item(item)
  $COLUMNS.each do |column|
    print item[column].inspect
    print ' | '
  end
  puts
end

def print_all(items)
  items.each do |item|
    print_item(item)
  end
end

print_header
offset = 0

begin
  items = sprintly.items($product_id, {:status => 'backlog,in-progress,completed,accepted', :offset => offset})
  print_all(items)
  offset += items.size
end while items.size > 0
