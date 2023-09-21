At this stage,
you might be familiar with the process for creating tables within a database. But there are several issues that you're
likely to encounter when working with tables such as unnecessary data
duplication, issues with updating data and the effort required to query data. Fortunately these issues can be resolved
with the use of database normalization. By the end of this video, you'll be able
to explain what database normalization is and you'll also be able to demonstrate
an understanding of insert, update and deletion anomalies. And be able to list some of
the issues associated with them. Normalization is an important
process used in database systems. It structures tables in a way that
minimizes challenges by reducing data duplication, avoiding data
modification implications and helping to simplify data
queries from the database. To gain a better understanding of
normalization and the challenges it addresses, let's explore an example of
a table that hasn't been normalized. In this example I'll use
a college Enrollment Table. The table serves multiple purposes by
providing a list of the college students, courses and departments. And the outline of relationships or
associations between students, courses and departments. And name and contact details for
the head of each department. Creating tables that serve multiple
purposes causes serious challenges and problems for database systems. The most common of these
challenges include insert anomaly, update anomaly and deletion anomaly. Let's begin with an overview
of insert anomaly. Insert anomaly occurs when new data is
inserted into a table which then requires the insertion of additional data. I'll use the college Enrollment Table
to demonstrate an example. In the college enrollment table, the student ID column
serves as the primary key. Each field in a primary key column must
contain data before new records can be added to any other column on the table. For example, I can enter a new
course name in the table but I can't add any new records
until I enroll new students. And I can't enroll new students
without assigning each student and ID. The ID column can't contain empty fields. So, I can't insert a new course
unless I insert new student data. I've encountered the insert
anomaly problem. An update anomaly occurs when you
attempt to update a record in a table column only to discover that this result
in further updates across the table. Let's return to
the College Enrollment Table, once again, to understand how
an update anomaly occurs. In the Enrollment Table, the course and
department information is repeated or duplicated for
each student on that course. This duplication increases
database storage and makes it more difficult
to maintain data changes. I'll demonstrate this with a scenario
in which Dr. Jones, the Director of the Computing Department, leaves his post
and is replaced with another director. I now need to update all instances of Dr. Jones in the table with
the new Director's name. And I also need to update the records of
every student enrolled in the department. This poses a major challenge
because if I miss any students, then the table will contain inaccurate or
inconsistent information. This is a prime example of
the update anomaly problem. Updating data in one column requires
updates in multiple others. Next let's review the final challenge. Deletion anomaly. A deletion anomaly is when the deletion
of a record of data causes the deletion of more than one set of data
required in the database. For example, Rose, the student has signed the ID of four
has decided to leave her course. So I need to delete her data but
deleting Rose's data results in the loss of the records for the design department
as they're dependent on Rose and her ID. This is an example of
the deletion anomaly problem. Removing one instance of a record of data
causes the deletion of other records. So, how can you solve these problems? As you learned earlier,
the answer lies in database normalization. Normalization optimizes the database
design by creating a single purpose for each table. To normalize the College Enrollment Table,
I need to redesign it. As you discovered earlier, the table's current design
serves three different purposes. So the solution is to split
the table in three, essentially, creating a single table for each purpose. This means that I now have a Student Table
with information on each student. A Course Table that contains
the records for each course. And a Department Table with
information for each department. This separation of information helps
to fix the anomaly challenges. It also makes it easier to write sequel
queries in order to search for, sort and analyze data. You should now be able to explain
what database normalization is. And you should also be able to demonstrate
an understanding of anomalies and challenges, well done.