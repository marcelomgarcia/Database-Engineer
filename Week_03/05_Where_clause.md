An admin department at the university
wants to create different reports for students in the engineering faculty. The department needs to fill the right
students from the engineering faculty to retrieve their details
from the student database. So how can this be done with SQL? Well, the WHERE clause is
useful in scenarios like this. In this video, you'll learn how to
explain the purpose of the WHERE clause, demonstrate how to filter data
using the WHERE clause and make use of different operators
in the WHERE clause condition. So what is the WHERE clause? The WHERE clause is used to filter data,
more specifically, it is used to filter and extract records
that satisfy specified a condition. To better understand how
the WHERE clause is used, it may help to break down its
syntax in a SQL SELECT statement. The syntax begins with the standard SQL
SELECT statement followed by the columns you want to query. Next is the FROM clause
followed by the table_name. Then you can bring in the WHERE clause,
after the WHERE clause, you can specify condition. You may be wondering what
the purpose of the condition is? Well, the condition makes it
possible to filter out and fetch the required records from the table. You can think of the conditions
as filter criteria, only the records that meet
the condition will be retrieved. For example, you can use the condition or
filter criteria to check if the desired column name is equal
to a certain value or operand. In between the column and
value you can place an operator. As you've just discovered,
the operand follow the operator. Let's take a quick look
at it in more detail. The operand can be either a text value or
a numeric value. It all depends on the data type
of the table, column or field. To demonstrate, let's take an example
where student_id equals 01. In this case the condition is instructed
to filter a numeric value, so it functions as a filter criteria. Once you run the SQL SELECT statement,
it retrieves the records as instructed. Let's take another example, WHERE
first name equals John, a text value. All text values must be enclosed
in a pair of single quotes. Once again,
you just run the SQL SELECT statement and filters the required records. To specify your filter condition, you can
make use of a wide range of operators. You've just reviewed an example
of the equals operator and others you may have encountered
in a previous lesson. Let's quickly review
these other operators. SQL comparison operators include equal to,
less than and greater than. There's also less than or equal to,
greater than or equal to and not equal to. In addition to these symbols, the WHERE clause can also use the BETWEEN,
LIKE and AND operators. With the BETWEEN operator, you can filter records within a specific
numeric or time and date range. The LIKE operator is used to specify
a pattern in the WHERE clause filter criteria. And the IN operator is used to specify
multiple possible values for a column. Now, let's explore some examples of
the WHERE clause and SELECT statements. Recall the scenario of the admin
department that wants to create reports for
its engineering and science students. I can use the WHERE clause to filter
out the details of students who are in the engineering faculty. In this case I need to
retrieve all details or all columns from the student table. So I write, SELECT * FROM student_table. Next I type WHERE followed
by the filter criteria. The criteria is written as faculty,
then an equal operator. Finally, I write engineering and close
in single quotes which are required for text values or operands. So I'm instructing my SQL to fetch
only the details of the students who are attached to the engineering faculty. Then I run the query,
as per the filter condition, to retrieved the student records of
the three students in the student_table listed in the engineering faculty. Note that I could've used other
operators such as greater than, less than, less than or equal to,
greater than or equal to and not equal the same way as the equal to
operator in this WHERE clause condition. You can use any of these operators
with numeric values or operands. Now let's review some examples
that use BETWEEN, LIKE and IN operators in the WHERE
clause condition. The college has a financial aid program
available to students of a certain age. The funding department would like
to notify eligible students only. I can use the BETWEEN operator in
the WHERE clause condition to filter the records in the student_table. As before, I type SELECT * FROM
student_table followed by WHERE, after the WHERE keyword,
I specify the filter column, a DOB or date of birth,
then I insert the BETWEEN operator. Lastly, I give the date ranges,
2010-01-01 AND 2010-05-30. Running this query retrieves the records
of four students whose date of birth falls in the specified date range. Note that I could use any numeric
range here, not just dates. For the next example, let's assume the
admin department requires the details of the students who are in
the science faculty. I can do this with the LIKE operator which
can be used when you want to specify a pattern in the WHERE
clause filter criteria. Within the SELECT statement and
after the WHERE keyword, I type faculty, for faculty column, then the LIKE operator followed
by Sc% within single quotes. The percentage character in the pattern
is a wild card character that represents 01 or multiple characters. The underscore sign can also be used
to represent one single character. In this case my WHERE clause asks my SQL
to search for and filter right values within the faculty column that start with
Sc followed by any number of characters. So I run the statement and it filters out
the five student records whose faculty column has a value of science,
that is, starting with the pattern Sc. In the final example the admin department
needs to know the details of the students who are studying in specific locations. You can use the IN operator in the WHERE
condition to retrieve the relevant student records. Remember the IN operator is used to
specify multiple possible values for column. Within the SELECT statement and following
the WHERE keyword I type the column_name, which is country, the IN operator
then an open pair of parentheses. Within these, I place the values USA and
UK, each in single quotes. My SELECT query will filter out all
student records that have a value of USA or UK in the country column. Running this query returns four records,
two students from the USA and two students from the UK. So the IN operator searches for multiple
possible values in the country column and filters out based on them. Note that although the examples in this
video looked at the WHERE clause in the SELECT statement,
it can also be used in other statements, such as UPDATE and DELETE. You've now learned what the WHERE clause
is and you should now know how to use it to filter data as well as how to
use different operators, great work