angular.module( 'app' ).controller
  colorsController: ($rootScope, $scope, $location) ->
    
  	$scope.selectColor = ($event) ->
      @img = $event.target
      @canvas = $('<canvas />')[0]
      @canvas.width = @img.width
      @canvas.height = @img.height
      @canvas.getContext('2d').drawImage @img, 0, 0, @img.width, @img.height
      pixelData = @canvas.getContext('2d').getImageData($event.offsetX, $event.offsetY, 1, 1).data
      $scope.pickedColor = "rgba(#{pixelData[0]}, #{pixelData[1]}, #{pixelData[2]}, #{pixelData[3]})"

    $scope.pickedColor = 'rgba(0, 0, 0, 0)'