//REF : https://neo4j.com/developer/desktop-csv-import/
// download the zip file and complete the course

LOAD CSV FROM 'file:///products.csv' AS row RETURN count(row)

LOAD CSV WITH HEADERS FROM 'file:///desktop-csv-import/orders.csv' AS row
RETURN count(row)

LOAD CSV WITH HEADERS FROM 'file:///desktop-csv-import/order-details.csv' AS row
RETURN count(row)

//view data rows in products.csv
LOAD CSV FROM 'file:///desktop-csv-import/products.csv' AS row
RETURN row
LIMIT 3

//count data rows in orders.csv (headers)
LOAD CSV WITH HEADERS FROM 'file:///desktop-csv-import/orders.csv' AS row
RETURN row
LIMIT 5

//count data rows in order-details.csv (headers)
LOAD CSV WITH HEADERS FROM 'file:///desktop-csv-import/order-details.csv' AS row
RETURN row
LIMIT 8

// cast data while loading : 
LOAD CSV WITH HEADERS FROM 'file:///orders.csv' AS row
WITH toInteger(row.orderID) AS orderId, datetime(replace(row.orderDate,' ','T')) AS orderDate, row.shipCountry AS country
RETURN orderId, orderDate, country
LIMIT 5

LOAD CSV FROM 'file:///products.csv' AS row
WITH toInteger(row[0]) AS productId, row[1] AS productName, toFloat(row[2]) AS unitCost
RETURN productId, productName, unitCost
LIMIT 3

//----------------- loading and modelling data:

CREATE CONSTRAINT ON (p:Product) ASSERT p.id IS UNIQUE;
CREATE CONSTRAINT ON (o:Order) ASSERT o.id IS UNIQUE;

// load products
LOAD CSV FROM 'file:///desktop-csv-import/products.csv' AS row
WITH toInteger(row[0]) AS productId, row[1] AS productName, toFloat(row[2]) AS unitCost
MERGE (p:Product {productId: productId})
  SET p.productName = productName, p.unitCost = unitCost
RETURN count(p)

// load orders
LOAD CSV WITH HEADERS FROM 'file:///orders.csv' AS row
WITH toInteger(row.orderID) AS orderId, datetime(replace(row.orderDate,' ','T')) AS orderDate, row.shipCountry AS country
MERGE (o:Order {orderId: orderId})
  SET o.orderDateTime = orderDate, o.shipCountry = country
RETURN count(o)

// using the periodic commits  - *** important tips
// ? FIXME:periodic commits
USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM 'file:///desktop-csv-import/order-details.csv' AS row
WITH toInteger(row.productID) AS productId, toInteger(row.orderID) AS orderId, toInteger(row.quantity) AS quantityOrdered
MATCH (p:Product {productId: productId})
MATCH (o:Order {orderId: orderId})
MERGE (o)-[rel:CONTAINS {quantityOrdered: quantityOrdered}]->(p)
RETURN count(rel)