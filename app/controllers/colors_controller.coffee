angular.module( 'app' ).controller
  colorsController: ($rootScope, $scope, $location) ->

    $scope.savePalette = () ->
      $scope.palettes.push $scope.colors
      localStorage.setItem('palettes', JSON.stringify($scope.palettes))
      $scope.menuOpen = true

    $scope.clearPalettes = () ->
      localStorage.setItem('palettes','[]')
      getPalettes()
      $scope.menuOpen = false
      
    getPalettes = () ->
      $scope.palettes = JSON.parse(localStorage.getItem('palettes'))

    $scope.toggleMenu = () ->
      $scope.menuOpen = !$scope.menuOpen

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
      if (pixelData[0] isnt 0) and (pixelData[1] isnt 0) and (pixelData[2] isnt 0) and (pixelData[3] isnt 0)
        $scope.pickedColor = "rgba(#{pixelData[0]}, #{pixelData[1]}, #{pixelData[2]}, #{pixelData[3]})"
        setRelatedColors($scope.pickedColor)
        $('.selected-color').css('top', $event.offsetY - 12)
        $('.selected-color').css('left', $event.offsetX - 15)
        $scope.selectedColorOffsetY = ''
        $scope.selectedColorOffsetX = ''


    setRelatedColors = () ->

      pickedColorHex = tinycolor($scope.pickedColor).toHexString()

      switch $scope.colorRule
        when 'analogous'
          colors = tinycolor(pickedColorHex).analogous(results = 5)
        when 'monochromatic'
          colors = tinycolor(pickedColorHex).monochromatic(results = 5)
        when 'triad'
          colors = tinycolor(pickedColorHex).triad()
        when 'tetrad'
          colors = tinycolor(pickedColorHex).tetrad()
        when 'split complement'
          colors = tinycolor(pickedColorHex).splitcomplement()
          
      $scope.colors = colors.map (color) ->
        rgb = color.toRgb()
        hex: color.toHexString()
        red: rgb.r
        green: rgb.g
        blue: rgb.b
        alpha: rgb.a
      
    $scope.menuOpen = false
    $scope.pickedColor = 'rgba(252, 211, 66, 0)'
    $scope.colorRule = 'analogous'
    setRelatedColors()

    if localStorage.getItem('palettes') is null then localStorage.setItem('palettes', '[]')

    getPalettes()
