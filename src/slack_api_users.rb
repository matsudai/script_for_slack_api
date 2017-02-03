require_relative 'http_get'
require 'json'

class Users
  
  @@URL_PREFIX = 'users'
  attr_accessor :url

  def initialize (url_parent)
    @url = url_parent + @@URL_PREFIX
  end

  def list (token)
    request = @url + ".list" + "?token=#{token}"
    response = http_get request
    data = JSON.parse response
    members = {}
    data["members"].each do |member|
      members[member["name"]] = member["id"]
    end
    members.to_json
  end

  def get_presence (token, user_id)
    request = @url + ".getPresence" + "?token=#{token}" + "&user=#{user_id}"
    response = http_get request
    data = JSON.parse response
    data["presence"]
  end
end
