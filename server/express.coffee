@express = require 'express'
body_parser = require 'body-parser'
partials = require 'express-partials'
morgan = require 'morgan'
path = require 'path'
haml_coffee = require('haml-coffee')
fs = require 'fs'

@app = @express()
@app.use body_parser.json()
@app.use @express.static __dirname + '/public'
@app.use @express.static path.resolve( __dirname, '../app/images' )
@app.use morgan('combined')
@app.use partials()

# Assets
asset_config =
  paths: [
    'app/fonts'
    'app/images'
    'app/modules'
    'app/directives'
    'app/controllers'
    'app/services'
    'app/html'
    'app/javascripts'
    'app/css'
    'server/public/bower'
    'app/vendor/javascripts'
  ]
  servePath: process.env.ASSETS_PATH
  buildDir: 'server/public/assets'
  compress: false

connect_assets = require("connect-assets") asset_config
@app.use connect_assets unless process.env.NODE_ENV is 'production'

# HAMLC
@app.engine 'hamlc', haml_coffee.__express

@app.set 'views', path.join( __dirname, 'views' )
@app.set 'view engine', 'hamlc'

# HAMLC Helpers
GLOBAL.HAML = haml_coffee
GLOBAL.render_partial = (partial, context={}) ->
  data = fs.readFileSync("#{__dirname}/../app/html/#{partial}.hamlc").toString()
  tmpl = haml_coffee.compile data
  html = tmpl(context)