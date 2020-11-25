
# Requires the mysql.connector Python library
# To use this app:
#   pip install mysql-connector-python
# 
# For docs, see: https://dev.mysql.com/doc/connector-python/en/connector-python-examples.html
# See PEP-249 for the API standard: https://www.python.org/dev/peps/pep-0249/

# This example uses the simpledb database located in 
# class/sampledb/simpledb_mysql.sql

from mysql.connector import connect
import dbconfig

con = connect(user=dbconfig.DB_USER, password=dbconfig.DB_PASS, database=dbconfig.DB_NAME, host=dbconfig.DB_HOST)
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

desc = "O'Rourke"
qty = 3
cursor.execute("""
    update Product 
    set Quantity = Quantity + %s
    where ProdName = %s
""", (qty, desc))
print("Updated {} rows.".format(cursor.rowcount))

# Danger: Sharks lurk here.
desc = input('Name of product:')
# desc = desc.replace("'", "''")
cursor.execute(f"""
    update Product 
    set Quantity = Quantity + {qty}
    where ProdName = '{desc}'
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
print('result = ', result)

print("Products with quantity < {}:\n".format(qty))
for row in result:
    (prodId, prodName, quantity, shipDate) = row
    print("{}: {} ({}) ships {}".format(prodId, prodName, quantity, shipDate))

# Execute a stored procedure that returns an OUT parameter
result = cursor.callproc('AddNums', (5, 3, 0))
# Access the value of the OUT parameter (the third parameter)
print("Got stored procedure result: " + str(result[2]))

# Execute a stored procedure that returns a result set
result = cursor.callproc('GetProducts')

# Retrieve result set
result_set = next(cursor.stored_results())
result = result_set.fetchall()
# print out the result
print(result)

cursor.close()
con.close()


