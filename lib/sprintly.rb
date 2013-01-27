class Sprintly
  attr_accessor :api_key
  attr_accessor :user

  def initialize(user, api_key)
  	@user = user
  	@api_key = api_key
  end

  def base_url
  	"#{@user}:#{@api_key} https://sprint.ly/api/"
  end

  def products_url(product_id)
  	base_url + 'products/' + product_id.to_s + "/"
  end

  def product_items_url(product_id)
  	products_url(product_id) + 'items.json'
  end

end
