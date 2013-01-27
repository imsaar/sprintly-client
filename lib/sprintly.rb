class Sprintly
  attr_accessor :api_key
  attr_accessor :user

  def initialize(user, api_key)
  	@user = user
  	@api_key = api_key
  end

  def base_url
  	"#{user}:#{api_key} 'https://sprint.ly/api/"
  end

  def products_url(product_id)
  	base_url + 'products/' + product_id.to_s + "/"
  end

  def product_items_url(product_id, options={}, format='json')
  	url = products_url(product_id) + 'items.' + format
    if !options.empty?
      url += "?"
      options.each do |key, value|
        url += "#{key}=#{value}"
        url += "&"
      end
      url.chop!
    end
    url += "'"
  end

  # TODO: Make this method testable without depending on external service
  # Returns an ruby Array of Sprint.ly Items
  def items(product_id, options)
    JSON.parse(items_json(product_id, options))
  end

  def items_json(product_id, options)
    content_fetcher(product_items_url(product_id, options))
  end

  def items_csv(product_id, options)
    content_fetcher(product_items_url(product_id, options, 'csv'))
  end

  # if we make content fetcher an external object and pass it as initialize
  # argument then we can inject the dependency to increase testability
  def content_fetcher(sprintly_url)
    cmd = "curl -s -u #{sprintly_url}"
    `#{cmd}`
  end

end
