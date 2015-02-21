@watch =
  options: 
    serverreload: true
  assets: 
    files: [ 'app/**/*.*' ]
    tasks: [ 'live_reload' ]
    #tasks: [ 'live_reload', 'shell:touch_server' ]
    #tasks: [ 'shell:touch_server', 'assets_precompile' ]

  # express: 
  #   files: [ 'server/views/**/*.hamlc', 'server/**/*.coffee' ]
  #   tasks: [ 'express:web' ]
  #   options: 
  #     spawn: false
  #     reload: true
