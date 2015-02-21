cwd = __dirname.replace( '/grunt', '' )

@shell = 
  options: 
    failOnError: true
    stdout:      true
    stderr:      true

  package: 
    command: 'coffee package.coffee; npm install'
  
  bower: 
    command: 'coffee bower.coffee; bower install'
  
  assets_precompile: 
    command: "connect-assets -i 'app/images' -i 'app/javascripts' -i 'app/modules' -i 'app/css' -i 'server/public/bower' -o 'server/public/assets' -s 'http://localhost:5000' -gz"

  touch_server: 
    command: "sed -i.bck '$s/$/ /' server/server.coffee"

  live_reload_curl: 
    command: "curl -X POST http://localhost:35729/changed?files=js/app.js"
  
  tinylr: 
    command: "coffee server/live_reload.coffee"