
# Requires MySQL connector
# Install from command line: 
#    pip install mysql-connector==2.1.4
#
# For docs, see: https://dev.mysql.com/doc/connector-python/en/
# See PEP-249 for the API standard: https://www.python.org/dev/peps/pep-0249/

# This example uses the simpledb database located in 
# class/sampledb/simpledb_mysql.sql

from mysql.connector import connect

con = connect(user='root', password='passw0rd', database='simpledb')
cursor = con.cursor()

# Automatically commit INSERT/DELETE/UPDATE
con.autocommit = True

# Execute an INSERT/DELETE/UPDATE statement
cursor.execute("""
    update Product 
    set Quantity = Quantity + 1
    where ProdName = 'Fifi'
""")
print("Updated {} rows.".format(cursor.rowcount))

qty = 5
# Execute a SELECT statement
# See: https://dev.mysql.com/doc/connector-python/en/connector-python-api-mysqlcursor-execute.html
cursor.execute("""
    select ProdId, ProdName, Quantity, ProdNextShipDate
    from product
    where quantity < %s
    """, (qty,) )

# Retrieve results
result = cursor.fetchall()

print("Products with quantity < {}:\n".format(qty))
for row in result:
    (prodId, prodName, quantity, shipDate) = row
    print("{}: {} ({}) ships {}".format(prodId, prodName, quantity, shipDate))

# Execute a stored procedure
result = cursor.callproc('AddNums', (5, 3, 0))
print("Got stored procedure result: " + str(result[2]))



cursor.close()
con.close()
 

