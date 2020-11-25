# Requires the Bottle and MySQL libraries
# To use this app:
#   pip install mysql-connector-python
#   pip install flask


from flask import Flask, request
from datetime import datetime
import time
from mysql.connector import connect
import dbconfig

app = Flask(__name__)

@app.route('/')
def hello():
    qty = 0
    qty = request.args.get('qty')

    # We don't close the following explicitly because they are automatically closed
    # when the variables go out of scope when hello() returns
    con = connect(user=dbconfig.DB_USER, password=dbconfig.DB_PASS, database=dbconfig.DB_NAME, host=dbconfig.DB_HOST) 
    cursor = con.cursor() 
    con.autocommit = True

    cursor.execute("""
        select ProdId, ProdName, Quantity, ProdNextShipDate
        from product
        where Quantity < %s
    """, (qty, ))

    # SQL Injection vulnerability here:
    # cursor.execute(f"""
    # select ProdId, ProdName, Quantity, ProdNextShipDate
    # from product
    # where Quantity < {qty}
    # """)  # Also try   ProdName = '{0}'    

    # Retrieve results
    result = cursor.fetchall()

    tableRows = ""
    for row in result:
        (prodId, prodName, quantity, shipDate) = row
        tableRow = f"""
        <tr>
            <td>{prodId}
            <td>{prodName}
            <td>{quantity}
            <td>{shipDate}
        </tr>
        """
        tableRows += tableRow

    return HTML_DOC.format(tableRows)

HTML_DOC = """<html><body>
        <form>
          Show products with quantity less than: <input type='text' name='qty' value=''>
          <input type='submit' value='Go!'>
        </form>
        <table border='1'>
        <tr>
            <td>Product ID
            <td>Product Name
            <td>Quantity
            <td>Next Ship Date
        </tr>        
        {0}
        </table>
        </body></html>"""

# Launch the local web server
if __name__ == "__main__":
    app.run(host='localhost', debug=True)
    
