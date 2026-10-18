create Table Hotels(
HotelId int primary key identity,
[Name] varchar(50) not null,
ContactNumber varchar(11) not null ,
[Address] varchar(100) , 
city varchar(50) not null,
starRating int 
--ManagerId int unique references Staff(StaffId)  
)
Alter Table Hotels
Add ManagerId int unique references Staff(StaffId)

create Table Staff(
StaffId int primary Key identity(5,5),
FullName varchar(50) not null , 
position varchar(30) not null, 
salary decimal(10,2) , 
HotelId int unique references Hotels(HotelId)
)


Create Table [Services](
ServiceId int primary key,
ServiceName varchar(50) not null,
[change] decimal , 
RequestDate Date ,
staffId int references Staff(StaffId)
)

create Table Rooms(
RoomNumber int Primary key,
RoomType varchar(20) not null , 
[Availability] bit not null,
Dailyrate varchar(10) , 
Capacity int not null , 
HotelId int unique references Hotels(HotelId)
)

Create Table Amenities(
RoomNumber int unique references Rooms(RoomNumber),
Amenity varchar(100) ,
primary key (RoomNumber , Amenity)
)

create Table Guests(
GuestId int primary key identity(5,5),
FullName varchar(50) not null ,
PassportNumber varchar(20) not null ,
Nationality varchar(40) , 
DateOfBirth Date 
)

create Table Guest_Contact_Details(
GuestId int unique references Guests(GuestId),
Detail varchar(100) ,
primary key (GuestId , Detail)
)

create Table payments(
PaymentId int primary key,
Method varchar(20) not null ,
Amount decimal(10,2) , 
payDate Date ,
ConfirmationNumber int not null 
)

create Table Reservations(
ReservationId int primary key , 
BookingDate Date ,
CheckinDate Date not null , 
CheckoutDate Date not null ,
ReservationStatus varchar(50) ,
TotalPrice decimal  ,
NumberOfAdults int ,
NumberOfChildren int 
)


create Table Reservation_Service(
ServiceId int references Services()
)
