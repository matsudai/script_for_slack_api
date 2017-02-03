require 'net/http'
require 'uri'

def http_get (request_url)
  uri = URI.parse request_url
  result = Net::HTTP.get uri
end
