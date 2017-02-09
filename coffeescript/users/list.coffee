child_process = require 'child_process'

DIR_PATH = "#{__dirname}/../../"
SCR_NAME = 'slack_api_users_list.rb'

module.exports = (token) ->
  cmd = "ruby #{DIR_PATH}#{SCR_NAME} #{token}"
  user_list = {}
  result = child_process.execSync cmd
  json_data = JSON.parse result
  for key, val of json_data
    user_list[key] = val
  return user_list
