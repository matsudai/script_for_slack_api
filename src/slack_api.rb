require_relative 'slack_api_users'

class SlackAPI
  
  @@URL = 'https://slack.com/api/'
  
  class << self
    def users
      Users.new @@URL
    end
  end
end
