path = require 'path'
fs = require 'fs'

module.exports = (grunt) ->
  # require the grunt packages in package.json
  require('load-grunt-tasks') grunt

  # not sure why but couldn't get load-grunt-config to work, but this does basically same thing.
  config = {}
  for file in fs.readdirSync( './grunt' )
    continue unless file.match( /\.coffee$/ )
    plugin = file.replace( '.coffee', '' )
    obj = require "./grunt/#{plugin}"
    config[plugin] = obj[plugin] if obj?

  grunt.initConfig config

  # grunt.registerTask 'server', ['express:web', 'express-keepalive']
  # grunt.registerTask 'server', ['express:web', 'watch']
  # grunt.registerTask 'server', ['nodemon:dev']
  grunt.registerTask "default", ["dev"]
  grunt.registerTask "dev", ["concurrent:dev"]
  grunt.registerTask "package", ["shell:package"]
  grunt.registerTask "bower", ["shell:bower"]
  grunt.registerTask "live_reload", ["shell:live_reload_curl"]
  grunt.registerTask 'assets_precompile', ['clean:assets', 'shell:assets_precompile']