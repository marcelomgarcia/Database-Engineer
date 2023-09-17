Before developing a database
or a software application, you first need to plan how
you will organize your data. This plan is referred
to as a schema. It's essentially a blueprint of what your data looks like. In this video,
you'll learn how to explain the concept
of a database schema, identify the different meanings
of the term schema across different database systems and outline the advantages
of a database schema. Let's begin focusing on what developers mean when they
use the term schema. The general meaning of
a schema is that it's an organization or grouping of information and the
relationships among them. In the context of
a MySQL database, a schema means a collection
of data structures or an abstract design of how data is stored in a database. Essentially, schema and database are interchangeable
terms within MySQL. A schema is how data
is organized in the database and how it's
related to other data. But schema is defined in different ways across
different database systems. In a SQL server, a database schema
is a collection of different components
like tables, fields, datatypes, and keys. In Postgres SQL, a database schema is a
namespace with the name database objects like views,
indexes, and functions. An oracle schema system assigns a single
schema to each user. Oracle even names each schema
after its respective user. But no matter which type
of database you encounter, the two most important
concepts you need to understand when working with
schemas remain the same, organizational data
in the form of tables and the relationships
between the tables. Let's now cover the
components of a database. A SQL Server schema is comprised of what are
known as schema objects. Many of these objects
will probably already be familiar to you from
your study of databases. They include tables, columns, relationships,
datatypes, and keys. An example of a SQL
database schema is a music database
with data and artists, albums, and genres, all
stored in separate tables. However, these tables
can still be related to one another
through various keys. In other words, the data
within this database is organized in separate
tables or entities. You have the tables are also
related to one another. Essentially, a database
schema is comprised of all of the important
data and the relationships, the unique keys for all
entries in databases, and a name and datatype for
each column in a table. Now that you're familiar
with what a database is, let's move on and explore the advantages of
a database schema. Schemas provide logical
groupings for database objects. They also make it easier
to access and manipulate these database objects than
other available methods. Schemas also provide
greater database security. You can grant permission
to separate and protect database objects based
on user access rights. Finally, it's possible
to transfer ownership of schemas and their objects between users and other schemas. In this video, you've learned
that a database schema is a structure that represents the storage of data
in a database. You also now understand
that the meaning of schema changes across
different database systems. Lastly, you explored the advantages of
a database schema.