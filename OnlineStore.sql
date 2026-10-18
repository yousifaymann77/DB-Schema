create Database OnlineRetailStoreDB

use OnlineRetailStoreDB

create Table Suppliers(
SupplierId int primary key,
[Name] varchar(50) not null ,
ContactNumber varchar(13) not null ,
Country varchar(50) , 
Email varchar(40) , 
[Address] varchar(100) 
)

Create Table Products(
ProductId int primary key ,
[Name] varchar(50) not null , 
AddedDate Date , 
[Description] varchar(200) , 
StockQuantity int not null , 
UnitPrice decimal  
-- categoryId
)
Alter Table Products 
Add CategoryId int references Categories(CategoryId)



create Table Product_Supplier(
SupplierId int references Suppliers(SupplierId),
ProductId int references Products(ProductId),
primary key(SupplierId,ProductId)
)


create Table StockTransactions(
TranId int primary key , 
QuantityChange int ,
[Type] varchar(50) , 
Refrence varchar(30) , 
ProductId int references Products(ProductId)
)

create Table Categories(
CategoryId int primary key , 
[Name] varchar(30) not null , 
[Description] varchar(100) , 
MainCategory int references Categories(CategoryId)
)

create Table Customers(
CustomerId int primary key ,
FullName varchar(100) not null , 
PhoneNumber varchar(15) not null , 
Email varchar(50) ,
ShippingAddress varchar(100) not null ,
RegisterDate Date
)

create Table Payments(
PaymentId int primary key , 
PaymentDate Date , 
Amount decimal , 
[status] varchar(50) , 
Method varchar(50) 
)

create Table Reviews(
ReviewId int primary key , 
Rating int ,
ReviewDate Date , 
Comment varchar(100) , 
productId int not null references Products(ProductId),
CustomerId int not null references Customers(CustomerId)
)

create Table Orders(
OrderId int primary Key , 
[Status] varchar(50) , 
TotalAmount int , 
OrderDate Date , 
CustomerId int not null references Customers(CustomerId)
)

create Table OrderItems(
OrderItemId int primary key , 
Quantity int not null , 
UnitPrice decimal ,
productId int not null references Products(ProductId),
OrderId int not null unique references Orders(OrderId)
)

create Table Order_Payments(
OrderId int references Orders(OrderId) , 
PaymentId int references Payments(PaymentId) ,
primary key (OrderId,PaymentId)
)


create Table Shipments(
ShipmentId int primary key , 
ShipmentDate Date ,
[Status] varchar(40) , 
DeliveryDate Date , 
CarrierName varchar(50) , 
TrackingNumber int not null, 
OrderId int references Orders(OrderId) 
)