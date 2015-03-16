app = angular.module 'app', []
app.controller 'ctrl', ($scope, $http) ->
    $http.get "/content/content.json"
        .success (response) -> $scope.content = response


