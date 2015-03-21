
origin = 'http://kindrom.wikiversity.org'
api_endpoint = 'http://en.wikipedia.org/w/api.php'
api_url = (request) ->
    [api_endpoint, $.param append request, 'origin', origin] .join '?'
content = {}

app = angular.module 'app', []
app.controller 'ctrl', ($scope, $http) ->

    $http.get api_url
        'action': 'opensearch'
        'search': 'black art'
    .success (response) ->
        async.map response[1]
        , (obj, callback) ->
            $http.get api_url
                'action': 'query'
                'continue': ''
                'format': 'json'
                'titles': obj
                'prop': 'info'
                'inprop': 'displaytitle'

            .success (response) ->
                callback null, response
        , (err, results) ->
            ripped = results.map rip
            async.map ripped
            , (item, callback) ->
                $http.get api_url
                        'action': 'query'
                        'continue': ''
                        'format': 'json'
                        'pageids': item['pageid']
                        'prop': 'revisions'
                        'rvprop': 'content'
                        'redirects': 1
                    .success (response) ->
                        callback null, response
            , (err, results) -> $scope.content = (results.map rip) .map (obj) ->
                                                        'header': obj['title']
                                                        'stub': obj['pageid']
                                                        'text': obj['revisions'] .map (obj) -> obj['*']

rip = (obj) ->
            obj = obj['query']['pages']
            key = Object.keys(obj)[0]
            obj[key]

append = (obj, key, val) ->
        obj[key] = val
        obj

