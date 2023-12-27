with
SalesP4in2020 as (select concat(sum(Quantity), " (2020)") as "P4 product: Quantity sold" from Orders where year(Date) = 2020 and ProductID = "P4"),
SalesP4in2021 as (select concat(sum(Quantity), " (2021)" )from Orders where year(Date) = 2021 and ProductID = "P4"),
SalesP4in2022 as (select concat(sum(Quantity), " (2022)") from Orders where year(Date) = 2022 and ProductID = "P4")
select * from SalesP4in2020
union
select * from SalesP4in2021
union
select * from SalesP4in2022;