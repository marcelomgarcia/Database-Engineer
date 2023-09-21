I recently created a database table for a college called student table. 

It contains the following pieces of deed on each student in the college ID, first name, last name, home address, college address, contact number and department. Let's use the update syntax to update the home address and contact number of the student assigned the ID of three in the table. 

So I click the SQL tab in phpMyAdmin. Now I use the update clause followed by the name of the table that I want to update which is student table. Then I add the set clause followed by the names of the columns to be updated, which our home address and contact number. Next to the name of each column,
I add an equal to symbol and place the new values to be inserted into
the table in single quotation marks. I also make sure to separate these
column value pairings with a comma. Finally, I add the WHERE cause, to identify the exact
record I want to update. This record has a student ID column field, that was assigned the value of three so
I write where ID equals three. Now that I've completed the syntax,
I can select go. I then receive a message confirming
that the change has been made. And when I check the table,
it displays the updated values for the assigned columns
alongside student three. So that's how you update information for
one student. However, the update
syntax can also be used to update the information from
multiple students at once. Let's suppose that the college's
engineering department has moved their classes to a new location on
campus called the Harper Building. And I need to update the department's
address on the table for all engineering students. I can perform this task
using the update SQL syntax. The syntax is very similar
to the previous example. First I used the update clause
followed by the name of the table. Then I add the set clause and
state that I want to update the values within the college address column,
to Harper building. So I type this as SET college
address equals Harper Building. Next, I type the WHERE clause and
state that I want this update to occur within
the college address column for all students assigned the value of
engineering in the department column. I then click go to run the statement. Now, I just check that the table
has updated the college address of the engineering department
to Harper Building. I could also use the update statement, to update multiple fuel
values in multiple records. For example, I can return to
the original SQL statement. And add a new column value
pairing to the set clause. If I want to update the home
address column, I add a comma and write home address equals the new
address information within quotes. Make sure to separate out the column
value pairings with a comma. In this example I'm updating two
columns with one update statement.