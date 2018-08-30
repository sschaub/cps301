# To use this app:
#   pip install bottle

import bottle
from datetime import datetime

@bottle.route('/')
def hello():
    name = bottle.request.params['name']
    return """<html><body>
        <h1>Hello, {0}!</h1>
        The time is {1}.</body></html>""".format(
            name, str(datetime.now()))

# Launch the BottlePy dev server
if __name__ == "__main__":
    bottle.run(host='localhost', debug=True)

