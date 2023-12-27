select
  Clients.ClientID, Clients.ContactNumber, Addresses.Street, Addresses.County,
  Orders.OrderID, Products.ProductID, Products.ProductName, Orders.Cost, Orders.Date
from
  Clients inner join Addresses inner join Orders inner join Products
on (
  Clients.AddressID = Addresses.AddressID 
  and Clients.ClientID = Orders.ClientID 
  and Orders.ProductID = Products.ProductID
)
where 
  year(Orders.Date) between 2021 and 2022
order by 
  Orders.Date
