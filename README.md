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

## Additional Resources 

### SQL Schema

[IBM](https://www.ibm.com/topics/database-schema)

### Entity Relationships

[Opentextbc1](https://opentextbc.ca/dbdesign01/chapter/chapter-8-entity-relationship-model/)
[IBM](https://www.ibm.com/docs/en/ida/9.1.2?topic=entities-primary-foreign-keys)

### Normalization

[opentextbc.ca](https://opentextbc.ca/dbdesign01/chapter/chapter-12-normalization/)