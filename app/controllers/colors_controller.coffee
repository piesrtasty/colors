angular.module( 'app' ).controller
  colorsController: ($rootScope, $scope, $location) ->
    
    $scope.pickColorRule = (colorRule) ->
      $scope.colorRule = colorRule
      setRelatedColors()

    $scope.pickColor = ($event) ->
      @img = $event.target
      @canvas = $('<canvas />')[0]
      @canvas.width = @img.width
      @canvas.height = @img.height
      @canvas.getContext('2d').drawImage @img, 0, 0, @img.width, @img.height
      pixelData = @canvas.getContext('2d').getImageData($event.offsetX, $event.offsetY, 1, 1).data
      $scope.pickedColor = "rgba(#{pixelData[0]}, #{pixelData[1]}, #{pixelData[2]}, #{pixelData[3]})"
      setRelatedColors($scope.pickedColor)


    setRelatedColors = () ->

      pickedColorHex = tinycolor($scope.pickedColor).toHexString()

      switch $scope.colorRule
        when 'analogous'
          colors = tinycolor(pickedColorHex).analogous(results = 5)
        when 'monochromatic'
          colors = tinycolor(pickedColorHex).monochromatic(results = 5)
        when 'triad'
          console.log 'triad'
        when 'tetrad'
          console.log 'tetrad'
        when 'split complement'
          console.log 'splitcomplement'
          
      $scope.colors = colors.map (color) ->
        rgb = color.toRgb()
        hex: color.toHexString()
        red: rgb.r
        green: rgb.g
        blue: rgb.b
        alpha: rgb.a
      


      


    $scope.pickedColor = 'rgba(0, 0, 0, 0)'
    $scope.colorRule = 'analogous'