child_process = require 'child_process'
request = require 'request'

module.exports.Http = class

  @get: (url, parameters, callback) ->
    if callback?
      @get_async url, parameters, callback
    else
      @get_sync url, parameters

  @get_json: (url, parameters, callback) ->
    if callback?
      @get_async_json url, parameters, callback
    else
      @get_sync_json url, parameters

  @request_url: (url, parameters) ->
    url_parameter = ("#{k}=#{v}" for k, v of parameters).join('&')
    req = url
    req += '?' + url_parameter if url_parameter.length > 0

  @get_sync: (url, parameters) ->
    req = @request_url url, parameters
    '' + child_process.execSync 'curl --silent --get "' + req + '"'

  @get_sync_json: (url, parameters) ->
    string = @get_sync url, parameters
    JSON.parse string

  @get_async: (url, parameters, callback) ->
    req = @request_url url, parameters
    request.get {url: req}, callback

  @get_async_json: (url, parameters, callback) ->
    req = @request_url url, parameters
    request.get {url: req, json: true}, callback
