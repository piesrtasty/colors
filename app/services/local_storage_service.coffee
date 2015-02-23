angular.module( 'app' ).factory '$localStorage', () ->

  set: (key, value) ->
    localStorage[key] = value

  get: (key, defaultValue) ->
    localStorage[key] or defaultValue

  setObject: (key, value) ->
    localStorage[key] = JSON.stringify(value)
  
  getObject: (key) ->
    JSON.parse localStorage[key] or '{}'


