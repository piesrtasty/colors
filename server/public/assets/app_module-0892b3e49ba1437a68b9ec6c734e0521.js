var app;

app = angular.module('app', ['ui.router', 'ngAnimate']);

app.config(function($stateProvider, $urlRouterProvider, $locationProvider) {
  $locationProvider.html5Mode({
    enabled: true,
    requireBase: false
  });
  $urlRouterProvider.otherwise("/");
  return $stateProvider.state("colors", {
    url: "/",
    templateUrl: "html/colors",
    controller: "colorsController"
  });
});

app.run(function($rootScope) {});