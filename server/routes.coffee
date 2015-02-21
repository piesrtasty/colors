
env_config = ->
  config =
    layout: 'layout'
  config

module.exports = (app) ->

  app.get '/', (req, res)->
    console.log env_config()
    res.render 'index', { config: env_config() }

  app.get '/html/(*)', (req, res)->
    path = req.params[0]
    res.render "../../app/html/#{path}", { layout: null }

  app.get '*', (req, res)->
    res.render 'index', { config: env_config() }