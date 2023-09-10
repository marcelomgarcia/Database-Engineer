Building a database involves working with substantial
amounts of data. But how do you organize
your data so that you can find exactly what you need
and make sense of it. With SQL, you can
create a table within your database to hold
and organize your data. In this video, you'll learn
how to create tables in a database management
system using SQL syntax. Let's begin with
a look at the SQL create table statement syntax. I begin the statement
with the keywords Create Table to let SQL know that I
want to create a new table. I then add the name of the
table I want to create. Finally, I add a
pair of parentheses. Within these parentheses, I type the name of
each column that must be included
within the table, followed by its
respective datatype. Now that you're familiar
with the syntax, let's look at it in action. Be aware that before
you can create tables, you must already have a
database on the server. In other words, you can't build tables if there's no
database to create them in. Let's assume that I already have a database ready to work with. In this example, I'll
create a customer table in the bookstore database to store customer data like names
and phone numbers. First, I write a SQL statement that contains the
create table command, followed by the
name of the table. In this case customers. Then I add an open parenthesis. Is within this
parenthesis that I need to create my own columns. I write the name of
my first column, which is customer name. This is followed by
the datatype VARCHAR. This datatype means that the column can hold
data of any type. I then add a numeric value
within a pair of parenthesis. Then I add a comma
and write the name of the second column,
which is phone number. I add into the datatype so that only whole
numbers can be stored. Then I add a closing
parenthesis and a semicolon. Finally, I execute
the statement. The customers table is now
stored in the database. In this video, you learned
how to create tables in a database using SQL
syntax. Well done.