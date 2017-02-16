require 'net/http'
require 'uri'

def http_get (url)
  request = URI.parse url
  result = Net::HTTP.get request
end

def http_gets (urls)
  
  if urls.kind_of? Hash
    responses = {}
    threads = urls.map { |key, url|
      Thread.new(key, url) { |key, url|
        responses[key] =  Net::HTTP.get URI.parse url
      }
    }
    threads.each { |thread| thread.join }
    return responses
  elsif urls.kind_of? Array
    responses = Array.new urls.length
    threads = urls.map.with_index { |url, index|
      Thread.new(url, index) { |url, index|
        responses[index] = Net::HTTP.get URI.parse url
      }
    }
    threads.each { |thread| thread.join }
    return responses
  else
    raise "http_gets() : Arge's type is not Hash or Array !!"
  end
end
