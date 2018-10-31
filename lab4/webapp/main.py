# pylint: disable=E1135,E1136

import bottle
import datetime
import os
import pymysql


app = bottle.Bottle()

db_user = 'root'
db_password = 'put-password-here'
db_name = 'guestbook'
db_connection_name = 'put-instance-connection-name-here'
db_host = '/cloudsql/{}'.format(db_connection_name)
connection = pymysql.connect(user=db_user, password=db_password,
                          unix_socket=db_host, db=db_name)
cursor = connection.cursor()

@app.route('/')
def hello():

    cursor.execute("""
    select guestName, content
    from entries
    """)

    # Retrieve results
    result = cursor.fetchall()

    table = """
        <table>
        <tr>
            <td>Guest
            <td>Comments
        </tr>
        """

    for row in result:
        (guestName, content) = row
        tableRow = f"""
        <tr>
            <td>{guestName}
            <td>{content}
        </tr>
        """
        table += tableRow

    table += "</table>"
    return HTML_DOC.format(table)


HTML_DOC = """<html><body>
        {0}</body></html>"""

# Launch the BottlePy dev server
if __name__ == "__main__":
    bottle.run(host='localhost', debug=True)
