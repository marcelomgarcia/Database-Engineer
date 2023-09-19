# SQL Usage

Imagine that you've just been hired to create a database for college. First, you need to create tables to hold data in all aspects of the college. Then you need to insert data into these tables and then modify this data whenever something changes. That's a lot of work. But it's all possible with the use of SQL and crowed operations. Not familiar with these operations, no problem. Over the next few minutes, you learn how to explain the tasks that SQL syntax is used for when building a database, and demonstrate an understanding of the SQL subsets and sub languages. 

So let's return to our college database scenario. How can you possibly make all these changes in the database? Well, with the help of what web developers CRUD operations. Performing CRUD operations is the most common task when working with the database. CRUD stands for create, read, update and delete. Or in operational terms, create, add or insert data, read data, update existing data and delete data alongside these operations. 

There are many other things that SQL can do. Depending on what SQL is used for. It can be divided into many subsections or sub languages: 
* DDL: data definition language. 
* DML: data manipulation language. 
* DQL: data query language. 
* DCL: data control language. 

Let's take a closer look at these languages and their commands starting with data definition language or DDL. DDL as the name says helps you define data in your database. But what does it mean to define data? Before you can store data in the database you need to create the database and related objects like tables in which your data will be stored. For this, the DDL part of SQL has a command named `create`. 

Then you might need to modify already created database objects. For example, you might need to modify the structure of a table by adding a new column. You can perform this task with the DDL `alter` command. 

You can remove an object like a table from a database using the DDL `drop` command. 

Data manipulation language or DML commands are used to manipulate data in the database, like inserting updating or deleting data. Most crude operations fall under DML. To add data to a table, you can use the `insert` command. This command lets you specify the fields to add data too along with the values to be inserted. 

If you need to edit data that's already inserted into a table, just deploy the `update` command. And you can specify data to be removed by using the delete command. 

So far, you've learned how to add database objects and manage data within them. So how do you read or retrieve that data? To read data stored in a database, you can use data query language. DQL defines a select command to be able to retrieve data. Select lets you retrieve data from one or multiple tables letting you specify the data fields that you want based on preferred filter criteria. 

And finally, you can also use DCL or data control language to control access to the database. For example, using DCL commands, you control access to data stored in the database. Grant and revoke DDL commands are used to give users access privileges to data, and to revert access privileges already given to users. You should now be familiar with how SQL acts as the interface between the database and its users, and you should also be able to identify SQL operations and sub languages.