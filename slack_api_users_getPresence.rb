require_relative 'src/slack_api'

token, user_id = ARGV[0], ARGV[1]

print SlackAPI.users.get_presence token, user_id
