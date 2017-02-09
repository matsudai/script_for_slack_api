execSync = require('child_process').execSync

module.exports = class
  _DIR_PATH = "#{__dirname}/../../"
  _SCR_NAME = 'slack_api_users_getPresence.rb'

  @get: (token, user_id) ->
    cmd = "ruby #{_DIR_PATH}#{_SCR_NAME} #{token} #{user_id}"
    result = execSync cmd
