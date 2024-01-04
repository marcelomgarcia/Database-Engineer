# Database Engineer

## Docker Container

Starting the containers:

```
PS C:\Users\mgarcia\Work\Database-Engineer> docker compose up -d
```

Accessing the MySQL container

```
PS C:\Users\mg> docker exec -it database-engineer-db-1 /bin/bash
bash-4.4# mysql -u root -p
```

or connecting to MySQL directly from the `docker` command

```
PS C:\Users\garcm0b\Work\Database-Engineer> docker exec -it database-engineer-db-1 mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.1.0 MySQL Community Server - GPL
(...)
```

## Join

Doing a _left inner_ on the _little lemon_ database

```sql
mysql> SELECT cc.FullName AS "Full Name", cc.PhoneNumber AS "Phone Number", bb.BookingDate as "Booking Date", bb.NumberOfGuests as "Number Guests" FROM Customers as cc INNER JOIN Bookings AS bb ON cc.CustomerID = bb.CustomerID;
```

The result should be like

```
+------------------+--------------+--------------+---------------+
| Full Name        | Phone Number | Booking Date | Number Guests |
+------------------+--------------+--------------+---------------+
| Vanessa McCarthy |    757536378 | 2021-11-11   |             5 |
| Marcos Romero    |    757536379 | 2021-11-10   |             2 |
| Anna Iversen     |    757536375 | 2021-11-10   |             2 |
+------------------+--------------+--------------+---------------+
3 rows in set (0.00 sec)
```

And a _left join_

```
mysql> SELECT cc.CustomerID, bb.BookingID FROM Customers as cc LEFT JOIN Bookings as bb ON cc.CustomerID = bb.CustomerID;
+------------+-----------+
| CustomerID | BookingID |
+------------+-----------+
|          5 |      NULL |
|          4 |        12 |
|          3 |      NULL |
|          1 |        10 |
|          2 |        11 |
+------------+-----------+
5 rows in set (0.00 sec)
```

## Subquery

Using subqueries

Create a `SELECT` statement to retrieve all bookings after Vanessa's booking:

```
mysql> SELECT * FROM Bookings;
+-----------+---------+----------------+---------------+-------------+------------+
| BookingID | TableNo | GuestFirstName | GuestLastName | BookingSlot | EmployeeID |
+-----------+---------+----------------+---------------+-------------+------------+
|         1 |      12 | Anna           | Iversen       | 19:00:00    |          1 |
|         2 |      12 | Joakim         | Iversen       | 19:00:00    |          1 |
|         3 |      19 | Vanessa        | McCarthy      | 15:00:00    |          3 |
|         4 |      15 | Marcos         | Romero        | 17:30:00    |          4 |
|         5 |       5 | Hiroki         | Yamane        | 18:30:00    |          2 |
|         6 |       8 | Diana          | Pinto         | 20:00:00    |          5 |
+-----------+---------+----------------+---------------+-------------+------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Bookings WHERE TIME(BookingSlot) > (SELECT BookingSlot FROM Bookings WHERE GuestFirstName = "Vanessa");
+-----------+---------+----------------+---------------+-------------+------------+
| BookingID | TableNo | GuestFirstName | GuestLastName | BookingSlot | EmployeeID |
+-----------+---------+----------------+---------------+-------------+------------+
|         1 |      12 | Anna           | Iversen       | 19:00:00    |          1 |
|         2 |      12 | Joakim         | Iversen       | 19:00:00    |          1 |
|         4 |      15 | Marcos         | Romero        | 17:30:00    |          4 |
|         5 |       5 | Hiroki         | Yamane        | 18:30:00    |          2 |
|         6 |       8 | Diana          | Pinto         | 20:00:00    |          5 |
+-----------+---------+----------------+---------------+-------------+------------+
5 rows in set (0.00 sec)
```

## Triggers

Execute a trigger after inserting value in a table.

First copy the scrpit to the container:

```
PS C:\Users\mgarcia\Work\Database-Engineer> docker cp mysql_trigger_lab.sql  130034af683b:/tmp
Successfully copied 2.05kB to 130034af683b:/tmp
PS C:\Users\mgarcia\Work\Database-Engineer>
```

Then execute the script in MySQL

```
mysql> SOURCE /tmp/mysql_trigger_lab.sql
Query OK, 0 rows affected (0.03 sec)
```

## Optimization

> Removed the previous DB, and create a new one from `luckyshrub_db_4.sql`
>
> ```
> a-garcm0b@library-docker-test:~/Work/Database-Engineer$ docker ps
> (...)
> 1917dad7b127   mysql        "docker-entrypoint.s…"
> a-garcm0b@library-docker-test:~/Work/Database-Engineer$ docker cp luckyshrub_db_4.sql 1917dad7b127:/tmp
> Successfully copied 5.12kB to 1917dad7b127:/tmp
> (...)
> mysql> drop database Lucky_Shrub;
> mysql> source /tmp/luckyshrub_db_4.sql
> ```
>
> Use a list of columns that are needed instead of all ('\*'):

```
mysql> select OrderID, ProductID, Quantity, Date from Orders;
+---------+-----------+----------+------------+
| OrderID | ProductID | Quantity | Date       |
+---------+-----------+----------+------------+
|       1 | P1        |       10 | 2020-09-01 |
|       2 | P2        |        5 | 2020-09-05 |
(...)
```

Create an index to improve performance of the queries. Before creating the index

```
mysql> explain select * from Orders where ClientID = 'Cl1';
+----+-------------+--------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table  | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+--------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | Orders | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   29 |    10.00 | Using where |
+----+-------------+--------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)
```

Create the index:

```
mysql> create index IdxClientID on Orders (ClientID);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

Check the plan again, and note the field `key`:

```
mysql>
mysql> explain select * from Orders where ClientID = 'Cl1';
+----+-------------+--------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
| id | select_type | table  | partitions | type | possible_keys | key         | key_len | ref   | rows | filtered | Extra |
+----+-------------+--------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | Orders | NULL       | ref  | IdxClientID   | IdxClientID | 43      | const |    8 |   100.00 | NULL  |
+----+-------------+--------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)
```

Avoid using leading wildcard, like this

```sql
mysql> SELECT * FROM Employees WHERE FullName LIKE '%Tolo';
```

Instead create a new column, `ReverseFullName` and create an index on tha column

First testing the `ReverseFullName`:

```sql
mysql> select concat(trim(substring(FullName, locate(' ', FullName))), ' ', substring_index(FullName, ' ', 1)) as ReverseFullName from Employees;
```

Now we can create the new column and populate it

```sql
mysql> alter table Employees add column ReverseFullName varchar(100);
mysql> update Employees set ReverseFullName = concat(trim(substring(FullName, locate(' ', FullName))), ' ', substring_index(FullName, ' ', 1));
mysql> select FullName, ReverseFullName from Employees;
+------------------+------------------+
| FullName         | ReverseFullName  |
+------------------+------------------+
| Seamus Hogan     | Hogan Seamus     |
(...)
```

Comparing the two approaches to check the use of index. Here with the leading wildcard, the index is not used:

```
mysql> create index IdxFullName on Employees (FullName);
mysql> explain SELECT * FROM Employees WHERE FullName LIKE '%Tolo';
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | Employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    8 |    12.50 | Using where |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

mysql>
```

On the other hand, with a trailing wildcard, then the index is used:

```
mysql> explain SELECT * FROM Employees WHERE ReverseFullName LIKE 'Tolo%';
+----+-------------+-----------+------------+-------+--------------------+--------------------+---------+------+------+----------+-----------------------+
| id | select_type | table     | partitions | type  | possible_keys      | key                | key_len | ref  | rows | filtered | Extra                 |
+----+-------------+-----------+------------+-------+--------------------+--------------------+---------+------+------+----------+-----------------------+
|  1 | SIMPLE      | Employees | NULL       | range | IdxReverseFullName | IdxReverseFullName | 403     | NULL |    1 |   100.00 | Using index condition |
+----+-------------+-----------+------------+-------+--------------------+--------------------+---------+------+------+----------+-----------------------+
1 row in set, 1 warning (0.00 sec)

mysql>
```

### Common Table Expression (CTE)

The idea is to transform a complex query into manageble building blocks. First a traditional `SELECT` statement:

```
mysql> SELECT CONCAT("Cl1: ", COUNT(OrderID), "orders") AS "Total number of orders" FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl1" UNION SELECT CONCAT("Cl2: ", COUNT(OrderID), "orders") FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl2" UNION SELECT CONCAT("Cl3: ", COUNT(OrderID), "orders") FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl3";
+------------------------+
| Total number of orders |
+------------------------+
| Cl1: 4orders           |
| Cl2: 5orders           |
| Cl3: 3orders           |
+------------------------+
3 rows in set (0.00 sec)
```

The same query as a [CTE](https://dev.mysql.com/doc/refman/8.0/en/with.html):

```
mysql> with
    -> OrdersByCl1 as (select concat("CL1: ", count(OrderID), " orders") as "Total number of orders" from Orders where year(Date) = 2022 and ClientID = "CL1"),
    -> OrdersByCl2 as (select concat("CL2: ", count(OrderID), " orders") from Orders where year(Date) = 2022 and ClientID = "CL2"),
    -> OrdersByCl3 as (select concat("CL3: ", count(OrderID), " orders") from Orders where year(Date) = 2022 and ClientID = "CL3")
    -> select * from OrdersByCl1
    -> union
    -> select * from OrdersByCl2
    -> union
    -> select * from OrdersByCl3;
+------------------------+
| Total number of orders |
+------------------------+
| CL1: 4 orders          |
| CL2: 5 orders          |
| CL3: 3 orders          |
+------------------------+
3 rows in set (0.00 sec)

mysql>
```

### Prepared Statements

[Prepared statements](https://www.mysqltutorial.org/mysql-prepared-statement.aspx) are pre-compiled statements that can be used several times. First standard query

```
mysql> select OrderID, Quantity, Cost, Date from Orders where ClientID = 'Cl1' and year(Date) = 2020;
+---------+----------+---------+------------+
| OrderID | Quantity | Cost    | Date       |
+---------+----------+---------+------------+
|       1 |       10 |  500.00 | 2020-09-01 |
|       7 |       22 | 1200.00 | 2020-09-10 |
|       9 |       10 |  500.00 | 2020-09-12 |
+---------+----------+---------+------------+
3 rows in set (0.00 sec)

mysql>
```

A prepared statement is very similar, but it starts with the `PREPARE` statement and have the place holders for the variables `?`:

```
mysql> prepare GetOrderDetail from "select OrderID, Quantity, Cost, Date from Orders where ClientID = ? and year(Date) = ?";
Query OK, 0 rows affected (0.00 sec)
Statement prepared

mysql>
```

Next we define the variables

```
mysql> set @ID='Cl1';
Query OK, 0 rows affected (0.00 sec)

mysql> set @Year = 2020;
Query OK, 0 rows affected (0.00 sec)

mysql>
```

Finally we execute the prepared statement

```
mysql> execute GetOrderDetail using @ID, @Year;
+---------+----------+---------+------------+
| OrderID | Quantity | Cost    | Date       |
+---------+----------+---------+------------+
|       1 |       10 |  500.00 | 2020-09-01 |
|       7 |       22 | 1200.00 | 2020-09-10 |
|       9 |       10 |  500.00 | 2020-09-12 |
+---------+----------+---------+------------+
3 rows in set (0.00 sec)

mysql>
```

### JSON

Reading JSON field from MySQL.

Important:

- Use `->$.PropertyName` to keep the double quotes from the property,
- use `->>$.PropertyName` to remove the quotes.

Example

```
mysql> select * from Products;
+-----------+------------------------+----------+-----------+---------------+
| ProductID | ProductName            | BuyPrice | SellPrice | NumberOfItems |
+-----------+------------------------+----------+-----------+---------------+
| P1        | Artificial grass bags  |    40.00 |     50.00 |           100 |
| P2        | Wood panels            |    15.00 |     20.00 |           250 |
(...)

mysql> select * from Activity;
+------------+----------------------------------------------------------+
| ActivityID | Properties                                               |
+------------+----------------------------------------------------------+
|          1 | {"Order": "True", "ClientID": "Cl1", "ProductID": "P1"}  |
|          2 | {"Order": "False", "ClientID": "Cl2", "ProductID": "P4"} |
|          3 | {"Order": "True", "ClientID": "Cl5", "ProductID": "P5"}  |
+------------+----------------------------------------------------------+
3 rows in set (0.00 sec)

mysql>
```

Reading the products with `Order` with `True`

```
mysql> select ProductID,ProductName,BuyPrice,SellPrice from Products
    -> inner join Activity on
    -> Products.ProductID = Activity.Properties->>'$.ProductID' and
    -> Activity.Properties->'$.Order' = "True";
+-----------+------------------------+----------+-----------+
| ProductID | ProductName            | BuyPrice | SellPrice |
+-----------+------------------------+----------+-----------+
| P1        | Artificial grass bags  |    40.00 |     50.00 |
| P5        | Trees and Shrubs       |    35.00 |     50.00 |
+-----------+------------------------+----------+-----------+
2 rows in set (0.00 sec)

mysql>
```

Note that we removed the double quotes from `ProductID` but we kept for the `"True"`.

## Data Analysis in MySQL

Uploading a new database

```
a-garcm0b@library-docker-test:~/Work/Database-Engineer$ docker cp luckyshrub_db_6.sql database-engineer-db-1:/tmp
Successfully copied 6.14kB to database-engineer-db-1:/tmp
a-garcm0b@library-docker-test:~/Work/Database-Engineer$
```

Removing old database, and creating the new one

```
mysql> drop database Lucky_Shrub;
Query OK, 3 rows affected (0.03 sec)

mysql> source /tmp/luckyshrub_db_6.sql
Query OK, 1 row affected (0.01 sec)

Database changed
(...)
```

The task1 is to find out how many of product P4 was sold in the last years. We use a `CTE` to consolidate the sales:

```sql
with
SalesP4in2020 as (select concat(sum(Quantity), " (2020)") as "P4 product: Quantity sold" from Orders where year(Date) = 2020 and ProductID = "P4"),
SalesP4in2021 as (select concat(sum(Quantity), " (2021)" )from Orders where year(Date) = 2021 and ProductID = "P4"),
SalesP4in2022 as (select concat(sum(Quantity), " (2022)") from Orders where year(Date) = 2022 and ProductID = "P4")
select * from SalesP4in2020
union
select * from SalesP4in2021
union
select * from SalesP4in2022;
```

So when execute the SQL script `data_analysis_cte.sql` we get the table:

```
mysql> source /tmp/data_analysis_cte.sql
+---------------------------+
| P4 product: Quantity sold |
+---------------------------+
| 37 (2020)                 |
| 15 (2021)                 |
| 37 (2022)                 |
+---------------------------+
3 rows in set (0.00 sec)

mysql>
```

Next on task 2, we join several tables to list all clients and orders between 2021 and 2022. We joined 4 tables

```sql
select
  Clients.ClientID, Clients.ContactNumber, Addresses.Street, Addresses.County,
  Orders.OrderID, Products.ProductID, Products.ProductName, Orders.Cost, Orders.Date
from
  Clients inner join Addresses inner join Orders inner join Products
on (
  Clients.AddressID = Addresses.AddressID
  and Clients.ClientID = Orders.ClientID
  and Orders.ProductID = Products.ProductID
)
where
  year(Orders.Date) between 2021 and 2022
order by
  Orders.Date
```

The output is below:

```
mysql> source /tmp/several_inner_join.sql
+----------+---------------+----------------------+-------------------+---------+-----------+------------------------+---------+------------+
| ClientID | ContactNumber | Street               | County            | OrderID | ProductID | ProductName            | Cost    | Date       |
+----------+---------------+----------------------+-------------------+---------+-----------+------------------------+---------+------------+
| Cl2      |     351567243 | 724 Greenway Drive   | Pinal County      |      22 | P1        | Artificial grass bags  |  500.00 | 2021-09-01 |
| Cl3      |     351342597 | 102 Sycamore Lane    | Santa Cruz County |      24 | P3        | Patio slates           |  800.00 | 2021-09-03 |
(...)
```

Finally for "task 3" that will return the total quantity of a product sold in the year, we will create a function

```sql
delimiter $$

create function FindSoldQuantity(ii varchar(10), yy int)
returns int
deterministic

begin
  declare qtd int;
  set qtd = 0;
  select sum(Quantity) into qtd from Orders where ProductID=ii and year(Date) = yy;
  return qtd;
end$$

delimiter ;
```

And calling the function

```
mysql> select FindSoldQuantity("P3", 2021);
+------------------------------+
| FindSoldQuantity("P3", 2021) |
+------------------------------+
|                           50 |
+------------------------------+
1 row in set (0.00 sec)

mysql>
```

## Module Assessment

### Task 1: Function

Create a function to return the average sales price of all products in a given year. The year is the input parameter.

Using a new database: `/tmp/luckyshrub_db_7.sql`

```
mysql> drop Lucky_Shrub;

mysql> source /tmp/luckyshrub_db_7.sql
Query OK, 1 row affected (0.01 sec)

Database changed
Query OK, 0 rows affected (0.02 sec)mysql> source /tmp/luckyshrub_db_7.sql
Query OK, 1 row affected (0.01 sec)

Database changed
Query OK, 0 rows affected (0.02 sec)
(...)
```

Declaring the function

```sql
delimiter $$

create function FindAverageCost(yy int)
returns decimal(10, 2)
deterministic

begin
  declare avg_sales decimal(10,2);
  set avg_sales = 0.0;
  select avg(Cost) into avg_sales from Orders where year(Date) = yy;
  return avg_sales;
end$$

delimiter ;
```

Invoking the function

```
mysql> select FindAverageCost(2022);
+-----------------------+
| FindAverageCost(2022) |
+-----------------------+
|                496.15 |
+-----------------------+
1 row in set (0.00 sec)

mysql>
```

### Task 2: Stored Procedure

Creating a stored procedure

```sql
create procedure EvaluateProductYears (in prod_id varchar(10), out sold_2020 int, out sold_2021 int, out sold_2022 int)
begin
    select sum(Quantity) into sold_2020 from Orders where ProductID = prod_id and year(Date) = 2020;
    select sum(Quantity) into sold_2021 from Orders where ProductID = prod_id and year(Date) = 2021;
    select sum(Quantity) into sold_2022 from Orders where ProductID = prod_id and year(Date) = 2022;
end //

delimiter ;
```

```
mysql> call EvaluateProductYears("P1", @sold_items_2020, @sold_items_2021, @sold_items_2022);
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> select @sold_items_2020, @sold_items_2021, @sold_items_2022;
+------------------+------------------+------------------+
| @sold_items_2020 | @sold_items_2021 | @sold_items_2022 |
+------------------+------------------+------------------+
|               35 |               10 |               65 |
+------------------+------------------+------------------+
1 row in set (0.00 sec)

mysql>
```

### Task 3: Triggers

Create a trigger, and import, that add date and time to `Audit` database when when data is added to `Orders` table.

The trigger

```sql
DELIMITER $$

-- Insert ---

CREATE TRIGGER UpdateAudit AFTER INSERT ON Orders FOR EACH ROW
BEGIN
  INSERT INTO Audit VALUES (NULL, NOW());
END$$

-- End of triggers.

DELIMITER ;
```

Importing the trigger

```
mysql> source /tmp/trigger_orders_add.sql
```

Before creating the trigger, the `Audit` table is empty

```
mysql> select * from Audit;
Empty set (0.00 sec)

mysql>
```

Adding new orders, and checking the `Audit` table again

```
mysql> INSERT INTO Orders (OrderID, ClientID, ProductID , Quantity, Cost, Date) VALUES
    -> (31, "Cl2", "P3", 11, 543, "2022-09-11"),
    -> (32, "Cl4", "P2", 21, 234, "2022-09-21"),
    -> (33, "Cl3", "P4", 31, 123, "2022-09-21");
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from Audit;
+---------+---------------------+
| AuditID | OrderDateTime       |
+---------+---------------------+
|       1 | 2024-01-04 13:18:55 |
|       2 | 2024-01-04 13:18:55 |
|       3 | 2024-01-04 13:18:55 |
+---------+---------------------+
3 rows in set (0.00 sec)

mysql>
```

### Task 4: Clients and employees address

Using `CTE` to print the address of clients and employees:

```sql
with
ClientsAddr as (
  select Clients.FullName, Addresses.Street, Addresses.County
  from Clients inner join Addresses
  on Clients.AddressID = Addresses.AddressID
),
EmployeesAddr as (
  select Employees.FullName, Addresses.Street, Addresses.County
  from Employees inner join Addresses
)
select * from ClientsAddr
union
select * from EmployeesAddr;
```

The result is the following table:

```
+------------------+-----------------------+-------------------+
| FullName         | Street                | County            |
+------------------+-----------------------+-------------------+
| Takashi Ito      | ,291 Oak Wood Avenue  | Graham County     |
| Jane Murphy      | 724 Greenway Drive    | Pinal County      |
| Laurina Delgado  | 102 Sycamore Lane     | Santa Cruz County |
| Benjamin Clauss  | 125 Roselawn Close    | Gila County       |
| Altay Ayhan      | 831 Beechwood Terrace | Cochise County    |
| Greta Galkina    | 755 Palm Tree Hills   | Mohave County     |
| Seamus Hogan     | 751 Waterfall Hills   | Tuscon County     |
| Thomas Eriksson  | 878 Riverside Lane    | Tuscon County     |
| Simon Tolo       | 908 Seaview Hills     | Tuscon County     |
| Francesca Soffia | 243 Waterview Terrace | Tuscon County     |
| Emily Sierra     | 148 Riverview Lane    | Tuscon County     |
| Greta Galkina    | 178 Seaview Avenue    | Tuscon County     |
+------------------+-----------------------+-------------------+
12 rows in set (0.00 sec)

mysql>
```

### Task 5: Rewrite query as CTE

Write the original query

```sql
SELECT CONCAT (SUM(Cost), " (2020)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR (Date) = 2020 AND ProductID = "P2"
UNION
SELECT CONCAT (SUM(Cost), "(2021)") FROM Orders WHERE YEAR (Date) = 2021 AND ProductID = "P2"
UNION
SELECT CONCAT (SUM (Cost), "(2022)") FROM Orders WHERE YEAR (Date) = 2022 AND ProductID = "P2";
```

as a CTE

```sql
with
SalesP2in2020 as (select concat(sum(Cost), " (2020)") as "Total sum of P2 Product" from Orders where year(Date) = 2020 and ProductID = "P2"),
SalesP2in2021 as (select concat(sum(Cost), " (2021)") from Orders where year(Date) = 2021 and ProductID = "P2"),
SalesP2in2022 as (select concat(sum(Cost), " (2022)") from Orders where year(Date) = 2022 and ProductID = "P2")
select * from SalesP2in2020
union
select * from SalesP2in2021
union
select * from SalesP2in2022;
```

With the output

```
+-------------------------+
| Total sum of P2 Product |
+-------------------------+
| 1000.00 (2020)          |
| 100.00 (2021)           |
| 1434.00 (2022)          |
+-------------------------+
3 rows in set (0.00 sec)

mysql>
```
