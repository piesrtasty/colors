angular.module( 'app' ).controller
  configController: ($scope, configService) ->
    $scope.init = ( config ) ->
      configService.load_config config