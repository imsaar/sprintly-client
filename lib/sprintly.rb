class Sprintly
  attr_accessor :api_key
  attr_accessor :user

  def initialize(user, api_key)
  	@user = user
  	@api_key = api_key
  end

  def base_url
  	"#{user}:#{api_key} https://sprint.ly/api/"
  end

  def products_url(product_id)
  	base_url + 'products/' + product_id.to_s + "/"
  end

  def product_items_url(product_id, options={})
  	url = products_url(product_id) + 'items.json'
    if !options.empty?
      url += "?"
      options.each do |key, value|
        url += "#{key}=#{value}"
        url += "&"
      end
    end
    url
  end

  # TODO: Make this method testable without depending on external service
  # Returns an ruby Array of Sprint.ly Items
  def items(product_id, options)
    cmd = "curl -s -u #{product_items_url(product_id, options)}"
    result = `#{cmd}`
    JSON.parse(result)
  end

end
