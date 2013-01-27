require 'rest_client'

RestClient.get 'https://user:password@example.com/private/resource', {:accept => :json}
