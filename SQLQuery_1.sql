-- create a database

create DATABASE TRUYUM7;

--create a table for menu

create table menu
(
    ID int PRIMARY KEY ,
    Name  varchar(max)  NOT  NULL,
    Price varchar(max)  NOT NULL ,
    Active varchar(max) NOT NULL ,
    Date_of_Launch date NOT NULL ,
    Category varchar(max) NOT NULL,
    Free_Delivery varchar(max) NOT NULL,
    Action nvarchar(max) NOT NULL,
);


-- to view the table-menu
SELECT * FROM menu;

-- to insert values into the table-menu

INSERT INTO menu VALUES('1','Sandwich','Rs. 99.00','Yes','2017-03-15','Main Course','Yes','Edit');
INSERT INTO menu VALUES('2','Burger','Rs. 129.00','Yes','2017-12-23','Main Course','No','Edit');
INSERT INTO menu VALUES('3','Pizza','Rs. 149.00','Yes','2017-08-21','Main Course','No','Edit');
INSERT INTO menu VALUES('4','French Fries','Rs. 57.00','No','2017-07-02','Starters','Yes','Edit');
INSERT INTO menu VALUES('5','Chocolate Brownie','Rs. 32.00','Yes','2017-11-02','Dessert','Yes','Edit');

--create a table to accept customer details

create table customer
(
    cust_id int PRIMARY key NOT NULL,
    cust_name varchar(max) NOT NULL,
    cust_no varchar(max) NOT NULL, --customer mobile number
);

-- to view table-customer
SELECT * FROM customer

--to insert values into table-customer
INSERT INTO customer VALUES('1','k','1234');
INSERT INTO customer VALUES('2','r','1234');
INSERT INTO customer VALUES('3','n','1234');

--to view table-menu based on our requirements

select * from menu WHERE Active='Yes' AND Date_of_Launch>='2017-03-15'

-- to update table-menu based on ID
UPDATE menu 
SET Name='Momos', Date_of_Launch='2017-10-02' WHERE ID='4';

-- to create a table-cart 
create table cart 
(
    pid int FOREIGN KEY REFERENCES menu(id), -- product-id
    cid int FOREIGN KEY REFERENCES customer(cust_id), -- customer-id

);

-- to view the table cart
select * from cart

-- to insert values in the table-cart
INSERT INTO cart VALUES('2','1');
INSERT INTO cart VALUES('5','3');

-- to view the entire cart
select Name , Price , Free_Delivery , cust_name , cust_no FROM menu as A inner join cart as B on A.ID = B.pid inner join customer as C on C.cust_id = B.cid;

--to view the cart of a particular customer
select Name , Price , Free_Delivery , cust_name , cust_no FROM menu as A inner join cart as B on A.ID = B.pid inner join customer as C on C.cust_id = B.cid WHERE cid='1';
