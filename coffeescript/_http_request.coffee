child_process = require 'child_process'

module.exports.Http = class
  
  @get: (url, parameters = {}) =>
    url_parameter = ("#{k}=#{v}" for k, v of parameters).join('&')
    url += '?' + url_parameter if url_parameter.length > 0
    '' + child_process.execSync "curl --silent --get #{url}"

  @get_json: (url, parameters = {}) =>
    string = @get url, parameters
    JSON.parse string
