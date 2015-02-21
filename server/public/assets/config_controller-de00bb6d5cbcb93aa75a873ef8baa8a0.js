angular.module('app').controller({
  configController: function($scope, configService) {
    return $scope.init = function(config) {
      return configService.load_config(config);
    };
  }
});