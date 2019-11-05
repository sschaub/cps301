# Requires the Bottle and MySQL libraries
# To use this app:
#   pip install mysql-connector-python


import bottle
from datetime import datetime
import time
from mysql.connector import connect
import dbconfig

@bottle.route('/')
def hello():
    qty = 0
    if 'qty' in bottle.request.params:
        qty = bottle.request.params['qty']

    # We don't close the following explicitly because they are automatically closed
    # when the variables go out of scope when hello() returns
    con = connect(user=dbconfig.DB_USER, password=dbconfig.DB_PASS, database='simpledb', host=dbconfig.DB_HOST) 
    cursor = con.cursor() 

    cursor.execute("""
    select ProdId, ProdName, Quantity, ProdNextShipDate
    from product
    where Quantity < %s
    """, (qty, ))

    # Retrieve results
    result = cursor.fetchall()

    table = """
        <table>
        <tr>
            <td>Product ID
            <td>Product Name
            <td>Quantity
            <td>Next Ship Date
        </tr>
        """

    for row in result:
        (prodId, prodName, quantity, shipDate) = row
        tableRow = """
        <tr>
            <td>{0}
            <td>{1}
            <td>{2}
            <td>{3}
        </tr>
        """.format(prodId, prodName, quantity, shipDate)
        table += tableRow

    table += "</table>"
    return HTML_DOC.format(
            table)

HTML_DOC = """<html><body>
        <form>
          Show products with quantity less than: <input type='text' name='qty' value=''>
          <input type='submit' value='Go!'>
        </form>
        {0}</body></html>"""

# Launch the BottlePy dev server
if __name__ == "__main__":
    bottle.run(host='', port=8080, debug=True)

