require_relative 'src/slack_api'

token = ARGV[0]
print SlackAPI.users.list token
