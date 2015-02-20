fs = require('fs')
package_json =
  name: 'colors'
  version: fs.readFileSync( 'VERSION', "utf8" ).replace(/(\n|\r)+$/, '')
  description: 'colors'
  repository: 
    type: 'git'
    url:  ''
  scripts:
    postinstall: "./node_modules/bower/bin/bower install"
  dependencies:
    'coffee-script': '*'
    bower: '*'
    express: '*'
    morgan: '*'
    'node-sass': '<1.1'
    'express-partials': '*'
    'express-session': '*'
    'connect-assets': '*'
    'body-parser': '*'
    'haml-coffee': '*'
    'node-env-file': '*'
    # "socket.io": "~0.9.16"
    request: '*'

  devDependencies:
    debug: '*'
    grunt: '*'
    'grunt-contrib-watch': '*'
    'grunt-contrib-clean': '*'
    'grunt-cli': '*'
    'grunt-shell': '*'
    'grunt-express': '*'
    'grunt-concurrent': '*'
    'grunt-nodemon': '*'
    'load-grunt-tasks': '*'
    'tiny-lr' : '*'

fs.writeFile "package.json", JSON.stringify( package_json, null, 2)