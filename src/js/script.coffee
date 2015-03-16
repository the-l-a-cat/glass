ajax_args = 
        'url': '/content/content.json'
        'dataType': 'json'
        'contentType': 'application/json'
        'success': (data) -> console.log data['content'][0]['stub']

$.ajax ajax_args




