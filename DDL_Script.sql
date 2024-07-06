	CREATE SCHEMA Movie_Ticket; 
	SET SEARCH_PATH TO Movie_Ticket;

	create table Artist(
	Artist_Id bigint,
	"Name" varchar(25),
	Gender varchar(2),
	DOB DATE,
	No_Of_Movies smallint,
	Networth NUMERIC(13,3),
	Spouse varchar(2),
		PRIMARY KEY(Artist_Id)
	);

	create Role(
		Artist_Id bigint,
		Movie_Name varchar(25),
		Release_Date DATE,
		Role_Name varchar(25)
		PRIMARY KEY(Artist_Id,Movie_Name,Release_Date,Role_Name),
		FOREIGN KEY (Artist_Id,Movie_Name,Release_Date,Role_Name) REFERENCES Works_On(Artist_Id,Movie_Name,Release_Date,Role_Name)
	);

	create table Works_On(
		Movie_Name varchar(25),
		Release_Date DATE,
		Artist_Id bigint,
		Fees Money,
			PRIMARY KEY(Artist_Id,Movie_Name,Release_Date,Role_Name),
			FOREIGN KEY (Movie_Name,Release_Date) REFERENCES 	Movies(Movie_Name,Release_Date)
			FOREIGN KEY (Artist_Id) REFERENCES Artist(Artist_Id)
	);

	create table Genre(
		Genre_Type varchar(20),
		Movie_Name varchar(25),
		Release_Date DATE,
			PRIMARY KEY(Movie_Name,Release_Date,Genre_Type),
			FOREIGN KEY (Movie_Name,Release_Date) REFERENCES Movies(Movie_Name,Release_Date)
	);

	create table "User"(
	User_Id bigint,
	"Name" varchar(25),
	Gender varchar(2), 
	Dat_Of_Birth DATE,
	Area varchar(30),
	City varchar(30),
	"State" varchar(30),
	Phone_No varchar(10) NOT NULL,
	Email varchar(30),
	"password" varchar(8),
		PRIMARY KEY(User_Id),
	);

	create table Movies(
	Movie_Name varchar(25),
	Movie_Duration TIME,
	Budget NUMERIC(15,3),
	Release_Date DATE,
		PRIMARY KEY(Movie_Name,Release_Date)
	);

	create table Language(
		Language_Name character varying(10),
		Movie_Name varchar(25),
		Release_Date DATE,
		PRIMARY KEY(Movie_Name,Release_Date,Language_Name),
		FOREIGN KEY(Movie_Name,Release_Date) REFERENCES  Movies(Movie_Name,Release_Date)
	);

	create table Theatre(
	Theatre_Id bigint,
	Theatre_Name varchar(25),
	No_Of_Screens int,
	Helpline_NO int,
	Theatre_Owner_Name varchar(25),
	Area varchar(30),
	City varchar(30),
	"State" varchar(30),
	Rating int,
		PRIMARY KEY(Theatre_Id)
	);

	create table "Show"(
	Theatre_Id bigint,
	Show_Id bigint,
	Show_Date DATE,
	Show_Time TIME,
	Screen_No bigint,
	Movie_Name varchar(25),
	Release_Date DATE,
	Cost_Of_Silver_Class NUMERIC(5,2),
	Cost_Of_Gold_Class NUMERIC(5,2),
	Cost_Of_Diamond_Class NUMERIC(5,2),
		PRIMARY KEY(Show_Id),
		FOREIGN KEY (Movie_Name,Release_Date) REFERENCES Movies(Movie_Name,Release_Date),
		FOREIGN KEY (Screen_No,Theatre_Id) REFERENCES Screen(Screen_No,Theatre_Id)
	);

	create table Seat(
	Seat_No int,
	Screen_No bigint,
	Theatre_Id bigint,
	Type_Of_Seat varchar(8),
		PRIMARY KEY(Screen_No,Seat_No,Theatre_Id),
		FOREIGN kEY (Screen_No,Theatre_Id) REFERENCES Screen(Screen_No,Theatre_Id)
	);

	create table Screen(
	Screen_No bigint,
	Theatre_Id bigint,
	Total_No_Of_Silver_Seats smallint,
	Total_No_Of_Gold_Seats smallint, 
	Total_No_Of_Diamond_Seats smallint,  
		PRIMARY KEY(Screen_No,Theatre_Id),
		FOREIGN KEY (Theatre_Id) REFERENCES Theatre(Theatre_Id)
	);

	create table Reviews(
	User_Id bigint,
	Movie_Name varchar(25),
	Release_Date DATE,
	Rating int,
	"Comments" TEXT,
		PRIMARY KEY(User_Id,Movie_Name,Release_Date),
		FOREIGN KEY(Movie_Name,Release_Date) REFERENCES  Movies(Movie_Name,Release_Date),
		FOREIGN KEY(User_Id) REFERENCES  "User"(User_Id)
	);

	create table Booking(
		Theatre_Id bigint,
		Screen_No bigint,
		Seat_No bigint,
		User_Id bigint,
		Show_Id bigint,
		User_UPI_ID varchar(50);
		Theatre_UPI_ID varchar(50);
		PRIMARY KEY(Theatre_Id,Screen_No,Seat_No,User_Id,Show_Id),
		FOREIGN KEY (Theatre_Id,Screen_No,Seat_No) REFERENCES Seat(Theatre_Id,Screen_No,Seat_No),
		FOREIGN KEY (User_Id) REFERENCES User(User_Id)
	);



	INSERT INTO Movies VALUES("Dangal","02:41:00","5475000000","2017-11-19");
	INSERT INTO Movies VALUES('Uri: The Surgical Strike','02:18:12',35235400000,'2022-12-12');
	INSERT INTO Movies VALUES('Bajrangi Bhaijaan','02:39:15',16524300000,'2018-08-12');
	INSERT INTO Movies VALUES('Chennai Express','02:21:00',1515000000,'2014-03-16');
	
	INSERT INTO Movies VALUES('LOC: Kargil','04:15:00',23523500000,'2015-06-17');
	INSERT INTO Movies VALUES('M.S.Dhoni: The Untold Story','03:05:00',4360000000,'2004-07-10');
	INSERT INTO Movies VALUES('Sivaji The Boss','03:05:15',1241200000,'2005-09-29');
	INSERT INTO Movies VALUES('RRR','03:02:00',14142000000,'2018-12-31');
	
	INSERT INTO Movies VALUES('Ghajini','03:04:00',2418000000,'2023-11-23');
	INSERT INTO Movies VALUES('KGF','02:35:45',2350000000,'2020-12-23');
	INSERT INTO Movies VALUES('Vikram','02:54:13',650000000,'2024-03-18');
	INSERT INTO Movies VALUES('Bahubali 2: The Conclusion','02:47:14',450000000,'2022-12-04');
	
	INSERT INTO Movies VALUES('Sanju','02:35:01',660000000,'2023-06-15');
	INSERT INTO Movies VALUES('Gold','02:33:22',340000000,'2021-04-14');
	INSERT INTO Movies VALUES('Main Hoon Na','03:02:00',3450000000,'2020-12-21');
	INSERT INTO Movies VALUES('Pushpa: The Rise','02:59:00',990000000,'2012-11-23');
	
	INSERT INTO Movies VALUES('Happy New Year','02:47:14',780000000,'2007-12-27');
	INSERT INTO Movies VALUES('Valimai','02:35:01',450000000,'2008-10-26');
	INSERT INTO Movies VALUES('Darr','02:57:12',2230000000,'2017-08-17');
	INSERT INTO Movies VALUES('Raja Hindustani','02:57:45',437000000,'2016-03-21');
	
	INSERT INTO Movies VALUES('Bigil','02:57:45',900000000,'2015-04-12');
	INSERT INTO Movies VALUES('Operation Valentine','02:10:14',400000000.43,'2022-12-25');
	INSERT INTO Movies VALUES('Hanuman','02:30:01',189000000,'2024-02-28');
	INSERT INTO Movies VALUES('Fighter','02:40:22',440000000,'2013-04-06');
	
	INSERT INTO Movies VALUES("Muzzle","01:40:00","450000000","2019:05:26");
	INSERT INTO Movies VALUES("Guntur Kaaram","02:39:01","340000000","2012:11:12");
	INSERT INTO Movies VALUES("Animal","03:21:14","6000000000","2014:03:13");
	INSERT INTO Movies VALUES("Sam Bahadur","02:28:28","230000000","2022:06:12");
	
	INSERT INTO Movies VALUES("Custody","02:28:10","450000000","2023:02:11");
	INSERT INTO Movies VALUES("Mem Famous","02:29:00","550000000","2021:02:25");
	INSERT INTO Movies VALUES("Hurry Om Hurry","02:27:13","4560000000","2020:09:11");
	INSERT INTO Movies VALUES("Leo","02:49:00","670000000","2011:08:07");
	
	INSERT INTO Movies VALUES("OMG 2","02:35:14","870000000","2022:11:04");
	INSERT INTO Movies VALUES("Merry Christmas","02:24:13","120000000","2018:06:07");
	INSERT INTO Movies VALUES("Dunki","02:41:89","2550000000","2012:06:15");
	INSERT INTO Movies VALUES("Salaar","02:55:14","7000000000","2023:09:03");
	
	INSERT INTO Movies VALUES("Lift","01:47:00","300000000","2024:01:22");
	INSERT INTO Movies VALUES("Mission Raniganj","02:14:34","4000000000","2023:08:19");
	INSERT INTO Movies VALUES("Love Again","01:44:34","500000000","2020:05:16");
	INSERT INTO Movies VALUES("Hidden Strike","01:44:34","2000000000","2021:04:11");
	
	INSERT INTO Movies VALUES("Spaceman","01:49:45","3200000000","2022:12:23");
	INSERT INTO Movies VALUES("The Conference","01:35:23","160000000","2023:04:19");
	INSERT INTO Movies VALUES("Damcel","01:47:34","70000000","2024:03:08");
	INSERT INTO Movies VALUES("Hi Nanna","02:35:34","500000000","2023:12:07");


	
	INSERT INTO "User" (User_Id, "Name", Gender, Dat_Of_Birth, Area, City, "State", Phone_No, Email, "password") 
	VALUES 
	(101, 'Ravi Kumar', 'M', '1990-05-15', 'Dwarka', 'Delhi', 'Delhi', '9876543210', 'ravi.kumar@example.com', 'password1'),
	(101, 'Ravi Kumar', 'M', '1990-05-15', 'Dwarka', 'Delhi', 'Delhi', '9876543210', 'ravi.kumar@example.com', 'assword1'),
	(101, 'Ravi Kumar', 'M', '1990-05-15', 'Dwarka', 'Delhi', 'Delhi', '9876543210', 'ravi.kumar@example.com', 'pssword1'),
	(101, 'Ravi Kumar', 'M', '1990-05-15', 'Dwarka', 'Delhi', 'Delhi', '9876543210', 'ravi.kumar@example.com', 'pasword1'),

	(110, 'Pooja Shah', 'F', '1993-05-29', 'Chandkheda', 'Ahmedabad', 'Gujarat', '9876543219', 'pooja.shah@example.com', 'paword10'),
	(110, 'Pooja Shah', 'F', '1993-05-29', 'Chandkheda', 'Ahmedabad', 'Gujarat', '9876543219', 'pooja.shah@example.com', 'pasord10'),
	(110, 'Pooja Shah', 'F', '1993-05-29', 'Chandkheda', 'Ahmedabad', 'Gujarat', '9876543219', 'pooja.shah@example.com', 'passwd10'),
	(110, 'Pooja Shah', 'F', '1993-05-29', 'Chandkheda', 'Ahmedabad', 'Gujarat', '9876543219', 'pooja.shah@example.com', 'passwo10'),

	(117, 'Sachin Yadav', 'M', '1999-02-20', 'Kukatpally', 'Hyderabad', 'Telangana', '9876543226', 'sachin.yadav@example.com', 'passwoad'),
	(117, 'Sachin Yadav', 'M', '1999-02-20', 'Kukatpally', 'Hyderabad', 'Telangana', '9876543226', 'sachin.yadav@example.com', 'passwd17'),
	(117, 'Sachin Yadav', 'M', '1999-02-20', 'Kukatpally', 'Hyderabad', 'Telangana', '9876543226', 'sachin.yadav@example.com', 'pasord17'),
	(117, 'Sachin Yadav', 'M', '1999-02-20', 'Kukatpally', 'Hyderabad', 'Telangana', '9876543226', 'sachin.yadav@example.com', 'psword17'),

	(123, 'Ajay Sharma', 'M', '1993-08-20', 'Kharadi', 'Pune', 'Maharashtra', '9876543232', 'ajay.sharma@example.com', 'passwor3'),
	(123, 'Ajay Sharma', 'M', '1993-08-20', 'Kharadi', 'Pune', 'Maharashtra', '9876543232', 'ajay.sharma@example.com', 'passwd23'),
	(123, 'Ajay Sharma', 'M', '1993-08-20', 'Kharadi', 'Pune', 'Maharashtra', '9876543232', 'ajay.sharma@example.com', 'pasord23'),



	
	(102, 'Priya Sharma', 'F', '1988-09-20', 'Malad', 'Mumbai', 'Maharashtra', '9876543211', 'priya.sharma@example.com', 'passwrd2'),
	(103, 'Amit Singh', 'M', '1995-02-10', 'Baner', 'Pune', 'Maharashtra', '9876543212', 'amit.singh@example.com', 'pasword3',),
	(104, 'Ananya Patel', 'F', '1992-07-25', 'Jayanagar', 'Bangalore', 'Karnataka', '9876543213', 'ananya.patel@example.com', 'passwod3'),
	(105, 'Sandeep Verma', 'M', '1987-11-30', 'Aliganj', 'Lucknow', 'Uttar Pradesh', '9876543214', 'sandeep.verma@example.com', 'pasword5'),
	(106, 'Shreya Gupta', 'F', '1991-04-05', 'Salt Lake', 'Kolkata', 'West Bengal', '9876543215', 'shreya.gupta@example.com', 'pasword6'),
	(107, 'Rahul Sharma', 'M', '1986-08-12', 'Hadapsar', 'Pune', 'Maharashtra', '9876543216', 'rahul.sharma@example.com', 'pasword7'),
	(108, 'Neha Reddy', 'F', '1990-03-18', 'Madhapur', 'Hyderabad', 'Telangana', '9876543217', 'neha.reddy@example.com', 'passwor8'),
	(109, 'Alok Singhania', 'M', '1989-12-24', 'Indiranagar', 'Bangalore', 'Karnataka', '9876543218', 'alok.singhania@example.com', 'pasword9'),
	(111, 'Vivek Chauhan', 'M', '1994-10-14', 'Kondapur', 'Hyderabad', 'Telangana', '9876543220', 'vivek.chauhan@example.com', 'pasword11'),
	(112, 'Swati Desai', 'F', '1985-01-19', 'Gomti Nagar', 'Lucknow', 'Uttar Pradesh', '9876543221', 'swati.desai@example.com', 'passord12'),
	(113, 'Rajat Mehta', 'M', '1983-06-28', 'Koregaon Park', 'Pune', 'Maharashtra', '9876543222', 'rajat.mehta@example.com', 'pasword13'),
	(114, 'Anjali Singh', 'F', '1984-11-03', 'Saket', 'Delhi', 'Delhi', '9876543223', 'anjali.singh@example.com', 'passwor4'),
	(115, 'Amitabh Tiwari', 'M', '1981-04-08', 'Juhu', 'Mumbai', 'Maharashtra', '9876543224', 'amitabh.tiwari@example.com', 'pasord15'),
	(116, 'Riya Singhania', 'F', '1996-09-15', 'Vastrapur', 'Ahmedabad', 'Gujarat', '9876543225', 'riya.singhania@example.com', 'psword16'),
	(118, 'Kritika Sharma', 'F', '1997-07-25', 'Thane', 'Mumbai', 'Maharashtra', '9876543227', 'kritika.sharma@example.com', 'paword18'),

	(119, 'Rohit Kapoor', 'M', '1998-12-30', 'Anna Nagar', 'Chennai', 'Tamil Nadu', '9876543228', 'rohit.kapoor@example.com', 'paword19'),
	(120, 'Divya Reddy', 'F', '1994-05-05', 'JP Nagar', 'Bangalore', 'Karnataka', '9876543229', 'divya.reddy@example.com', 'psword20'),
	(121, 'Kunal Kumar', 'M', '1982-10-10', 'Indiranagar', 'Bangalore', 'Karnataka', '9876543230', 'kunal.kumar@example.com', 'passwd21'),
	(122, 'Meera Patel', 'F', '1986-03-15', 'Andheri', 'Mumbai', 'Maharashtra', '9876543231', 'meera.patel@example.com', 'passwo22'),
	(124, 'Nisha Gupta', 'F', '1989-01-25', 'Malviya Nagar', 'Delhi', 'Delhi', '9876543233', 'nisha.gupta@example.com', 'passwd24'),
	(125, 'Alok Verma', 'M', '1984-06-30', 'Balewadi', 'Pune', 'Maharashtra', '9876543234', 'alok.verma@example.com', 'pasord25'),
	(126, 'Neha Sharma', 'F', '1987-11-05', 'Banashankari', 'Bangalore', 'Karnataka', '9876543235', 'neha.sharma@example.com', 'passwd26'),
	(127, 'Rajesh Singh', 'M', '1985-04-10', 'Wakad', 'Pune', 'Maharashtra', '9876543236', 'rajesh.singh@example.com', 'passwo27'),
	(128, 'Anushka Kapoor', 'F', '1990-09-15', 'Powai', 'Mumbai', 'Maharashtra', '9876543237', 'anushka.kapoor@example.com', 'passwor8'),
	(129, 'Suresh Kumar', 'M', '1989-02-20', 'Kothrud', 'Pune', 'Maharashtra', '9876543238', 'suresh.kumar@example.com', 'passwd29'),
	(130, 'Riya Sharma', 'F', '1994-07-25', 'Koramangala', 'Bangalore', 'Karnataka', '9876543239', 'riya.sharma@example.com', 'pasord3'),
	(131, 'Vikas Gupta', 'M', '1997-12-30', 'Kondhwa', 'Pune', 'Maharashtra', '9876543240', 'vikas.gupta@example.com', 'pasord31'),
	(132, 'Komal Shah', 'F', '1996-05-05', 'Aundh', 'Pune', 'Maharashtra', '9876543241', 'komal.shah@example.com', 'psword32'),
	(133, 'Rahul Malhotra', 'M', '1983-10-10', 'Magarpatta', 'Pune', 'Maharashtra', '9876543242', 'rahul.malhotra@example.com', 'ssword33'),
	(134, 'Pooja Gupta', 'F', '1986-03-15', 'Kalewadi', 'Pune', 'Maharashtra', '9876543243', 'pooja.gupta@example.com', 'passwd34'),

	
	(135, 'Ankit Singh', 'M', '1990-08-20', 'Nigdi', 'Pune', 'Maharashtra', '9876543244', 'ankit.singh@example.com', 'pasord35'),
	(136, 'Monika Verma', 'F', '1993-01-25', 'Hinjewadi', 'Pune', 'Maharashtra', '9876543245', 'monika.verma@example.com', 'passwo36'),
	(137, 'Prakash Tiwari', 'M', '1986-06-30', 'Kharadi', 'Pune', 'Maharashtra', '9876543246', 'prakash.tiwari@example.com', 'paword37'),
	(138, 'Rashmi Mishra', 'F', '1989-11-05', 'Wagholi', 'Pune', 'Maharashtra', '9876543247', 'rashmi.mishra@example.com', 'psword38'),
	(139, 'Ashok Patel', 'M', '1985-04-10', 'Viman Nagar', 'Pune', 'Maharashtra', '9876543248', 'ashok.patel@example.com', 'psword39'),
	(140, 'Sneha Deshmukh', 'F', '1990-09-15', 'Hadapsar', 'Pune', 'Maharashtra', '9876543249', 'sneha.deshmukh@example.com', 'passrd40'),
	(141, 'Rajat Gupta', 'M', '1983-02-20', 'Kalyani Nagar', 'Pune', 'Maharashtra', '9876543250', 'rajat.gupta@example.com', 'passwd41'),
	(142, 'Priya Mishra', 'F', '1984-07-25', 'Koregaon Park', 'Pune', 'Maharashtra', '9876543251', 'priya.mishra@example.com', 'paword42'),

	(143,'Sachin Singh', 'M', '1989-12-30', 'Kothrud', 'Pune', 'Maharashtra', '9876543252', 'sachin.singh@example.com', 'passwd43'),
	(144, 'Ruchi Sharma', 'F', '1994-05-05', 'Baner', 'Pune', 'Maharashtra', '9876543253', 'ruchi.sharma@example.com', 'pasord44'),
	(145, 'Vikram Joshi', 'M', '1997-10-10', 'Hinjewadi', 'Pune', 'Maharashtra', '9876543254', 'vikram.joshi@example.com', 'pasord45'),
	(146, 'Pooja Shah', 'F', '1996-03-15', 'Wagholi', 'Pune', 'Maharashtra', '9876543255', 'pooja.shah@example.com', 'pasord46'),
	(147, 'Alok Singh', 'M', '1991-08-20', 'Magarpatta', 'Pune', 'Maharashtra', '9876543256', 'alok.singh@example.com', 'paword4'),
	(148, 'Neha Patel', 'F', '1995-01-25', 'Hadapsar', 'Pune', 'Maharashtra', '9876543257', 'neha.patel@example.com', 'paword94'),
	(149, 'Rajesh Tiwari', 'M', '1988-06-30', 'Viman Nagar', 'Pune', 'Maharashtra', '9876543258', 'rajesh.tiwari@example.com', 'psword49'),
	(150,'Priya Mishra', 'F', '1993-09-15', 'Kalyani Nagar', 'Pune', 'Maharashtra', '9876543259', 'priya.mishra@exampl.com', 'psword50');

	(151, 'Amit Kumar', 'M', '1992-04-10', 'Kondhwa', 'Pune', 'Maharashtra', '9876543260', 'amit.kumar@example.com', 'passwd51'),
	(152, 'Shreya Gupta', 'F', '1997-09-15', 'Magarpatta', 'Pune', 'Maharashtra', '9876543261', 'shreya.gupta@example.com', 'pasord52'),
	(153, 'Ravi Tiwari', 'M', '1985-02-20', 'Nigdi', 'Pune', 'Maharashtra', '9876543262', 'ravi.tiwari@example.com', 'pasord53'),
	(154, 'Komal Sharma', 'F', '1990-07-25', 'Balewadi', 'Pune', 'Maharashtra', '9876543263', 'komal.sharma@example.com', 'passwo54'),
	(155, 'Ankit Verma', 'M', '1983-12-30', 'Wakad', 'Pune', 'Maharashtra', '9876543264', 'ankit.verma@example.com', 'passwd55'),
	(156, 'Priya Singh', 'F', '1984-05-05', 'Kharadi', 'Pune', 'Maharashtra', '9876543265', 'priya.singh@example.com', 'pasord56'),
	(157, 'Sachin Kumar', 'M', '1989-10-10', 'Hadapsar', 'Pune', 'Maharashtra', '9876543266', 'sachin.kumar@example.com', 'psword57'),
	(158, 'Neha Sharma', 'F', '1994-03-15', 'Viman Nagar', 'Pune', 'Maharashtra', '9876543267', 'neha.sharma@example.com', 'passwo58'),

	(159,'Rajesh Singh', 'M', '1985-08-20', 'Hinjewadi', 'Pune', 'Maharashtra', '9876543268', 'rajesh.singh@example.com', 'pasord59'),
	(160, 'Kavita Patel', 'F', '1990-01-25', 'Kalyani Nagar', 'Pune', 'Maharashtra', '9876543269', 'kavita.patel@example.com', 'psword60'),
	(161, 'Vivek Gupta', 'M', '1983-06-30', 'Kondhwa', 'Pune', 'Maharashtra', '9876543270', 'vivek.gupta@example.com', 'ssword61'),
	(162, 'Riya Sharma', 'F', '1986-09-15', 'Magarpatta', 'Pune', 'Maharashtra', '9876543271', 'riya.sharma@example.com', 'passwo6'),
	(163, 'Alok Tiwari', 'M', '1991-02-20', 'Nigdi', 'Pune', 'Maharashtra', '9876543272', 'alok.tiwari@example.com', 'passwo6'),
	(164, 'Nisha Sharma', 'F', '1996-07-25', 'Balewadi', 'Pune', 'Maharashtra', '9876543273', 'nisha.sharma@example.com', 'passrd64'),
	(165, 'Rajesh Gupta', 'M', '1982-12-30', 'Wakad', 'Pune', 'Maharashtra', '9876543274', 'rajesh.gupta@example.com', 'passwo65'),
	(166,'Pooja Singh', 'F', '1989-05-05', 'Kharadi', 'Pune', 'Maharashtra', '9876543275', 'pooja.singh@example.com', 'passrd66'),

	(167, 'Amit Kumar', 'M', '1994-10-10', 'Hadapsar', 'Pune', 'Maharashtra', '9876543276', 'amit.kumar@example.com', 'paword67'),
	(168, 'Shreya Gupta', 'F', '1999-03-15', 'Viman Nagar', 'Pune', 'Maharashtra', '9876543277', 'shreya.gupta@example.com', 'passrd68'),
	(169, 'Ravi Tiwari', 'M', '1984-08-20', 'Kalyani Nagar', 'Pune', 'Maharashtra', '9876543278', 'ravi.tiwari@example.com', 'pasord69'),
	(170, 'Komal Sharma', 'F', '1989-01-25', 'Hinjewadi', 'Pune', 'Maharashtra', '9876543279', 'komal.sharma@example.com', 'ssword70'),
	(171, 'Ankit Verma', 'M', '1987-06-30', 'Kondhwa', 'Pune', 'Maharashtra', '9876543280', 'ankit.verma@example.com', 'passwd71'),
	(172, 'Priya Singh', 'F', '1992-09-15', 'Magarpatta', 'Pune', 'Maharashtra', '9876543281', 'priya.singh@example.com', 'passwo72'),
	(173, 'Sachin Kumar', 'M', '1986-02-20', 'Nigdi', 'Pune', 'Maharashtra', '9876543282', 'sachin.kumar@example.com', 'passwo73'),
	(174, 'Neha Sharma', 'F', '1991-07-25', 'Balewadi', 'Pune', 'Maharashtra', '9876543283', 'neha.sharma@example.com', 'passrd74'),

	(175,'Rajesh Singh', 'M', '1983-12-30', 'Wakad', 'Pune', 'Maharashtra', '9876543284', 'rajesh.singh@example.com', 'paword75'),
	(176, 'Kavita Patel', 'F', '1988-05-05', 'Kharadi', 'Pune', 'Maharashtra', '9876543285', 'kavita.patel@example.com', 'ssword76'),
	(177, 'Vivek Gupta', 'M', '1993-10-10', 'Hadapsar', 'Pune', 'Maharashtra', '9876543286', 'vivek.gupta@example.com', 'passwo77'),
	(178, 'Riya Sharma', 'F', '1998-03-15', 'Viman Nagar', 'Pune', 'Maharashtra', '9876543287', 'riya.sharma@example.com', 'passrd78'),
	(179, 'Alok Tiwari', 'M', '1986-08-20', 'Kalyani Nagar', 'Pune', 'Maharashtra', '9876543288', 'alok.tiwari@example.com', 'paword79'),
	(180, 'Nisha Sharma', 'F', '1991-01-25', 'Hinjewadi', 'Pune', 'Maharashtra', '9876543289', 'nisha.sharma@example.com', 'ssword80'),
	(181, 'Rajesh Gupta', 'M', '1984-06-30', 'Kondhwa', 'Pune', 'Maharashtra', '9876543290', 'rajesh.gupta@example.com', 'passwo81'),
	(182,'Pooja Singh', 'F', '1989-09-15', 'Magarpatta', 'Pune', 'Maharashtra', '9876543291', 'pooja.singh@example.com', 'passrd82'),



	INSERT INTO Genre VALUES('Action','Dangal','2017-11-19');
	INSERT INTO Genre VALUES('Action','Uri: The Surgical Strike','2022-12-12');
	INSERT INTO Genre VALUES('Action','Bajrangi Bhaijaan','2018-08-12');
	INSERT INTO Genre VALUES('Action','Chennai Express','2014-03-16');
	INSERT INTO Genre VALUES('Action','LOC: Kargil','2015-06-17');

	INSERT INTO Genre VALUES('Horror','M.S.Dhoni: The Story','2004-07-10');
	INSERT INTO Genre VALUES('Horror','Sivaji The Boss','2005-09-29');
	INSERT INTO Genre VALUES('Horror','RRR','2018-12-31');
	INSERT INTO Genre VALUES('Horror','Ghajini','2023-11-23');
	INSERT INTO Genre VALUES('Horror','KGF','2020-12-23');

	INSERT INTO Genre VALUES('Romance','Vikram','2024-03-18');
	INSERT INTO Genre VALUES('Romance','Bahubali 2: The Conclusion','2022-12-04');
	INSERT INTO Genre VALUES('Romance','Sanju','2023-06-15');
	INSERT INTO Genre VALUES('Romance','Gold','2021-04-14');
	INSERT INTO Genre VALUES('Romance','Main Hoon Na','2020-12-21');

	INSERT INTO Genre VALUES('Mystery','Pushpa: The Rise','2012-11-23');
	INSERT INTO Genre VALUES('Mystery','Happy New Year','2007-12-27');
	INSERT INTO Genre VALUES('Mystery','Valimai','2008-10-26');
	INSERT INTO Genre VALUES('Mystery','Darr','2017-08-17');
	INSERT INTO Genre VALUES('Mystery','Raja Hindustani','2016-03-21');

	INSERT INTO Genre VALUES('Biography','Bigil','2015-04-12');
	INSERT INTO Genre VALUES('Biography','Operation Valentine','2022-12-25');
	INSERT INTO Genre VALUES('Biography','Hanuman','2024-02-28');
	INSERT INTO Genre VALUES('Biography','Fighter','2013-04-06');
	INSERT INTO Genre VALUES('Biography','Muzzle','2019-05-26');

	INSERT INTO Genre VALUES('Adventure','Guntur Kaaram','2012-11-12');
	INSERT INTO Genre VALUES('Adventure','Animal','2014-03-13');
	INSERT INTO Genre VALUES('Adventure','Sam Bahadur','2022-06-12');
	INSERT INTO Genre VALUES('Adventure','Custody','2023-02-11');
	INSERT INTO Genre VALUES('Adventure','Mem Famous','2021-02-25');

	INSERT INTO Genre VALUES('Thriller','Hurry Om Hurry','2020-09-11');
	INSERT INTO Genre VALUES('Thriller','Leo','2011-08-07');
	INSERT INTO Genre VALUES('Thriller','OMG 2','2022-11-04');
	INSERT INTO Genre VALUES('Thriller','Merry Christmas','2018-06-07');
	INSERT INTO Genre VALUES('Thriller','Dunki','2012-06-15');

	INSERT INTO Genre VALUES('Comedy','Salaar','2023-09-03');
	INSERT INTO Genre VALUES('Comedy','Lift','2024-01-22');
	INSERT INTO Genre VALUES('Comedy','Mission Raniganj','2023-08-19');
	INSERT INTO Genre VALUES('Comedy','Love Again','2020-05-16');
	INSERT INTO Genre VALUES('Comedy','Hidden Strike','2021-04-11');



	INSERT INTO Artist VALUES (1001, "Deepika Padukone", 'F', '1986-01-05', 30, 2800000000, "Ranveer Singh");
	INSERT INTO Artist VALUES (1002, "Salman Khan", 'M', '1965-12-27', 85, 3200000000, NULL);
	INSERT INTO Artist VALUES (1003, "Akshay Kumar", 'M', '1967-09-09', 120, 4100000000, "Twinkle Khanna");
	INSERT INTO Artist VALUES (1004, 'Aamir Khan', 'M', '1965-03-14', 50, 4500000000, 'Kiran Rao');
	INSERT INTO Artist VALUES (1005, 'Shah Rukh Khan', 'M', '1965-11-02', 80, 6900000000, 'Gauri Khan');
	INSERT INTO Artist VALUES (1006, 'Katrina Kaif', 'F', '1983-07-16', 40, 2835000000, 'Vicky Kaushal');
	INSERT INTO Artist VALUES (1007, 'Kareena Kapoor', 'F', '1980-09-21', 42, 5600000000, 'Saif Ali Khan');
	INSERT INTO Artist VALUES (1008, 'Kajol', 'F', '1974-08-05', 48, 4200000000, 'Ajay Devgn');
	INSERT INTO Artist VALUES (1009, 'John Abraham', 'M', '1972-12-17', 50, 3000000000, 'Priya Runchal');
	INSERT INTO Artist VALUES (1010, 'Amitabh Bachchan', 'M', '1942-10-11', 200, 4000000000, 'Jaya Bachchan');
	INSERT INTO Artist VALUES (1011, 'Sonakshi Sinha', 'F', '1987-06-09', 25, 1200000000, NULL);
	INSERT INTO Artist VALUES (1012, 'Alia Bhatt', 'F', '1993-03-15', 40, 3500000000, 'Ranbir Kapoor');
	INSERT INTO Artist VALUES (1013, 'Anushka Sharma', 'F', '1988-05-01', 30, 2000000000, 'Virat Kohli');
	INSERT INTO Artist VALUES (1014, 'Shahid Kapoor', 'M', '1981-02-25', 45, 2500000000, 'Mira Rajput');
	INSERT INTO Artist VALUES (1015, 'Anil Kapoor', 'M', '1956-12-24', 100, 3800000000, 'Sunita Kapoor');
	INSERT INTO Artist VALUES (1016, 'Saif Ali Khan', 'M', '1970-08-16', 65, 4500000000, 'Kareena Kapoor');
	INSERT INTO Artist VALUES (1017, 'Prakash Raj', 'M','1965-03-26', 100, 1500000000, NULL);
	INSERT INTO Artist VALUES (1018, 'Jacqueline Fernandez', 'F', '1985-08-11', 40, 3000000000, NULL);
	INSERT INTO Artist VALUES (1019, 'Rishi Kapoor', 'M', '1950-09-04', 65, 3000000050, 'Neetu Singh');
	INSERT INTO Artist VALUES (1020, 'Kangana Ranaut', 'F', '1987-03-28', 30, 3000050000, NULL);
	INSERT INTO Artist VALUES (1021, 'Nana Patekar', 'M', '1951-01-01', 70, 100000000, NULL);
	INSERT INTO Artist VALUES (1022, 'Aishwarya Rai Bachchan', 'F', '1973-11-01', 45, 4000000000, 'Abhishek Bachchan');
	INSERT INTO Artist VALUES (1023, 'Ritesh Deshmukh', 'M', '1974-12-17', 40, 2000000000, 'Genelia DSouza');
	INSERT INTO Artist VALUES (1024, 'Sonu Sood', 'M', '1967-07-27', 75, 3000000000, NULL);
	INSERT INTO Artist VALUES (1025, 'Shilpa Shetty Kundra', 'F', '1975-06-08', 60, 1005000000, 'Raj Kundra');
	INSERT INTO Artist VALUES (1026, 'Sunil Shetty', 'M', '1961-08-11', 90, 3250000000, 'Mana Shetty');
	INSERT INTO Artist VALUES (1027, 'Sushant Singh Rajput', 'M', '1986-01-21', 25, 1230000000, NULL);
	INSERT INTO Artist VALUES (1028, 'Vicky Kaushal', 'M', '1988-05-18', 20, 2000000000, 'Katrina Kaif');



	INSERT INTO "Role" VALUES('Producer','Dangal','2017-11-19',1004);
	INSERT INTO "Role" VALUES('Actor','Dangal','2017-11-19',1004);
	INSERT INTO "Role" VALUES('Actor','Bajrangi Bhaijaan','2018-08-12',1002);
	INSERT INTO "Role" VALUES('Producer','Bajrangi Bhaijaan','2018-08-12',1002);
	INSERT INTO "Role" VALUES('Producer','Chennai Express','2014-03-16',1005);
	INSERT INTO "Role" VALUES('Actor','Chennai Express','2014-03-16',1005);

	INSERT INTO "Role" VALUES ('Actor','Uri: The Strike','2022-12-12',1001);
	INSERT INTO "Role" VALUES ('Actor','LOC:Kargil','2015-06-17',1003);
	INSERT INTO "Role" VALUES ('Actor','Sivaji The Boss','2005-09-29',1006);
	INSERT INTO "Role" VALUES ('Actor','RRR','2018-12-31',1007);
	INSERT INTO "Role" VALUES ('Actor','Ghajini','2023-11-23',1008);
	INSERT INTO "Role" VALUES ('Actor','KGF','2020-12-23',1009);
	INSERT INTO "Role" VALUES ('Actor','Vikram','2024-03-18',1010);
	INSERT INTO "Role" VALUES ('Actor','Bahubali 2','2022-12-04',1011);
	INSERT INTO "Role" VALUES ('Actor','Sanju','2023-06-15',1012);
	INSERT INTO "Role" VALUES ('Actor','Gold','2021-04-14',1013);
	INSERT INTO "Role" VALUES ('Actor','Main Hoon Na','2020-12-21',1014);
	INSERT INTO "Role" VALUES ('Actor','Pushpa: The Rise','2012-11-23',1015);
	INSERT INTO "Role" VALUES ('Actor','Happy New Year','2007-12-27',1016);
	INSERT INTO "Role" VALUES ('Actor','Valimai','2008-10-26',1017);
	INSERT INTO "Role" VALUES ('Actor','Darr','2017-08-17',1018);
	INSERT INTO "Role" VALUES ('Actor','Raja Hindustani','2016-03-21',1019);
	INSERT INTO "Role" VALUES ('Actor','Bigil','2015-04-12',1020);
	INSERT INTO "Role" VALUES ('Actor','Operation Valentine','2022-12-25',1021);
	INSERT INTO "Role" VALUES ('Actor','Hanuman','2024-02-28',1022);
	INSERT INTO "Role" VALUES ('Actor','Fighter','2013-04-06',1023);
	INSERT INTO "Role" VALUES ('Actor','Muzzle','2019-05-26',1024);
	INSERT INTO "Role" VALUES ('Actor','Guntur Kaaram','2012-11-12',1025);
	INSERT INTO "Role" VALUES ('Actor','Animal','2014-03-13',1026);
	INSERT INTO "Role" VALUES ('Actor','M.S.Dhoni: The Story','2004-07-10',1027);
	INSERT INTO "Role" VALUES ('Actor','Sam Bahadur','2022-06-12',1028);



	INSERT INTO Works_ON VALUES ('Uri: The Surgical Strike','2022-12-12',1001,140000000);
	INSERT INTO Works_ON VALUES ('LOC:Kargil','2015-06-17',1003,450000000);
	INSERT INTO Works_ON VALUES ('Sivaji The Boss','2005-09-29',1006,340000000);
	INSERT INTO Works_ON VALUES ('RRR','2018-12-31',1007,130000000);
	INSERT INTO Works_ON VALUES ('Ghajini','2023-11-23',1008,340000000);
	INSERT INTO Works_ON VALUES ('KGF','2020-12-23',1009,110000000);
	INSERT INTO Works_ON VALUES ('Vikram','2024-03-18',1010,120000000);
	INSERT INTO Works_ON VALUES ('Bahubali 2','2022-12-04',1011,90000000);
	INSERT INTO Works_ON VALUES ('Sanju','2023-06-15',1012,80000000);
	INSERT INTO Works_ON VALUES ('Gold','2021-04-14',1013,70000000);
	INSERT INTO Works_ON VALUES ('Main Hoon Na','2020-12-21',1014,40000000);
	INSERT INTO Works_ON VALUES ('Pushpa: The Rise','2012-11-23',1015,320000000);
	INSERT INTO Works_ON VALUES ('Happy New Year','2007-12-27',1016,230000000);
	INSERT INTO Works_ON VALUES ('Valimai','2008-10-26',1017,150000000);
	INSERT INTO Works_ON VALUES ('Darr','2017-08-17',1018,210000000);
	INSERT INTO Works_ON VALUES ('Raja Hindustani','2016-03-21',1019,120000000);
	INSERT INTO Works_ON VALUES ('Bigil','2015-04-12',1020,100000000);
	INSERT INTO Works_ON VALUES ('Operation Valentine','2022-12-25',1021,320000000);
	INSERT INTO Works_ON VALUES ('Hanuman','2024-02-28',1022,210000000);
	INSERT INTO Works_ON VALUES ('Fighter','2013-04-06',1023,50000000);
	INSERT INTO Works_ON VALUES ('Muzzle','2019-05-26',1024,80000000);
	INSERT INTO Works_ON VALUES ('Guntur Kaaram','2012-11-12',1025,210000000);
	INSERT INTO Works_ON VALUES ('Animal','2014-03-13',1026,170000000);
	INSERT INTO Works_ON VALUES ('M.S.Dhoni: The Untold','2004-07-10',1027,40235000);
	INSERT INTO Works_ON VALUES ('Sam Bahadur','2022-06-12',1028,124001341);




	INSERT INTO Seat VALUES (1,1,100,'Silver');
	INSERT INTO Seat VALUES (2,1,100,'Silver');
	INSERT INTO Seat VALUES (3,1,100,'Silver');
	INSERT INTO Seat VALUES (4,1,100,'Silver');
	INSERT INTO Seat VALUES (5,1,100,'Silver');
	INSERT INTO Seat VALUES (6,1,100,'Silver');
	INSERT INTO Seat VALUES (7,1,100,'Silver');
	INSERT INTO Seat VALUES (8,1,100,'Silver');
	INSERT INTO Seat VALUES (9,1,100,'Silver');
	INSERT INTO Seat VALUES (10,1,100,'Silver');
	INSERT INTO Seat VALUES (11,1,100,'Gold');
	INSERT INTO Seat VALUES (12,1,100,'Gold');
	INSERT INTO Seat VALUES (13,1,100,'Gold');
	INSERT INTO Seat VALUES (14,1,100,'Gold');
	INSERT INTO Seat VALUES (15,1,100,'Gold');
	INSERT INTO Seat VALUES (16,1,100,'Diamond');
	INSERT INTO Seat VALUES (17,1,100,'Diamond');
	INSERT INTO Seat VALUES (18,1,100,'Diamond');


	INSERT INTO Seat VALUES (1,2,100,'Silver');
	INSERT INTO Seat VALUES (2,2,100,'Silver');
	INSERT INTO Seat VALUES (3,2,100,'Silver');
	INSERT INTO Seat VALUES (4,2,100,'Silver');
	INSERT INTO Seat VALUES (5,2,100,'Silver');
	INSERT INTO Seat VALUES (6,2,100,'Silver');
	INSERT INTO Seat VALUES (7,2,100,'Silver');
	INSERT INTO Seat VALUES (8,2,100,'Silver');
	INSERT INTO Seat VALUES (9,2,100,'Silver');
	INSERT INTO Seat VALUES (10,2,100,'Silver');
	INSERT INTO Seat VALUES (11,2,100,'Gold');
	INSERT INTO Seat VALUES (12,2,100,'Gold');
	INSERT INTO Seat VALUES (13,2,100,'Gold');
	INSERT INTO Seat VALUES (14,2,100,'Gold');
	INSERT INTO Seat VALUES (15,2,100,'Gold');
	INSERT INTO Seat VALUES (16,2,100,'Diamond');
	INSERT INTO Seat VALUES (17,2,100,'Diamond');
	INSERT INTO Seat VALUES (18,2,100,'Diamond');

	INSERT INTO Seat VALUES (1,3,100,'Silver');
	INSERT INTO Seat VALUES (2,3,100,'Silver');
	INSERT INTO Seat VALUES (3,3,100,'Silver');
	INSERT INTO Seat VALUES (4,3,100,'Silver');
	INSERT INTO Seat VALUES (5,3,100,'Silver');
	INSERT INTO Seat VALUES (6,3,100,'Silver');
	INSERT INTO Seat VALUES (7,3,100,'Silver');
	INSERT INTO Seat VALUES (8,3,100,'Silver');
	INSERT INTO Seat VALUES (9,3,100,'Silver');
	INSERT INTO Seat VALUES (10,3,100,'Silver');
	INSERT INTO Seat VALUES (11,3,100,'Gold');
	INSERT INTO Seat VALUES (12,3,100,'Gold');
	INSERT INTO Seat VALUES (13,3,100,'Gold');
	INSERT INTO Seat VALUES (14,3,100,'Gold');
	INSERT INTO Seat VALUES (15,3,100,'Gold');
	INSERT INTO Seat VALUES (16,3,100,'Diamond');
	INSERT INTO Seat VALUES (17,3,100,'Diamond');
	INSERT INTO Seat VALUES (18,3,100,'Diamond');



	INSERT INTO Seat VALUES (1,1,101,'Silver');
	INSERT INTO Seat VALUES (2,1,101,'Silver');
	INSERT INTO Seat VALUES (3,1,101,'Silver');
	INSERT INTO Seat VALUES (4,1,101,'Silver');
	INSERT INTO Seat VALUES (5,1,101,'Silver');
	INSERT INTO Seat VALUES (6,1,101,'Silver');
	INSERT INTO Seat VALUES (7,1,101,'Silver');
	INSERT INTO Seat VALUES (8,1,101,'Silver');
	INSERT INTO Seat VALUES (9,1,101,'Silver');
	INSERT INTO Seat VALUES (10,1,101,'Silver');
	INSERT INTO Seat VALUES (11,1,101,'Gold');
	INSERT INTO Seat VALUES (12,1,101,'Gold');
	INSERT INTO Seat VALUES (13,1,101,'Gold');
	INSERT INTO Seat VALUES (14,1,101,'Gold');
	INSERT INTO Seat VALUES (15,1,101,'Gold');
	INSERT INTO Seat VALUES (16,1,101,'Diamond');
	INSERT INTO Seat VALUES (17,1,101,'Diamond');
	INSERT INTO Seat VALUES (18,1,101,'Diamond');


	INSERT INTO Seat VALUES (1,2,101,'Silver');
	INSERT INTO Seat VALUES (2,2,101,'Silver');
	INSERT INTO Seat VALUES (3,2,101,'Silver');
	INSERT INTO Seat VALUES (4,2,101,'Silver');
	INSERT INTO Seat VALUES (5,2,101,'Silver');
	INSERT INTO Seat VALUES (6,2,101,'Silver');
	INSERT INTO Seat VALUES (7,2,101,'Silver');
	INSERT INTO Seat VALUES (8,2,101,'Silver');
	INSERT INTO Seat VALUES (9,2,101,'Silver');
	INSERT INTO Seat VALUES (10,2,101,'Silver');
	INSERT INTO Seat VALUES (11,2,101,'Gold');
	INSERT INTO Seat VALUES (12,2,101,'Gold');
	INSERT INTO Seat VALUES (13,2,101,'Gold');
	INSERT INTO Seat VALUES (14,2,101,'Gold');
	INSERT INTO Seat VALUES (15,2,101,'Gold');
	INSERT INTO Seat VALUES (16,2,101,'Diamond');
	INSERT INTO Seat VALUES (17,2,101,'Diamond');
	INSERT INTO Seat VALUES (18,2,101,'Diamond');

	INSERT INTO Seat VALUES (1,3,101,'Silver');
	INSERT INTO Seat VALUES (2,3,101,'Silver');
	INSERT INTO Seat VALUES (3,3,101,'Silver');
	INSERT INTO Seat VALUES (4,3,101,'Silver');
	INSERT INTO Seat VALUES (5,3,101,'Silver');
	INSERT INTO Seat VALUES (6,3,101,'Silver');
	INSERT INTO Seat VALUES (7,3,101,'Silver');
	INSERT INTO Seat VALUES (8,3,101,'Silver');
	INSERT INTO Seat VALUES (9,3,101,'Silver');
	INSERT INTO Seat VALUES (10,3,101,'Silver');
	INSERT INTO Seat VALUES (11,3,101,'Gold');
	INSERT INTO Seat VALUES (12,3,101,'Gold');
	INSERT INTO Seat VALUES (13,3,101,'Gold');
	INSERT INTO Seat VALUES (14,3,101,'Gold');
	INSERT INTO Seat VALUES (15,3,101,'Gold');
	INSERT INTO Seat VALUES (16,3,101,'Diamond');
	INSERT INTO Seat VALUES (17,3,101,'Diamond');
	INSERT INTO Seat VALUES (18,3,101,'Diamond');



	INSERT INTO Seat VALUES (1,1,102,'Silver');
	INSERT INTO Seat VALUES (2,1,102,'Silver');
	INSERT INTO Seat VALUES (3,1,102,'Silver');
	INSERT INTO Seat VALUES (4,1,102,'Silver');
	INSERT INTO Seat VALUES (5,1,102,'Silver');
	INSERT INTO Seat VALUES (6,1,102,'Silver');
	INSERT INTO Seat VALUES (7,1,102,'Silver');
	INSERT INTO Seat VALUES (8,1,102,'Silver');
	INSERT INTO Seat VALUES (9,1,102,'Silver');
	INSERT INTO Seat VALUES (10,1,102,'Silver');
	INSERT INTO Seat VALUES (11,1,102,'Gold');
	INSERT INTO Seat VALUES (12,1,102,'Gold');
	INSERT INTO Seat VALUES (13,1,102,'Gold');
	INSERT INTO Seat VALUES (14,1,102,'Gold');
	INSERT INTO Seat VALUES (15,1,102,'Gold');
	INSERT INTO Seat VALUES (16,1,102,'Diamond');
	INSERT INTO Seat VALUES (17,1,102,'Diamond');
	INSERT INTO Seat VALUES (18,1,102,'Diamond');


	INSERT INTO Seat VALUES (1,2,102,'Silver');
	INSERT INTO Seat VALUES (2,2,102,'Silver');
	INSERT INTO Seat VALUES (3,2,102,'Silver');
	INSERT INTO Seat VALUES (4,2,102,'Silver');
	INSERT INTO Seat VALUES (5,2,102,'Silver');
	INSERT INTO Seat VALUES (6,2,102,'Silver');
	INSERT INTO Seat VALUES (7,2,102,'Silver');
	INSERT INTO Seat VALUES (8,2,102,'Silver');
	INSERT INTO Seat VALUES (9,2,102,'Silver');
	INSERT INTO Seat VALUES (10,2,102,'Silver');
	INSERT INTO Seat VALUES (11,2,102,'Gold');
	INSERT INTO Seat VALUES (12,2,102,'Gold');
	INSERT INTO Seat VALUES (13,2,102,'Gold');
	INSERT INTO Seat VALUES (14,2,102,'Gold');
	INSERT INTO Seat VALUES (15,2,102,'Gold');
	INSERT INTO Seat VALUES (16,2,102,'Diamond');
	INSERT INTO Seat VALUES (17,2,102,'Diamond');
	INSERT INTO Seat VALUES (18,2,102,'Diamond');

	INSERT INTO Seat VALUES (1,3,102,'Silver');
	INSERT INTO Seat VALUES (2,3,102,'Silver');
	INSERT INTO Seat VALUES (3,3,102,'Silver');
	INSERT INTO Seat VALUES (4,3,102,'Silver');
	INSERT INTO Seat VALUES (5,3,102,'Silver');
	INSERT INTO Seat VALUES (6,3,102,'Silver');
	INSERT INTO Seat VALUES (7,3,102,'Silver');
	INSERT INTO Seat VALUES (8,3,102,'Silver');
	INSERT INTO Seat VALUES (9,3,102,'Silver');
	INSERT INTO Seat VALUES (10,3,102,'Silver');
	INSERT INTO Seat VALUES (11,3,102,'Gold');
	INSERT INTO Seat VALUES (12,3,102,'Gold');
	INSERT INTO Seat VALUES (13,3,102,'Gold');
	INSERT INTO Seat VALUES (14,3,102,'Gold');
	INSERT INTO Seat VALUES (15,3,102,'Gold');
	INSERT INTO Seat VALUES (16,3,102,'Diamond');
	INSERT INTO Seat VALUES (17,3,102,'Diamond');
	INSERT INTO Seat VALUES (18,3,102,'Diamond');



	INSERT INTO Seat VALUES (1,1,103,'Silver');
	INSERT INTO Seat VALUES (2,1,103,'Silver');
	INSERT INTO Seat VALUES (3,1,103,'Silver');
	INSERT INTO Seat VALUES (4,1,103,'Silver');
	INSERT INTO Seat VALUES (5,1,103,'Silver');
	INSERT INTO Seat VALUES (6,1,103,'Silver');
	INSERT INTO Seat VALUES (7,1,103,'Silver');
	INSERT INTO Seat VALUES (8,1,103,'Silver');
	INSERT INTO Seat VALUES (9,1,103,'Silver');
	INSERT INTO Seat VALUES (10,1,103,'Silver');
	INSERT INTO Seat VALUES (11,1,103,'Gold');
	INSERT INTO Seat VALUES (12,1,103,'Gold');
	INSERT INTO Seat VALUES (13,1,103,'Gold');
	INSERT INTO Seat VALUES (14,1,103,'Gold');
	INSERT INTO Seat VALUES (15,1,103,'Gold');
	INSERT INTO Seat VALUES (16,1,103,'Diamond');
	INSERT INTO Seat VALUES (17,1,103,'Diamond');
	INSERT INTO Seat VALUES (18,1,103,'Diamond');


	INSERT INTO Seat VALUES (1,2,103,'Silver');
	INSERT INTO Seat VALUES (2,2,103,'Silver');
	INSERT INTO Seat VALUES (3,2,103,'Silver');
	INSERT INTO Seat VALUES (4,2,103,'Silver');
	INSERT INTO Seat VALUES (5,2,103,'Silver');
	INSERT INTO Seat VALUES (6,2,103,'Silver');
	INSERT INTO Seat VALUES (7,2,103,'Silver');
	INSERT INTO Seat VALUES (8,2,103,'Silver');
	INSERT INTO Seat VALUES (9,2,103,'Silver');
	INSERT INTO Seat VALUES (10,2,103,'Silver');
	INSERT INTO Seat VALUES (11,2,103,'Gold');
	INSERT INTO Seat VALUES (12,2,103,'Gold');
	INSERT INTO Seat VALUES (13,2,103,'Gold');
	INSERT INTO Seat VALUES (14,2,103,'Gold');
	INSERT INTO Seat VALUES (15,2,103,'Gold');
	INSERT INTO Seat VALUES (16,2,103,'Diamond');
	INSERT INTO Seat VALUES (17,2,103,'Diamond');
	INSERT INTO Seat VALUES (18,2,103,'Diamond');




	INSERT INTO Seat VALUES (1,1,104,'Silver');
	INSERT INTO Seat VALUES (2,1,104,'Silver');
	INSERT INTO Seat VALUES (3,1,104,'Silver');
	INSERT INTO Seat VALUES (4,1,104,'Silver');
	INSERT INTO Seat VALUES (5,1,104,'Silver');
	INSERT INTO Seat VALUES (6,1,104,'Silver');
	INSERT INTO Seat VALUES (7,1,104,'Silver');
	INSERT INTO Seat VALUES (8,1,104,'Silver');
	INSERT INTO Seat VALUES (9,1,104,'Silver');
	INSERT INTO Seat VALUES (10,1,104,'Silver');
	INSERT INTO Seat VALUES (11,1,104,'Gold');
	INSERT INTO Seat VALUES (12,1,104,'Gold');
	INSERT INTO Seat VALUES (13,1,104,'Gold');
	INSERT INTO Seat VALUES (14,1,104,'Gold');
	INSERT INTO Seat VALUES (15,1,104,'Gold');
	INSERT INTO Seat VALUES (16,1,104,'Diamond');
	INSERT INTO Seat VALUES (17,1,104,'Diamond');
	INSERT INTO Seat VALUES (18,1,104,'Diamond');


	INSERT INTO Seat VALUES (1,2,104,'Silver');
	INSERT INTO Seat VALUES (2,2,104,'Silver');
	INSERT INTO Seat VALUES (3,2,104,'Silver');
	INSERT INTO Seat VALUES (4,2,104,'Silver');
	INSERT INTO Seat VALUES (5,2,104,'Silver');
	INSERT INTO Seat VALUES (6,2,104,'Silver');
	INSERT INTO Seat VALUES (7,2,104,'Silver');
	INSERT INTO Seat VALUES (8,2,104,'Silver');
	INSERT INTO Seat VALUES (9,2,104,'Silver');
	INSERT INTO Seat VALUES (10,2,104,'Silver');
	INSERT INTO Seat VALUES (11,2,104,'Gold');
	INSERT INTO Seat VALUES (12,2,104,'Gold');
	INSERT INTO Seat VALUES (13,2,104,'Gold');
	INSERT INTO Seat VALUES (14,2,104,'Gold');
	INSERT INTO Seat VALUES (15,2,104,'Gold');
	INSERT INTO Seat VALUES (16,2,104,'Diamond');
	INSERT INTO Seat VALUES (17,2,104,'Diamond');
	INSERT INTO Seat VALUES (18,2,104,'Diamond');


	INSERT INTO Seat VALUES (1,1,105,'Silver');
	INSERT INTO Seat VALUES (2,1,105,'Silver');
	INSERT INTO Seat VALUES (3,1,105,'Silver');
	INSERT INTO Seat VALUES (4,1,105,'Silver');
	INSERT INTO Seat VALUES (5,1,105,'Silver');
	INSERT INTO Seat VALUES (6,1,105,'Silver');
	INSERT INTO Seat VALUES (7,1,105,'Silver');
	INSERT INTO Seat VALUES (8,1,105,'Silver');
	INSERT INTO Seat VALUES (9,1,105,'Silver');
	INSERT INTO Seat VALUES (10,1,105,'Silver');
	INSERT INTO Seat VALUES (11,1,105,'Gold');
	INSERT INTO Seat VALUES (12,1,105,'Gold');
	INSERT INTO Seat VALUES (13,1,105,'Gold');
	INSERT INTO Seat VALUES (14,1,105,'Gold');
	INSERT INTO Seat VALUES (15,1,105,'Gold');
	INSERT INTO Seat VALUES (16,1,105,'Diamond');
	INSERT INTO Seat VALUES (17,1,105,'Diamond');
	INSERT INTO Seat VALUES (18,1,105,'Diamond');


	INSERT INTO Seat VALUES (1,2,105,'Silver');
	INSERT INTO Seat VALUES (2,2,105,'Silver');
	INSERT INTO Seat VALUES (3,2,105,'Silver');
	INSERT INTO Seat VALUES (4,2,105,'Silver');
	INSERT INTO Seat VALUES (5,2,105,'Silver');
	INSERT INTO Seat VALUES (6,2,105,'Silver');
	INSERT INTO Seat VALUES (7,2,105,'Silver');
	INSERT INTO Seat VALUES (8,2,105,'Silver');
	INSERT INTO Seat VALUES (9,2,105,'Silver');
	INSERT INTO Seat VALUES (10,2,105,'Silver');
	INSERT INTO Seat VALUES (11,2,105,'Gold');
	INSERT INTO Seat VALUES (12,2,105,'Gold');
	INSERT INTO Seat VALUES (13,2,105,'Gold');
	INSERT INTO Seat VALUES (14,2,105,'Gold');
	INSERT INTO Seat VALUES (15,2,105,'Gold');
	INSERT INTO Seat VALUES (16,2,105,'Diamond');
	INSERT INTO Seat VALUES (17,2,105,'Diamond');
	INSERT INTO Seat VALUES (18,2,105,'Diamond');


	INSERT INTO Seat VALUES (1,1,106,'Silver');
	INSERT INTO Seat VALUES (2,1,106,'Silver');
	INSERT INTO Seat VALUES (3,1,106,'Silver');
	INSERT INTO Seat VALUES (4,1,106,'Silver');
	INSERT INTO Seat VALUES (5,1,106,'Silver');
	INSERT INTO Seat VALUES (6,1,106,'Silver');
	INSERT INTO Seat VALUES (7,1,106,'Silver');
	INSERT INTO Seat VALUES (8,1,106,'Silver');
	INSERT INTO Seat VALUES (9,1,106,'Silver');
	INSERT INTO Seat VALUES (10,1,106,'Silver');
	INSERT INTO Seat VALUES (11,1,106,'Gold');
	INSERT INTO Seat VALUES (12,1,106,'Gold');
	INSERT INTO Seat VALUES (13,1,106,'Gold');
	INSERT INTO Seat VALUES (14,1,106,'Gold');
	INSERT INTO Seat VALUES (15,1,106,'Gold');
	INSERT INTO Seat VALUES (16,1,106,'Diamond');
	INSERT INTO Seat VALUES (17,1,106,'Diamond');
	INSERT INTO Seat VALUES (18,1,106,'Diamond');


	INSERT INTO Seat VALUES (1,2,106,'Silver');
	INSERT INTO Seat VALUES (2,2,106,'Silver');
	INSERT INTO Seat VALUES (3,2,106,'Silver');
	INSERT INTO Seat VALUES (4,2,106,'Silver');
	INSERT INTO Seat VALUES (5,2,106,'Silver');
	INSERT INTO Seat VALUES (6,2,106,'Silver');
	INSERT INTO Seat VALUES (7,2,106,'Silver');
	INSERT INTO Seat VALUES (8,2,106,'Silver');
	INSERT INTO Seat VALUES (9,2,106,'Silver');
	INSERT INTO Seat VALUES (10,2,106,'Silver');
	INSERT INTO Seat VALUES (11,2,106,'Gold');
	INSERT INTO Seat VALUES (12,2,106,'Gold');
	INSERT INTO Seat VALUES (13,2,106,'Gold');
	INSERT INTO Seat VALUES (14,2,106,'Gold');
	INSERT INTO Seat VALUES (15,2,106,'Gold');
	INSERT INTO Seat VALUES (16,2,106,'Diamond');
	INSERT INTO Seat VALUES (17,2,106,'Diamond');
	INSERT INTO Seat VALUES (18,2,106,'Diamond');



	INSERT INTO Seat VALUES (1,1,107,'Silver');
	INSERT INTO Seat VALUES (2,1,107,'Silver');
	INSERT INTO Seat VALUES (3,1,107,'Silver');
	INSERT INTO Seat VALUES (4,1,107,'Silver');
	INSERT INTO Seat VALUES (5,1,107,'Silver');
	INSERT INTO Seat VALUES (6,1,107,'Silver');
	INSERT INTO Seat VALUES (7,1,107,'Silver');
	INSERT INTO Seat VALUES (8,1,107,'Silver');
	INSERT INTO Seat VALUES (9,1,107,'Silver');
	INSERT INTO Seat VALUES (10,1,107,'Silver');
	INSERT INTO Seat VALUES (11,1,107,'Gold');
	INSERT INTO Seat VALUES (12,1,107,'Gold');
	INSERT INTO Seat VALUES (13,1,107,'Gold');
	INSERT INTO Seat VALUES (14,1,107,'Gold');
	INSERT INTO Seat VALUES (15,1,107,'Gold');
	INSERT INTO Seat VALUES (16,1,107,'Diamond');
	INSERT INTO Seat VALUES (17,1,107,'Diamond');
	INSERT INTO Seat VALUES (18,1,107,'Diamond');


	INSERT INTO Seat VALUES (1,2,107,'Silver');
	INSERT INTO Seat VALUES (2,2,107,'Silver');
	INSERT INTO Seat VALUES (3,2,107,'Silver');
	INSERT INTO Seat VALUES (4,2,107,'Silver');
	INSERT INTO Seat VALUES (5,2,107,'Silver');
	INSERT INTO Seat VALUES (6,2,107,'Silver');
	INSERT INTO Seat VALUES (7,2,107,'Silver');
	INSERT INTO Seat VALUES (8,2,107,'Silver');
	INSERT INTO Seat VALUES (9,2,107,'Silver');
	INSERT INTO Seat VALUES (10,2,107,'Silver');
	INSERT INTO Seat VALUES (11,2,107,'Gold');
	INSERT INTO Seat VALUES (12,2,107,'Gold');
	INSERT INTO Seat VALUES (13,2,107,'Gold');
	INSERT INTO Seat VALUES (14,2,107,'Gold');
	INSERT INTO Seat VALUES (15,2,107,'Gold');
	INSERT INTO Seat VALUES (16,2,107,'Diamond');
	INSERT INTO Seat VALUES (17,2,107,'Diamond');
	INSERT INTO Seat VALUES (18,2,107,'Diamond');



	INSERT INTO Seat VALUES (1,1,108,'Silver');
	INSERT INTO Seat VALUES (2,1,108,'Silver');
	INSERT INTO Seat VALUES (3,1,108,'Silver');
	INSERT INTO Seat VALUES (4,1,108,'Silver');
	INSERT INTO Seat VALUES (5,1,108,'Silver');
	INSERT INTO Seat VALUES (6,1,108,'Silver');
	INSERT INTO Seat VALUES (7,1,108,'Silver');
	INSERT INTO Seat VALUES (8,1,108,'Silver');
	INSERT INTO Seat VALUES (9,1,108,'Silver');
	INSERT INTO Seat VALUES (10,1,108,'Silver');
	INSERT INTO Seat VALUES (11,1,108,'Gold');
	INSERT INTO Seat VALUES (12,1,108,'Gold');
	INSERT INTO Seat VALUES (13,1,108,'Gold');
	INSERT INTO Seat VALUES (14,1,108,'Gold');
	INSERT INTO Seat VALUES (15,1,108,'Gold');
	INSERT INTO Seat VALUES (16,1,108,'Diamond');
	INSERT INTO Seat VALUES (17,1,108,'Diamond');
	INSERT INTO Seat VALUES (18,1,108,'Diamond');


	INSERT INTO Seat VALUES (1,2,108,'Silver');
	INSERT INTO Seat VALUES (2,2,108,'Silver');
	INSERT INTO Seat VALUES (3,2,108,'Silver');
	INSERT INTO Seat VALUES (4,2,108,'Silver');
	INSERT INTO Seat VALUES (5,2,108,'Silver');
	INSERT INTO Seat VALUES (6,2,108,'Silver');
	INSERT INTO Seat VALUES (7,2,108,'Silver');
	INSERT INTO Seat VALUES (8,2,108,'Silver');
	INSERT INTO Seat VALUES (9,2,108,'Silver');
	INSERT INTO Seat VALUES (10,2,108,'Silver');
	INSERT INTO Seat VALUES (11,2,108,'Gold');
	INSERT INTO Seat VALUES (12,2,108,'Gold');
	INSERT INTO Seat VALUES (13,2,108,'Gold');
	INSERT INTO Seat VALUES (14,2,108,'Gold');
	INSERT INTO Seat VALUES (15,2,108,'Gold');
	INSERT INTO Seat VALUES (16,2,108,'Diamond');
	INSERT INTO Seat VALUES (17,2,108,'Diamond');
	INSERT INTO Seat VALUES (18,2,108,'Diamond');



	INSERT INTO Seat VALUES (1,1,109,'Silver');
	INSERT INTO Seat VALUES (2,1,109,'Silver');
	INSERT INTO Seat VALUES (3,1,109,'Silver');
	INSERT INTO Seat VALUES (4,1,109,'Silver');
	INSERT INTO Seat VALUES (5,1,109,'Silver');
	INSERT INTO Seat VALUES (6,1,109,'Silver');
	INSERT INTO Seat VALUES (7,1,109,'Silver');
	INSERT INTO Seat VALUES (8,1,109,'Silver');
	INSERT INTO Seat VALUES (9,1,109,'Silver');
	INSERT INTO Seat VALUES (10,1,109,'Silver');
	INSERT INTO Seat VALUES (11,1,109,'Gold');
	INSERT INTO Seat VALUES (12,1,109,'Gold');
	INSERT INTO Seat VALUES (13,1,109,'Gold');
	INSERT INTO Seat VALUES (14,1,109,'Gold');
	INSERT INTO Seat VALUES (15,1,109,'Gold');
	INSERT INTO Seat VALUES (16,1,109,'Diamond');
	INSERT INTO Seat VALUES (17,1,109,'Diamond');
	INSERT INTO Seat VALUES (18,1,109,'Diamond');


	INSERT INTO Seat VALUES (1,1,110,'Silver');
	INSERT INTO Seat VALUES (2,1,110,'Silver');
	INSERT INTO Seat VALUES (3,1,110,'Silver');
	INSERT INTO Seat VALUES (4,1,110,'Silver');
	INSERT INTO Seat VALUES (5,1,110,'Silver');
	INSERT INTO Seat VALUES (6,1,110,'Silver');
	INSERT INTO Seat VALUES (7,1,110,'Silver');
	INSERT INTO Seat VALUES (8,1,110,'Silver');
	INSERT INTO Seat VALUES (9,1,110,'Silver');
	INSERT INTO Seat VALUES (10,1,110,'Silver');
	INSERT INTO Seat VALUES (11,1,110,'Gold');
	INSERT INTO Seat VALUES (12,1,110,'Gold');
	INSERT INTO Seat VALUES (13,1,110,'Gold');
	INSERT INTO Seat VALUES (14,1,110,'Gold');
	INSERT INTO Seat VALUES (15,1,110,'Gold');
	INSERT INTO Seat VALUES (16,1,110,'Diamond');
	INSERT INTO Seat VALUES (17,1,110,'Diamond');
	INSERT INTO Seat VALUES (18,1,110,'Diamond');




	INSERT INTO Theatre VALUES(100,'Rajhans Cinemas',3,8800900009,'Mr.Ram Son','Navi Mumbai','Mumbai','Maharashtra',5);
	INSERT INTO Theatre VALUES(101,'Miraj Cinemas',3,8800900019,'Shapoor Mistry','Satellite Road','Ahmedabad','Gujarat',4);
	INSERT INTO Theatre VALUES(102,'PVR ICON Cinema',3,8800900209,'Ravi Jaipuria','Anna Nagar','Chennai','Tamilnadu',3);
	INSERT INTO Theatre VALUES(103,'Paradise Cinema',2,8800903009,'Ajay Bijli','Aluva','Kochi','Keral',3);
	INSERT INTO Theatre VALUES(104,'MovieMax Multiplex',2,8800940009,'Kalanithi Maran','Ballygunge','Kolkata','West Bengal',2);
	INSERT INTO Theatre VALUES(105,'Bharat Cineplex',2,8805900009,'Ravi Pillai','Palam Vihar','Gurugram','Hariyana',1);
	INSERT INTO Theatre VALUES(106,'Vilux Talkies',2,8860900009,'T. S. Kalyanaraman','Rajpura','Patiala','Punjab',2);
	INSERT INTO Theatre VALUES(107,'Ashirvad Cineplexx',2,8800903099,'Binny Bansal','Marathahalli','Bengaluru','Karnatak',2);
	INSERT INTO Theatre VALUES(108,'BVK Multiplex',2,8801900709,'Arvind Ghossse','MVP Colony','Vishakhapattanam','Andhra Pradesh',2);
	INSERT INTO Theatre VALUES(109,'SVF Cinemas',1,8820960009,'Rahul Ahuja','Amber','Jaipur','Rajashthan',3);
	INSERT INTO Theatre VALUES(110,'City Diamond Cinema',1,8886945679,'Avtar Saini','Shivaji Nagar','Bhopal','Madhya Pradesh',2);


	INSERT INTO "Show" VALUES (100,2000,'2024-05-01','09:00:00',1,'Dangal','2017-11-19');
	INSERT INTO "Show" VALUES (100,2001,'2024-05-02','09:00:00',1,'Dangal','2017-11-19');
	INSERT INTO "Show" VALUES (100,2002,'2024-05-03','09:00:00',1,'Dangal','2017-11-19');
	INSERT INTO "Show" VALUES (100,2003,'2024-06-01','06:00:00',2,'Pushpa: The Rise','2012-11-23');
	INSERT INTO "Show" VALUES (100,2004,'2023-12-11','14:25:00',2,'Uri:The Surgical Strike','2022-12-12');
	INSERT INTO "Show" VALUES (100,2005,'2022-09-25','19:05:00',3,'Lift','2024-01-22');
	INSERT INTO "Show" VALUES (101,2006,'2021-10-05','08:00:00',1,'Spaceman','2022-12-23');
	INSERT INTO "Show" VALUES (101,2007,'2024-09-06','14:15:00',3,'RRR','2018-12-31');
	INSERT INTO "Show" VALUES (101,2008,'2023-08-08','18:25:00',2,'The Conference','2023-04-19');
	INSERT INTO "Show" VALUES (101,2009,'2022-01-17','20:05:00',3,'Damcel','2024-03-08');
	INSERT INTO "Show" VALUES (102,2010,'2021-16-02','09:00:00',1,'Sanju','2023-06-15');
	INSERT INTO "Show" VALUES (102,2011,'2022-21-05','15:25:00',2,'Gold','2021-04-14');
	INSERT INTO "Show" VALUES (102,2012,'2023-25-10','12:25:00',1,'Chennai Express','2014-03-16');
	INSERT INTO "Show" VALUES (102,2013,'2024-05-19','21:05:00',3,'Main Hoon Na','2020-12-21');
	INSERT INTO "Show" VALUES (103,2014,'2024-12-26','09:00:00',1,'Bigil','2015-04-12');
	INSERT INTO "Show" VALUES (103,2015,'2023-11-24','20:00:00',2,'Happy New Year','2007-12-27');
	INSERT INTO "Show" VALUES (103,2016,'2020-04-20','15:25:00',2,'Operation Valentine','2022-12-25');
	INSERT INTO "Show" VALUES (103,2017,'2020-04-21','09:00:00',1,'Operation Valentine','2022-12-25');
	INSERT INTO "Show" VALUES (103,2018,'2020-04-22','09:00:00',1,'Operation Valentine','2022-12-25');
	INSERT INTO "Show" VALUES (104,2019,'2020-05-12','09:05:00',2,'Hanuman','2024-02-28');
	INSERT INTO "Show" VALUES (104,2020,'2021-07-14','13:50:00',1,'Sam Bahadur','2022-06-12');
	INSERT INTO "Show" VALUES (104,2021,'2022-09-26','20:50:00',1,'OMG 2','2022-11-04');
	INSERT INTO "Show" VALUES (105,2022,'2021-06-23','13:25:00',1,'Merry Christmas','2018-06-07');
	INSERT INTO "Show" VALUES (105,2023,'2022-07-26','08:25:00',2,'Hidden Strike','2021-04-11');
	INSERT INTO "Show" VALUES (105,2024,'2023-11-12','22:05:00',2,'Dunki','2012-06-15');
	INSERT INTO "Show" VALUES (106,2025,'2022-10-17','22:05:00',1,'Raja Hindustani','2016-03-21');
	INSERT INTO "Show" VALUES (106,2026,'2023-06-22','22:05:00',2,'Darr','2017-08-17');


	
	INSERT INTO Screen VALUES (1,100,10,5,3);
	INSERT INTO Screen VALUES (2,100,10,5,3);
	INSERT INTO Screen VALUES (3,100,10,5,3);
	INSERT INTO Screen VALUES (1,101,10,5,3);
	INSERT INTO Screen VALUES (2,101,10,5,3);
	INSERT INTO Screen VALUES (3,101,10,5,3);
	INSERT INTO Screen VALUES (1,102,10,5,3);
	INSERT INTO Screen VALUES (2,102,10,5,3);
	INSERT INTO Screen VALUES (3,102,10,5,3);
	INSERT INTO Screen VALUES (1,103,10,5,3);
	INSERT INTO Screen VALUES (2,103,10,5,3);
	INSERT INTO Screen VALUES (1,104,10,5,3);
	INSERT INTO Screen VALUES (2,104,10,5,3);
	INSERT INTO Screen VALUES (1,105,10,5,3);
	INSERT INTO Screen VALUES (2,105,10,5,3);
	INSERT INTO Screen VALUES (1,106,10,5,3);
	INSERT INTO Screen VALUES (2,106,10,5,3);
	INSERT INTO Screen VALUES (1,107,10,5,3);
	INSERT INTO Screen VALUES (2,107,10,5,3);
	INSERT INTO Screen VALUES (1,108,10,5,3);
	INSERT INTO Screen VALUES (2,108,10,5,3);
	INSERT INTO Screen VALUES (1,109,10,5,3);
	INSERT INTO Screen VALUES (1,110,10,5,3);



	INSERT INTO Reviews (User_Id, Movie_Name, Release_Date, Rating, "Comments") VALUES
	(1001, 'Dangal', '2017-11-19', 4, 'Great movie, loved the performances!'),
	(1002, 'Dangal', '2017-11-19', 5, 'One of the best sports dramas ever made.'),
	(1003, 'Dangal', '2017-11-19', 4, 'Inspiring story and powerful acting.'),
	(1004, 'Dangal', '2017-11-19', 5, 'A masterpiece! Must-watch for everyone.'),
	(1005, 'Uri: The Surgical Strike', '2022-12-12', 5, 'Intense and gripping.'),
	(1006, 'Uri: The Surgical Strike', '2022-12-12', 4, 'Patriotic and well-executed.'),
	(1007, 'Uri: The Surgical Strike', '2022-12-12', 5, 'Vicky Kaushal was phenomenal.'),
	(1008, 'Uri: The Surgical Strike', '2022-12-12', 4, 'The action sequences were top-notch.'),
	(1009, 'Bajrangi Bhaijaan', '2018-08-12', 4, 'Heartwarming story.'),
	(1010, 'Bajrangi Bhaijaan', '2018-08-12', 5, 'Salman Khan at his best.'),
	(1011, 'Bajrangi Bhaijaan', '2018-08-12', 4, 'Loved the music and emotions.'),
	(1012, 'Bajrangi Bhaijaan', '2018-08-12', 4, 'Touched my heart.'),
	(1013, 'Chennai Express', '2014-03-16', 3, 'Entertaining masala movie.'),
	(1014, 'Chennai Express', '2014-03-16', 3, 'Shah Rukh Khan never disappoints.'),
	(1015, 'Chennai Express', '2014-03-16', 4, 'Fun ride!'),
	(1016, 'Chennai Express', '2014-03-16', 3, 'Good comedy and action mix.'),
	(1017, 'LOC: Kargil', '2015-06-17', 4, 'Great portrayal of real events.'),
	(1018, 'LOC: Kargil', '2015-06-17', 4, 'A tribute to our brave soldiers.'),
	(1019, 'LOC: Kargil', '2015-06-17', 3, 'Lengthy but emotionally engaging.'),
	(1020, 'LOC: Kargil', '2015-06-17', 3, 'Could have been more focused.'),
	(1021, 'M.S.Dhoni: The Untold Story', '2004-07-10', 5, 'Sushant Singh Rajput was brilliant.'),
	(1022, 'M.S.Dhoni: The Untold Story', '2004-07-10', 5, 'Amazing journey of Dhoni.'),
	(1022, 'M.S.Dhoni: The Untold Story', '2004-07-10', 5, 'A tribute to our brave soldiers.'),
	(1022, 'M.S.Dhoni: The Untold Story', '2004-07-10', 5, 'Lengthy but emotionally engaging.'),
	(1022, 'M.S.Dhoni: The Untold Story', '2004-07-10', 5, 'Could have been more focused.'),
	(1022, 'M.S.Dhoni: The Untold Story', '2004-07-10', 5, 'A must-watch for cricket fans.'),
	(1023, 'M.S.Dhoni: The Untold Story', '2004-07-10', 4, 'Loved the cricket sequences.'),
	(1024, 'M.S.Dhoni: The Untold Story', '2004-07-10', 4, 'A must-watch for cricket fans.'),
	(1025, 'Sivaji The Boss', '2005-09-29', 4, 'Rajinikanth rocked as always.'),
	(1026, 'Sivaji The Boss', '2005-09-29', 3, 'Entertaining but too over-the-top.'),
	(1027, 'Sivaji The Boss', '2005-09-29', 4, 'Good mix of action and drama.'),
	(1028, 'Sivaji The Boss', '2005-09-29', 3, 'Could have been better paced.'),
	(1029, 'RRR', '2018-12-31', 5, 'SS Rajamouli at his best!'),
	(1030, 'RRR', '2018-12-31', 5, 'Mind-blowing visuals and action.'),
	(1031, 'RRR', '2018-12-31', 4, 'NTR and Ram Charan were phenomenal.'),
	(1032, 'RRR', '2018-12-31', 4, 'Epic historical drama.'),
	(1033, 'Ghajini', '2023-11-23', 4, 'Aamir Khan nailed it.'),
	(1034, 'Ghajini', '2023-11-23', 3, 'Intense but emotionally draining.'),
	(1034, 'Ghajini', '2023-11-23', 3, 'Epic historical drama.'),
	(1034, 'Ghajini', '2023-11-23', 3, 'Mind-blowing visuals and action.'),
	(1034, 'Ghajini', '2023-11-23', 3, 'Good mix of action and drama.'),
	(1034, 'Ghajini', '2023-11-23', 3, 'Edge-of-the-seat thriller.'),
	(1034, 'Ghajini', '2023-11-23', 3, 'Power-Packed performance,.'),
	(1035, 'Ghajini', '2023-11-23', 4, 'Edge-of-the-seat thriller.'),
	(1036, 'Ghajini', '2023-11-23', 3, 'Interesting concept but dragged in parts.'),
	(1037, 'KGF', '2020-12-23', 5, 'Yash was outstanding!'),
	(1038, 'KGF', '2020-12-23', 5, 'Best Indian action movie in recent times.'),
	(1039, 'KGF', '2020-12-23', 4, 'Power-packed performances.'),
	(1040, 'KGF', '2020-12-23', 4, 'Great visuals and background score.'),
	(1041, 'Vikram', '2024-03-18', 5, 'Kamal Haasan was brilliant as always.'),
	(1042, 'Vikram', '2024-03-18', 4, 'Engaging thriller.'),
	(1043, 'Vikram', '2024-03-18', 4, 'Loved the twists and turns.'),
	(1044, 'Vikram', '2024-03-18', 4, 'Kept me guessing till the end.'),
	(1045, 'Bahubali 2: The Conclusion', '2022-12-04', 5, 'Epic conclusion to the saga!'),
	(1046, 'Bahubali 2: The Conclusion', '2022-12-04', 5, 'Visual extravaganza.'),
	(1047, 'Bahubali 2: The Conclusion', '2022-12-04', 4, 'Spectacular climax.'),
	(1048, 'Bahubali 2: The Conclusion', '2022-12-04', 4, 'Epic storytelling.'),
	(1049, 'Sanju', '2023-06-15', 4, 'Ranbir Kapoor was phenomenal as Sanjay Dutt.'),
	(1050, 'Sanju', '2023-06-15', 5, 'Emotionally gripping and well-made biopic.');



	insert into "Language" values ("Hindi","Animal",'2023-12-01');
	insert into "Language" values ("Gujarati","Animal",'2023-12-01');
	insert into "Language" values ("Telugu","Animal",'2023-12-01');
	insert into "Language" values ("Tamil","Animal",'2023-12-01');
	insert into "Language" values ("English","Animal",'2023-12-01');

	insert into "Language" values ("Hindi","Dunki",'2023-12-21');
	insert into "Language" values ("Gujarati","Dunki",'2023-12-21');
	insert into "Language" values ("Telugu","Dunki",'2023-12-21');
	insert into "Language" values ("Tamil","Dunki",'2023-12-21');
	insert into "Language" values ("English","Dunki",'2023-12-21');

	insert into "Language" values ("Hindi","Damcel",'2024-03-08');
	insert into "Language" values ("Gujarati","Damcel",'2024-03-08');
	insert into "Language" values ("Telugu","Damcel",'2024-03-08');
	insert into "Language" values ("Tamil","Damcel",'2024-03-08');
	insert into "Language" values ("English","Damcel",'2024-03-08');

	insert into "Language" values ("English","Hidden Strike","2021-04-11");
	insert into "Language" values ("English","Love Again","2020:05:16");
	insert into "Language" values ("English","Mission Raniganj","2023:08:19");
	insert into "Language" values ("English","Lift","2024:01:22");

	insert into "Language" values ("Hindi","Hurry Om Hurry","2020:09:11");
	insert into "Language" values ("Hindi","Hanuman","2024:02:28");
	insert into "Language" values ("Hindi","Raja Hindustani","2016:03:21");
	insert into "Language" values ("Hindi","Sanju","2023:06:15");
	insert into "Language" values ("Hindi","Main Hoon Na","2020:12:21");



	INSERT INTO Booking VALUES (100,1,7,101,2000,'ravi_upi','t1_upi');
	INSERT INTO Booking VALUES (100,1,7,101,2001,'ravi_upi','t1_upi');
	INSERT INTO Booking VALUES (100,1,7,101,2002,'ravi_upi','t1_upi');

	INSERT INTO Booking VALUES (101,1,8,101,2000,'priya_upi','t1_upi');
	INSERT INTO Booking VALUES (101,1,8,101,2001,'priya_upi','t1_upi');
	INSERT INTO Booking VALUES (101,1,8,101,2002,'priya_upi','t1_upi');

	INSERT INTO Booking VALUES (102,1,9,101,2000,'amit_upi','t1_upi');
	INSERT INTO Booking VALUES (102,1,9,101,2001,'amit_upi','t1_upi');
	INSERT INTO Booking VALUES (102,1,9,101,2002,'amit_upi','t1_upi');

	INSERT INTO Booking VALUES (103,1,10,101,2000,'ananya_upi','t1_upi');
	INSERT INTO Booking VALUES (103,1,10,101,2001,'ananya_upi','t1_upi');
	INSERT INTO Booking VALUES (103,1,10,101,2002,'ananya_upi','t1_upi');


	INSERT INTO Booking VALUES (103,1,10,101,2003,'ritu_upi','t1_upi');
	INSERT INTO Booking VALUES (104,2,10,101,2003,'manu_upi','t1_upi');
	INSERT INTO Booking VALUES (105,3,10,101,2003,'chanu_upi','t1_upi');
	INSERT INTO Booking VALUES (106,4,10,101,2003,'runu_upi','t1_upi');
	INSERT INTO Booking VALUES (107,5,10,101,2003,'pihu_upi','t1_upi');
	INSERT INTO Booking VALUES (108,6,10,101,2003,'mukta_upi','t1_upi');
	INSERT INTO Booking VALUES (109,7,10,101,2003,'chaya_upi','t1_upi');
	INSERT INTO Booking VALUES (110,8,10,101,2003,'vetan_upi','t1_upi');
	INSERT INTO Booking VALUES (111,9,10,101,2003,'mana_upi','t1_upi');
	INSERT INTO Booking VALUES (112,10,10,101,2003,'zeel_upi','t1_upi');
	INSERT INTO Booking VALUES (113,11,10,101,2003,'jay_upi','t1_upi');
	INSERT INTO Booking VALUES (114,12,10,101,2003,'nitin_upi','t1_upi');
	INSERT INTO Booking VALUES (115,13,10,101,2003,'sumit_upi','t1_upi');
	INSERT INTO Booking VALUES (116,14,10,103,2003,'kavit_upi','t3_upi');
	INSERT INTO Booking VALUES (117,15,10,103,2003,'kavit_upi','t3_upi');
	INSERT INTO Booking VALUES (118,16,10,103,2003,'kavit_upi','t3_upi');
	INSERT INTO Booking VALUES (119,17,10,101,2003,'krisha_upi','t1_upi');
	INSERT INTO Booking VALUES (120,18,10,101,2003,'jal_upi','t1_upi');


	INSERT INTO Booking VALUES (103,1,10,102,2004,'ritu_upi','t2_upi');
	INSERT INTO Booking VALUES (104,2,10,102,2003,'manu_upi','t2_upi');
	INSERT INTO Booking VALUES (105,3,10,102,2003,'chanu_upi','t2_upi');
	INSERT INTO Booking VALUES (106,4,10,102,2003,'runu_upi','t2_upi');
	INSERT INTO Booking VALUES (107,5,10,102,2003,'pihu_upi','t2_upi');
	INSERT INTO Booking VALUES (108,6,10,102,2003,'mukta_upi','t2_upi');
	INSERT INTO Booking VALUES (109,7,10,102,2003,'chaya_upi','t2_upi');
	INSERT INTO Booking VALUES (110,8,10,102,2003,'vetan_upi','t2_upi');
	INSERT INTO Booking VALUES (111,9,10,102,2003,'mana_upi','t2_upi');
	INSERT INTO Booking VALUES (112,10,10,102,2003,'zeel_upi','t2_upi');
	INSERT INTO Booking VALUES (113,11,10,102,2003,'jay_upi','t2_upi');
	INSERT INTO Booking VALUES (114,12,10,102,2003,'nitin_upi','t2_upi');
	INSERT INTO Booking VALUES (115,13,10,102,2003,'sumit_upi','t2_upi');
	INSERT INTO Booking VALUES (116,14,10,102,2003,'kavit_upi','t2_upi');
	INSERT INTO Booking VALUES (117,15,10,102,2003,'ramya_upi','t2_upi');
	INSERT INTO Booking VALUES (118,16,10,102,2003,'krish_upi','t2_upi');
	INSERT INTO Booking VALUES (119,17,10,102,2003,'krisha_upi','t2_upi');
	INSERT INTO Booking VALUES (120,18,10,102,2003,'jal_upi','t2_upi');
