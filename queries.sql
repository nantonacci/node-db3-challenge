-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName,
       CategoryName
  FROM Product
       JOIN
       Category ON categoryid = category.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id,
       s.companyname
  FROM Shipper AS s
       JOIN
       [order] AS o
 WHERE o.orderdate < '2012-08-09' AND 
       o.shipvia = s.id;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName,
       o.Quantity
  FROM OrderDetail AS o
       JOIN
       Product AS p
 WHERE o.productid = p.id AND 
       o.orderid = '10251'
 ORDER BY p.productname;
 
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.id,
       c.companyname,
       e.lastname
  FROM [order] AS o
       JOIN
       customer AS c
       JOIN
       employee AS e
 WHERE customerid = c.id AND 
       employeeid = e.id;
       