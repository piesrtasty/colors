fs = require 'fs'

if fs.existsSync('.env')
  env = require 'node-env-file'
  env __dirname + '/../.env'

{app, express} = require './express'
require( './routes' )(app)

port = process.env.PORT || 5000

server = app.listen port, ->
  console.log "Server listening on port #{port}"

module.exports = app