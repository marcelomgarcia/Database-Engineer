At this stage you're probably familiar
with creating tables and databases but no table is ever static database developers
are always restructuring tables. Sometimes they need to add new columns. Delete old ones or
edit the data they contain. You can complete many of these basic
restructuring actions using sequel syntax. In this video you'll learn how to
alter a database table by adding and removing columns and
modify the attributes of a database table. Let's start by exploring
the sequel alter statement syntax. The first part of an alter statement
is the altar and table keywords. These keywords informed the database that
there was a table whose contents must be altered. This is followed by the name
of the table to be altered. I then include the AD keyword. This keyword tells sequel that there's one
or more items to be added to the table. There are other keywords I
could include here instead. But for the purposes of this
example I'll work with AD finally I insert a pair of parentheses
within these parentheses. I declare the name of a new column
to be added to the table along with this data type. Now that you're familiar with
the alter table statement, let's explore an example
of the statement in action. However, before you can begin altering
tables you must already have a database on the server so as always make
sure that you know how to create databases before proceeding and
ensure that you already have a table in your database with data
that you can alter. In my example I have a students table
located within a database called college. My students table holds
information on their IDs. Names and
emails of each student in a college. I can demonstrate the altar
statement by adding deleting and modifying columns in this table. My first task is to add three
new columns to the table, age, nationality and country to add
these columns using sequel syntax. I first type the alter table command
followed by the name of the table. Students next I use the add command
to let the database know that I want to add new columns to the table. Then I input a pair of parentheses
that contain the columns I want to add along with the type of data they'll hold
these columns are an age column which holds data in integer format. A country column with var chars
the data type, nationality and country columns that hold via char or
string data. I also had a character limit of
52 the country columns fields and a limit of 255 to
the nationality columns fields. Then I execute this statement
Now have two new columns and students table in the college database. Country and
nationality are very similar columns and in most cases will probably hold
the same type of information so I can write a sequel statement to
remove the nationality column just like the last example I start my
statement with alter table. Students table next I type the drop
column command followed by nationality. This command instructs sequel to delete or
drop this column from the table. Then I run the statement notification
message appears requesting confirmation of deletion. I press OK to confirm. The nationality column
has now been dropped. Now it's time to alter
the structure of the table. The country column has a limit of 50
characters just as I said it originally. Now I'm going to change it so that it holds 100 characters instead
using the alter table command. I start with the syntax altar
table followed by students table. Then I type the modified command,
the country, column name and the vulture data type. And finally I had a pair of parentheses
containing my new value of 100. I then execute the query My
country columns limit has now been updated to 100
characters in this video. You learned how to alter and modify
tables in a database using sequel syntax. Well done.