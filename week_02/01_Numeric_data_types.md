You probably know
the database tables store data in the forms
of columns and rows. But how do you make sure that every column accept the
correct type of data? For instance, that
your cost column stores values in decimal while your product quantity column
accepts positive numbers. This is exactly
what data types do. With data types, you can determine
what kind of data is accepted by each
field in your table. Over the next few minutes, you'll learn how to explain the numeric data
type in a database, and differentiate between
integer and decimal data types. Before you begin exploring
numeric data types, let's take a moment to explore
the concept of data types. When you create a
table in a database, you need to define
column names and the data type of the content that will reside
in those columns. Data type tells the database management system such as MySQL, how to interpret the
value of the column. Data types maintain data
in the right format and make sure the value of
each column is as expected. The most used data
types are numeric, string, and date and
time data types. Let's take the
example of a table from the database
of an online store. This table collects information on customers in the form of columns called customer name, order price, product
quantity, and total price. Each of these columns
must store data in the form of a
suitable data type. The customer name column
can use string data, order type can use a date type, and product quantity and total price columns are best
suited to numeric data. The focus of this video
is a numeric data type. Numeric data types is the
generic term used for all specific data types that let a column store data as
numbers in the database. The two most common
numeric data types used in databases are the
integer data type, used for a whole number value, and the decimal data type used for number with
a fraction value. To return to our
earlier table example, the product quantity column is defined as an integer data type. This is because it holds
whole numbers only. Fractional numbers
can be inserted, but they'll always be
automatically rendered up or down to the nearest whole
number of the database. The total price column
is a decimal type. This is because it holds
fractional numbers. For example, an item that costs $80.90 is a fractional value, 80 is a whole number
and 90 is a decimal. Whole numbers can
also be inserted. The database will
add a decimal point along with a fractional
value of zero. In most database
management systems, you'll find different types of integer in decimal data types. Each type is intended to store minimum and a maximum
number value. For example, in MySQL
Database Management System, tiny integer or TINYINT is used for very small
integer number value, or the maximum possible value that can be inserted is 255. While integer or INT can be used to store a very big number, the maximum value that it can
store is over four billion. These data types can also accept negative and
positive values. In some Database
Management Systems, you can also force columns
to accept positive numbers. This increases the maximum
value they can store. You should now be
able to explain the numeric data
type in a database, and you should also be capable
of differentiating between integer and decimal
data types. Great work.