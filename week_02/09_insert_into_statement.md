When working with tables, there might be instances where you need
to retrieve information from one or more tables in order to populate
columns in another table. You can complete these actions using
the INSERT INTO SELECT statement. Over the next few minutes, you'll explore
the SQL syntax for these actions. And by the end of this video,
you'll know how to identify and understand INSERT INTO syntax and insert data from a source table into a
target table using the INSERT INTO clause. First, let's find out more about
the INSERT INTO select statement. Essentially, the INSERT INTO select
statement is used to query data from a column within a source table and place the results of that query in
the column within a target table. For example, you could use an INSERT INTO
select statement to query data in column C in the source table and place the results of that query
in column B of the target table. So what does the INSERT INTO SELECT
statement syntax look like? Here's an example. First type an INSERT INTO clause followed
by the name of the target table and the name of the column you
want to insert data into. Then type the SELECT keyword with
the name of the column you want to extract data from. And finally, type the FROM keyword and the name of the source table that
holds that column or source data. To find out more about
how this syntax works, let's explore an example
of INSERT INTO SELECT. To demonstrate the statement, I use tables from a soccer club database
to contain important data about the club. However, before I begin querying this
data, let's quickly review these tables. In this database, I have a table called
players that holds the records of four different players in the team. I also have a table called country that
holds information about the countries that these players are from. But right now, the country table is
missing the names of the countries. In other words, it has no data. I can perform a SQL query using the
INSERT INTO SELECT statement to populate this missing data. Do you remember the example
of the source and target tables from earlier in this video? In this instance, the player table is
the source table that I need to query, and the country table is a target table
in which SQL places the results from my query. So to query data from my source table and
populate my target table with it, I write an INSERT INTO SELECT statement. Note that for
the purposes of this demonstration, I've organized the player data in the
player table in the same order in which it must appear within the country table. So to perform this task, I first click
on the SQL tab to open the code editor. Then I write an INSERT INTO command,
followed by the name of my target table, which is country table. I then state the name of the column
that the data from my query must be inserted into within
a pair of parentheses. In this instance,
the column is called countryName. Next, I type the SELECT keyword and state what column I want to query within
the source table, which is country. Finally, I type the FROM keyword and state
the name of the source table I want to query the data from,
which is player table. I add a semi colon to the end of my query,
then run it. Now I select country table,
my target table from the database, and check that the country name column has
been populated with the correct data. You now know how to query tables
using the INSERT SELECT statement. Well done.