child_process = require 'child_process'

module.exports = class
  _DIR_PATH = "#{__dirname}/../../"
  _SCR_NAME = 'slack_api_users_list.rb'

  @get: (token) ->
    cmd = "ruby #{_DIR_PATH}#{_SCR_NAME} #{token}"
    user_list = {}
    result = child_process.execSync cmd
    json_data = JSON.parse result
    for key, val of json_data
      user_list[key] = val
    return user_list
