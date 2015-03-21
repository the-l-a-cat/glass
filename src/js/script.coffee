
origin = 'http://www.mediawiki.org'
api_endpoint = 'http://en.wikipedia.org/w/api.php'
api_url = (request) -> [api_endpoint, $.param request] .join '?'

app = angular.module 'app', []
app.controller 'ctrl', ($scope, $http) ->

    $http.get api_url
        'origin': origin
        'action': 'opensearch'
        'search': 'black art'
    .success (response) ->
        response[1] .forEach (title) ->

            $http.get api_url
                'origin': origin
                'action': 'query'
                'continue': ''
                'format': 'json'
                'titles': title
                'prop': 'info'
                'inprop': 'displaytitle'

            .success (response) ->
                alert JSON.stringify response



