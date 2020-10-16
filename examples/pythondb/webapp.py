# To use this app:
#   pip install flask

from flask import Flask, request
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def hello():
    if 'name' in request.args:
        name = request.args['name']
    else:
        name = "world"
    return """<html><body>
        <h1>Hello, {0}!</h1>
        The time is {1}.</body></html>""".format(
            name, str(datetime.now()))

# Launch the local web server
if __name__ == "__main__":
    app.run(host='localhost', debug=True)
    
