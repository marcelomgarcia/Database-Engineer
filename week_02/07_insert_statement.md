When working with databases, you'll often have to add
new rows and columns to existing tables or even create
new tables from scratch. For example, if you run
a college database, you'll have to add new rows
for every new student. With SQL, you can perform these tasks quickly using
the insert statement. By the end of this video, you'll be able to identify
and understand insert SQL syntax and insert data into tables with the use of
the insert into clause. Let's begin with an exploration of the Insert into Syntax. To write an insert statement, first write an insert into clause then specify the
table name followed by a list of columns
contained within a pair of parentheses
and separated by commas. Then use the values
keyword and write a list of values within
a pair of parenthesis. It's important to remember
that each value corresponds to a specific column and so should reflect the same
datatype and order. You can also add multiple rows into a table at the same time. First, write the insert into clause and table,
just like before. Then use the values keyword and add multiple rows of values. Just make sure that
each new row is separated from a
previous one by a comma. Now let's explore some examples
of an insert statement. In this example,
I'll use a table called players from a
sports club database. I want to insert new player
data into this table. First I write the insert into command followed by
the name of the table. In this case, it's players. Then I add the column names
within a pair of parenthesis. These columns must contain the basic information that the club requires
about each player. I'll name the columns: ID, Name, Age, and Start date. Next, I insert the
values keyword and then add the values I want to assign to each column within a pair of parenthesis. I start adding the data for
a new player named Yuval, age 25 with an ID of 1 and
a start date of 2020/10/15. It's important to use the
correct format of year, month, and day when
entering dates in a table. Otherwise, an error
message will appear. I can also use the current
date function followed by a pair of empty parentheses
next to my values, just like I've done
for the new player, Yuval and end up scripted
all values for Yuval. Note that each value relates
to a specific column. Number 1 corresponds to the player ID column:
Yuval to player name, 25 to player age, and the date to start date. This means that the
order in which I type my values within the
parentheses is very important. Otherwise, I might accidentally store these values in
the wrong columns. It's also important to note that all non-numeric values are
placed within quotation marks, just like Yuval and the date
value in the statement. Finally, I execute
the statement. The output now shows one
row of data for Yuval, just as my code instructed. But what if I wanted to insert multiple records of
data into the table? Let's say that two new
players have joined the team. The first player is Mark, age 27 with an ID of 2 and
a start date of 2020/10/12. The second player
is Karl, age 26, with an ID of 3 and a
start date of 2020/10/07. Both Mark and Karl must be
inserted into the database. As you learned earlier, this is a very
straightforward task. First, I write the
insert into command, then I write the
table name players. Next, I type the ID, name, age, and start date columns within a
pair of parenthesis. Then I write the values keyword and insert two records of data. These data records
are contained within two pairs of parentheses
separated by a comma, one for Mark and
another for Karl. Finally, I run or
execute the statement. I then check my
output which shows that all three players
are now in the table. So far I've explored how
to add data to the table. But it's also possible
to show existing data in the player table by executing
the following SQL query. First, I try to select clause
followed by an asterisk. This asterisk tells SQL to return all columns
within the table. Then I type the "From" keyword
and the name of the table. I execute the statement
and the output shows all data available
from the player table. You can now identify
and make sense of the insert syntax as well as insert new data into tables with the insert into
clause. Good luck.