@concurrent =
  options: 
    logConcurrentOutput: true
  dev: 
    tasks: ["nodemon:dev", "watch", "shell:tinylr"]
