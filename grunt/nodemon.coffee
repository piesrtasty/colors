@nodemon =
  dev: 
    script: 'server/server.coffee'
    options: 
      ignore: ['node_modules/**']
      watch: ['server', 'server/assets']
      # nodeArgs: ['--debug'],
      # cwd: __dirname
      # ext: 'js,coffee'
      # delay: 1000
      # args: ['dev']
      # callback:  (nodemon)->
      #   nodemon.on('log', function (event) {
      #     console.log(event.colour);
      # env:  
      #   PORT: '4000'
  # exec: 
  #   options: 
  #     exec: 'less'
