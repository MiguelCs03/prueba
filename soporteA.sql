Create database soporteA ; 
use soporteA; 

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY,
    DateOfBirth DATE,
    Name VARCHAR(100)
);


CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY IDENTITY,
    TicketingCode VARCHAR(50),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
);



CREATE TABLE FrequentFlyerCard (
    FFC_Number INT PRIMARY KEY,
    Miles INT,
    Meal_Code VARCHAR(10),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Airport (
    AirportID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100)
);

CREATE TABLE PlaneModel (
    PlaneModelID INT PRIMARY KEY IDENTITY,
    Description VARCHAR(100),
    Graphic VARBINARY(MAX)
);

CREATE TABLE Airplane (
    AirplaneID INT PRIMARY KEY IDENTITY,
    RegistrationNumber VARCHAR(50),
    BeginOfOperation DATE,
    Status VARCHAR(50),
    PlaneModelID INT,
    FOREIGN KEY (PlaneModelID) REFERENCES PlaneModel(PlaneModelID)
);

CREATE TABLE FlightNumber (
	FlightNumberID INT PRIMARY KEY IDENTITY,
	DepartureTime DATETIME,
	Description VARCHAR(50),
	Type VARCHAR(50),
	Airline VARCHAR(50),
	StartAirportID INT,
	GoalAirportID INT,
	PlaneModelID INT,
	FOREIGN KEY (StartAirportID) REFERENCES Airport(AirportID),
	FOREIGN KEY (GoalAirportID) REFERENCES Airport(AirportID),
	FOREIGN KEY (PlaneModelID) REFERENCES PlaneModel(PlaneModelID)
);

CREATE TABLE Flight (
	FlightID INT PRIMARY KEY IDENTITY,
	BoardingTime DATETIME,
	FlightDate DATE,
	Gate VARCHAR(50),
	CheckInCounter VARCHAR(50),
	FlightNumberID INT,
	FOREIGN KEY (FlightNumberID) REFERENCES FlightNumber(FlightNumberID)
);



CREATE TABLE Seat (
    SeatID INT PRIMARY KEY IDENTITY,
    Size VARCHAR(50),
    Number INT,
    Location VARCHAR(50),
    PlaneModelID INT,
    FOREIGN KEY (PlaneModelID) REFERENCES PlaneModel(PlaneModelID)
);

CREATE TABLE AvailableSeat (
    AvailableSeatID INT PRIMARY KEY IDENTITY,
    FlightID INT,
    SeatID INT,
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID),
    FOREIGN KEY (SeatID) REFERENCES Seat(SeatID)
);


CREATE TABLE Coupon (
    CouponID INT PRIMARY KEY IDENTITY,
    DateOfRedemption DATE,
    Class VARCHAR(50),
    Standby VARCHAR(50),
    MealCode VARCHAR(50),
    TicketID INT,
	AvailableSeatID INT,
	FlightID int ,
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID),
	FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

CREATE TABLE Coupon_AvailableSeat (
    CouponID INT,
    AvailableSeatID INT,
    PRIMARY KEY (CouponID, AvailableSeatID),
    FOREIGN KEY (CouponID) REFERENCES Coupon(CouponID),
    FOREIGN KEY (AvailableSeatID) REFERENCES AvailableSeat(AvailableSeatID)
);


CREATE TABLE PiecesOfLuggage (
    LuggageID INT PRIMARY KEY IDENTITY,
    Number INT,
    Weight DECIMAL(5, 2),
    CouponID INT,
    FOREIGN KEY (CouponID) REFERENCES Coupon(CouponID)
);
