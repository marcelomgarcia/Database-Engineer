Imagine you're running a database for
a soccer club. As a database engineer, there's a lot of
work required to manage this database. For example, you might need to categorize players
into groups according to their ages. How can you complete this kind of task? You can use sequel comparison
operators over the next few minutes. You'll learn how to explain the concept
of sequel comparison operators and utilize sequel comparison
operators in a database. So what our sequel comparison operators, Comparison operators are used
to compare two values or expressions where the outcome
result can be either true or false. They can be used to filter data and
to include and exclude data. So how are these operators used in sequel? Sequel uses common mathematical
comparison operators by means of the symbols equal to less than
and greater than it also uses less than or equal to greater than or
equal to and not equal to. Now let's explore how to use
these comparison operators and relevant symbols in a practical way. Using a database to demonstrate the use
of sequel comparison operators, I'll use the example of an employee
table from a company database. This table includes information on
each employee's ID, name and salary. Now let's assume the employer wants
to extract relevant data from the employee table about the employee's
salaries for different purposes. Each instance of data extraction will
require a different comparison operator. So in the first example the employer
wants to identify all employees receiving a salary Equal
to $18,000 per year. I can identify these employees
using the equal to operator. First I click the sequel
tab in the main menu. Then I write select asterix from employee where salary equal to symbol 18,000. Let's break this sequel statement down. The select command is
used to retrieve data. The asterix star denotes that I'm
selecting data from all columns, the from keyword and the table name
specify where the data will come from. And then I define the condition
using the wear clause. In this case, the condition uses the equal
to symbol to check if the salary value in each Record of
the table is equal to $18,000. If the result is true,
then the data is retrieved. So run the query and generate an output. The Output result of this query
is that the employees Carl and John earned $18,000 per year. You can apply the other comparison
operators in a similar way to perform different functions. Let's take another
example to find out more. In this next example, the employer needs
to know which employees are receiving a salary That is less
than 20 $4,000 per year. This task requires a different operator. To find this information, I can write select asterix
from employee where salary less than symbol 24,000. This sequel statement utilizes the less
than symbol to check whether the value stored in each field of salary
column is less than $24,000. Once again, I select the gold button to
execute the query and generate an output. The output of this query
is that the employees? Carolyn john earned less than $24,000. Let's take another example where
the employer needs to determine which employees receive a salary that is less
than or equal to 24,000 dollars per year. In this case I need to
write the following query, select asterix from employee
where salary less than or equal to symbol 24,000. The only thing in this statement that
has changed from the previous example is the operator symbol this less than or
equal to symbol tells the sequel statement to check whether the value stored in each
field of the salary column is less than Or equal to $24,000. I click the go button
to execute the query. The Output results show that there
are four employees who Earn less than or equal to 24 $1,000 per year. What if The employer wants to know which
employees receive a salary that is greater than or equal to $24,000 per year. To generate these results,
I can use the greater than or equal to operator in my sequel statement. So I write the following sequel query
select asterix from employee where salary greater than or
equal to symbol 24,000 this time, the greater than or equal to symbol
is used to check whether the value stored in each field of the salary column
is greater Than or equal to $24,000. I click go to execute the query and
the output shows that there are three employees Who earn $24,000 or
more per year. The final comparison operator available
in sequel is a not equal to operator. In this final example, The employer wants
to know which employees receive a salary that is not equal to $24,000 per year. I can determine this using
the following sequel code, select asterix from employee where salary. Then I type less than and
greater than symbols to denote the not equal to operation and then I type 24,000. As with the previous operators, the sequel
statement utilizes the operator to check the value stored in each
field of the salary column. In this case, it Checks for
values that do not equate to $24,000. The output results of this
query show that there are three employees whose salaries are not
equal to $24,000 per year. You should now be able to
describe comparison operators and use them in a database in sequel. Congratulations on building
another important database skill