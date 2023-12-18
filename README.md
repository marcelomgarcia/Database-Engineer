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

Use a list of columns that are needed instead of all ('*'):

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

## Additional Resources 

### SQL Schema

[IBM](https://www.ibm.com/topics/database-schema)

### Entity Relationships

[Opentextbc1](https://opentextbc.ca/dbdesign01/chapter/chapter-8-entity-relationship-model/)
[IBM](https://www.ibm.com/docs/en/ida/9.1.2?topic=entities-primary-foreign-keys)

### Normalization

[opentextbc.ca](https://opentextbc.ca/dbdesign01/chapter/chapter-12-normalization/)