IF DB_ID('RestaurantDB') IS NULL
    CREATE DATABASE RestaurantDB;
GO
USE RestaurantDB;
GO

CREATE TABLE Restaurants(
    RestaurantId INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    PhoneNumber VARCHAR(30) NOT NULL,
    OpeningHours VARCHAR(100) NOT NULL
);

CREATE TABLE RestaurantTables(
    TableId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    Capacity INT NOT NULL CHECK (Capacity > 0),
    FOREIGN KEY (RestaurantId) REFERENCES Restaurants(RestaurantId)
);

CREATE TABLE MenuItems(
    ItemId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(200),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    FOREIGN KEY (RestaurantId) REFERENCES Restaurants(RestaurantId)
);

CREATE TABLE Employees (
    EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    FOREIGN KEY (RestaurantId) REFERENCES Restaurants(RestaurantId)
);

CREATE TABLE Customers(
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50),
    PhoneNumber VARCHAR(30) NOT NULL
);

CREATE TABLE Reservations(
    ReservationId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    RestaurantId INT NOT NULL,
    TableId INT NOT NULL,
    ReservationDate DATETIME2 NOT NULL,
    PartySize INT NOT NULL CHECK (PartySize > 0),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (RestaurantId) REFERENCES Restaurants(RestaurantId),
    FOREIGN KEY (TableId) REFERENCES RestaurantTables(TableId)
);

CREATE TABLE Orders(
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    ReservationId INT NOT NULL,
    EmployeeId INT NOT NULL,
    OrderDate DATETIME2 NOT NULL,
    TotalAmount DECIMAL(12,2) NOT NULL CHECK (TotalAmount >= 0),
    FOREIGN KEY (ReservationId) REFERENCES Reservations(ReservationId),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);

CREATE TABLE OrderItems(
    OrderItemId INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL,
    ItemId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId) ON DELETE CASCADE,
    FOREIGN KEY (ItemId)  REFERENCES MenuItems(ItemId)
);
