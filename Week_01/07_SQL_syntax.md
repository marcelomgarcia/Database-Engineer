As you might already know, you can interact with
the database using SQL. But just like with
other coding languages, you need experience
with SQL syntax and it's subsets before
we can make use of it. Over the next few minutes, you'll learn how to
create a database using the data definition language
or DDL subset of SQL. Utilize the data
manipulation language, also known as the DML subset, to populate and modify data in a database and read
and query data within databases using the
Data Query Language or DQL subset of SQL. In order to demonstrate
SQL syntax and at subsets, I'm going to show you the
SQL commands that can be used to develop a
database for college. However, take note that the
demonstration which follows, will only briefly show
each step in the process. You just need to
develop a working familiarity with SQL for now. You'll explore the
language in a subsets in much more detail
later in this program. The first task is to
create the database. To do this, I already create statement using SQL DDL subset. The syntax to create a
database is create database, followed by the name
of the database. I then place the semicolon
at the end of the statement. Let's create a college
database as an example using the syntax, create
database college. Once you've created a database, the next step is to
create the tables. You can create tables using the create table syntax
followed by the table name. Just repeat the same steps for each new table you want
to add to your database. I can use this syntax to create a student table in
my college database. This table will hold
information on each student. To create the table, I just
write create table student. Now I need to populate
the table with data. This is where I can use the data manipulation language
or DML subset of SQL. To add table data, I use the insert into syntax. This inserts rows of
data into a given table. I just type insert into, followed by the table name, and then a list of
required columns or fields within a
pair of parentheses. Then I add the
values keyword and specify in order the values
for each of the fields. As an example, let's add data to the student table in
our college database. I'll use the student table
I created earlier and add student data to it by specifying values for each
of the following columns. ID, first name, last name, and date of birth. Then populate the table
with the required data. But what if I need to
update or modify data?. For example, let's say I've input the wrong date of
birth for a student. To change this data, I can use the update syntax, which is part of the
DML subset of SQL. First I add the update keyword, followed by the
student table name. Then I use the set keyword followed by columns and
values I want to update, written as key-value pairings. In this instance is a date of birth column and a new
date of birth value. Finally, I add the where clause and a condition to filter
the records I need. For example, to change the data for the student
with the ID of two, I can type where ID equal to 2. It's also possible to
delete data from a table. Let's delete the table
record for the student with the ID of three using
the delete syntax. First I type delete from,
then the table name. This tells my SQL where the
data must be deleted from. This is followed by
the where clause and a condition such
as ID equal to 3, which will remove all data
on row 3 of the table. I can instruct my SQL to remove the data of the
student on row 3. Once I run this statement, the students data is
removed from my table. You're now familiar
with how to add, update or delete
data in a database. But how would you read data stored in your database tables? That's where SQL, DQL or data
query language comes in. The main syntax
of DQL is select. As its name says, it's used to select data from the database. A select statement is written
using the select keyword, followed by the columns that
hold the data you required. You then write them from keyword followed by the
name of the table you want to select data from. As an example, you could
use the select statement to query the student
table to find the name of the student with an
ID of one You just need to add the where keyword followed by the student's ID. This will then return
the name of John Murphy. You're now familiar
with the basics of SQL syntax and the subsets. Don't worry if
you're still trying to figure out these subsets. You will explore each of them in more depth later in
this specialization. You'll also get an opportunity
to try them for yourself.