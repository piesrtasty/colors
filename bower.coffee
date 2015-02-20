{name, version, description} = require './package.json'
bower_json = 
  name: name
  version: version
  description: description
  ignore: [ 'node_modules' ]
  dependencies: {}
  
  devDependencies:
    angular:               '<= 1.3'
    'angular-animate':     '<= 1.3'
    'normalize.css':       '3.0.2'
    'angular-ui-router':   '0.2.13'
    'compass-mixins':      '1.0.2'
    'jquery':              '~1.11.1'
    "visionmedia-debug":   "visionmedia/debug#2.1.0"
    # 'ng-modal': '*'
    # 'angular-route': '<= 1.3'

fs = require('fs');
fs.writeFile "bower.json", JSON.stringify( bower_json, null, 2)
