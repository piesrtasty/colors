angular.module( 'app' ).factory 'configService', () ->
  
  load_config: (config)->
    @_config ||= {}
    for k,v of config
      @_config[k] = v
    @_config

  env: (property)->
    @_config[property]