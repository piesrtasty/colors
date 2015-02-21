# Had problems with grunt watch & livereload in the past 
# this server sets up a live reload server using tiny-lr
# 
# To run:
#   
#   coffee server/live_reload
#
tinylr = require 'tiny-lr'

port = 35729 # standard port 

tinylr().listen port, ->
  console.log 'tinylr Listening on %s ...', port
# var tinylr = require('tiny-lr');
# 
# // standard LiveReload port
# var port = 35729;
# 
# // tinylr(opts) => new tinylr.Server(opts);
# tinylr().listen(port, function() {
#   console.log('... Listening on %s ...', port);
# })
