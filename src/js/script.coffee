
origin = 'http://kindrom.wikiversity.org'
api_endpoint = 'http://en.wikipedia.org/w/api.php'
api_url = (request) -> [api_endpoint, $.param request] .join '?'
content = {}

app = angular.module 'app', []
app.controller 'ctrl', ($scope, $http) ->

    $http.get api_url
        'origin': origin
        'action': 'opensearch'
        'search': 'black art'
    .success (response) ->
        async.map response[1]
        , (title, callback) ->
            $http.get api_url
                'origin': origin
                'action': 'query'
                'continue': ''
                'format': 'json'
                'titles': title
                'prop': 'info'
                'inprop': 'displaytitle'

            .success (response) ->
                callback null, response
        , (err, results) -> $scope.content = results .map (obj) ->

            obj = obj['query']['pages']
            key = Object.keys(obj)[0]
            obj = obj[key]
            'stub': obj['pageid']
            'header': obj['displaytitle']
            'text': obj['pageid']

