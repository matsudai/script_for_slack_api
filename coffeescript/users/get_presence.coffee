execSync = require('child_process').execSync

DIR_PATH = "#{__dirname}/../../"
SCR_NAME = 'slack_api_users_getPresence.rb'

module.exports = (token, user_id) ->
  cmd = "ruby #{DIR_PATH}#{SCR_NAME} #{token} #{user_id}"
  execSync cmd
