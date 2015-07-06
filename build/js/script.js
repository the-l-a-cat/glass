var app;

app = angular.module('app', []);

app.controller('ctrl', function($scope, $http) {
  return $http.get("/content/content.json").success(function(response) {
    return $scope.content = response;
  });
});
