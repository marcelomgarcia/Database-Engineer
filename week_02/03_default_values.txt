To ensure the accuracy and reliability of the
data in your database, you must limit the
type of data they can go into your database table. In this video,
you'll learn how to describe the purpose
of constraints in a database and identify default constraints to set
default values in a table. Database constraints
are used to limit the type of data that can
be stored in a table. This ensures that
all data inserted into the table is
accurate and reliable. If the database
dictates a violation between the constraint
and the data operations, then it aborts these operations. An example of a violation
might be an attempt to insert or upload invalid
data to a table. The database realizes that the data is invalid
and rejects it. Constraints can be
column level where the rule applies to
a specific column. They can also be
applied at table level. For example, I could use the foreign key
constraints to prevent actions that will destroy
links between tables. I'll demonstrate this in more
detail in a later lesson. Two of the most used
database constraints include NOT NULL, a method of preventing
empty value fields, and DEFAULT, a method of
assigning default values. For now, let's begin
our exploration of default values with a
NOT NULL constraint. The NOT NULL SQL constraint
is used to ensure the data fields are always completed and never left blank. Let's explore this concept using the example
of a table from an online store that records the IDs and names of customers. The table records this data in the customer ID and
customer name columns. These columns must
always contain data. If there's no data or values inserted into
either of these columns, then the creation of a new
customer record is aborted. The NOT NULL default value is implemented using
a SQL statement. A typical NOT NULL
SQL statement begins with the creation of a basic
table in the database. I can write a create
table clause, followed by customer to
define the table name, followed by a pair
of parenthesis. Within the parentheses
I add two columns; customer ID and customer name. I also define each column
with relevant data types. Int for customer ID as it
stores numeric values, and varchar for customer name
as it stores string values. Finally, I also declare a NOT NULL constraint
for each column. This makes sure
that neither column will accept no values. Now, any operation
that attempts to place a null value in these
columns will fail, like inserting or updating data. Next, let's look at how the DEFAULT constraint
works in a table. The DEFAULT constraints sets a default value for a column
of no value is specified. This means that if no
data is entered for a specific field
within a column, then the table
will automatically insert a default value instead. To gain a better understanding
of default values, let's look at a table that holds player records for a
football club's database. The table is called player table and contains two columns. The first is player name and lists the names of each
player in the team, and the second
column is city and list which city each
player is from. Most of the players in this
club are from Barcelona, so I can specify a default value of the city column as Barcelona. This means that I don't
have to enter Barcelona repeatedly into the city
field for each new player. If no value is
entered in the table, then each field is
automatically filled with a default
value of Barcelona. Let's find out how the
default command is incorporated into
a SQL statement. First, I use the
create table commands to create a table and
then call it player. Then within a pair
of parenthesis I input the column names, assign a string
datatype for each, and assign a default value of NOT NULL for the name column. Finally, I add the
default keyword statement followed by the default value Barcelona for the city column. Now when I add data into
the table for a new player, I don't need to
type in Barcelona for players who
are from the city. Instead, it will be
inserted automatically. You should then be familiar with the importance of using
database constraints. You should also be
able to explain database constraints
as a method of enforcing rules on a column
or table level. Go to work.