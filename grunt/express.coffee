@express =
  options: 
    opts: ['node_modules/coffee-script/bin/coffee']
    port: 3000
  web: 
    options: 
      server: 'server/server'
      bases: ["./server/public", "app"]
      serverreload: true
      #files: [ 'server/views/**/*.hamlc', 'server/**/*.coffee' ]
      #script: 'server/server'
      #livereload: true
      #debug: true
