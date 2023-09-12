There are several
clauses available in SQL for sorting and filtering
data in a table. One of the most useful of
these is the ORDER BY clause. With this clause,
you can reorder the data in a table by
one or more columns. For example, in a table that holds data on students
in a college, you could sort the
data by date of birth. The table would then
present all students in the order of oldest to youngest. By the end of this video, you'll be able to
demonstrate the purpose of the ORDER BY clause
for sorting data, explain the different
forms in which the ORDER BY clause can
be used to sort data, and describe how
the ascending and descending keywords behave
when used in sort columns. Let's begin with
an exploration of the purpose of the order clause. The ORDER BY clause is an optional clause that can be added to a select statement, its purpose is to help sort data in either ascending
or descending order. For example, you can sort
list of student names in an alphabetical order from
A to Z or vice versa. To get a better
understanding of how the ORDER BY clause works, let's explore the syntax. In its most basic form, the syntax of ORDER BY
clause is as follows. It begins with a
select statement, then a list of the
columns to be sorted with each one
separated by comma, next is a from keyword, followed by the name
of the table to be sorted, finally, the ORDER BY clause is added, followed by the name of
the column to be sorted. At the end of the column name, state how you want the
data to be sorted. You can do this by
specifying ASC for ascending order or
DESC for descending. But the ORDER BY clause doesn't limit you to just
the one column. You could also use
this syntax to order the data from
multiple columns. The syntax for sorting
multiple columns is very similar to that
used for a single column. The key difference from multiple columns is that you must type the name of each column
after the ORDER BY clause. Just make sure that you separate each column with a comma, and specify whether
you want to sort the columns in ascending
or descending order. It's also possible to
specify all columns after the select keyword
by using an asterisk. This is a much
easier method than listing all columns one by one. Finally, it's also
important to note that the type of data in your table
affects how it is ordered. If the column has a
numeric datatype, the records will be sorted in ascending or descending
numerical order, and if a column has a
text-based or string data type, then it will be
sorted in ascending or descending
alphabetical order. Next, let's explore
some examples of the ORDER BY clause
in SQL statement. Let's begin with an example of ordering data by single column. For this example, I'll use a table that lists details
of students in college. I need to sort or
order this data in ascending order of each student's
country of nationality. So in this instance, the ORDER by column must be the nationality
of each student. Each student's nationality is listed in the table's
fifth column. I begin by writing
the select statement, followed by the
names of the columns that I want and the result, ID, first_name, last_name, and nationality. Then I write the from keyword, followed by the
name of the table, which is student table. Next, I typed the
ORDER BY clause. Then I specify the name
of the code-name by which want my data to be sorted,
which is nationality. Finally, I type ASC so that the data is sorted
in ascending order. I then execute the statement. All students in a table
have now been sorted according to nationality
in ascending order. Note that even if I was to omit ASC from the end of my code, I'd still get the same result. This is because the
ORDER BY clause sorts all data in ascending
order by default. Let's run the same statement, but this time using DESC or
descending instead of ASC. All students in the
table have now been sorted by nationality
for a second time. But in this instance, they've been sorted
by descending or reverse alphabetical order. Finally, let's
explore an example of sorting data by
multiple columns. In this example, I'll sort each student by nationality
and date of birth. First, I write the
select statement, then I write the names
of the columns I wanted my result, ID, first_name, last_name, date of birth, and nationality. I then write the
from keyword and student table, the
name of the table. Next, I type the
ORDER BY clause and specify the names of the columns by which I want my
data to be sorted, which are nationality
and date of birth. I then add ASC after nationality so that
the data is sorted in ascending order of
nationality and I add DESC after date of birth
so that the data from this column will be
sorted in descending order. Then I run the statement.
This returns my table with the data for the
specified columns organized as instructed, which is alphabetically for nationality and
youngest to oldest. This was a short introduction
to the SQL ORDER BY clause. You can now demonstrate
the purpose of the ORDER BY clause
for sorting data, and you can also explain the
different forms in which the ORDER BY clause can be
used to sort data. Great work.