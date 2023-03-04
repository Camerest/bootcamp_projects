https://replit.com/@annoptechajongc/SQLHomeworkbatch6#main.sql

CREATE table orders(
  order_id INT not null PRIMARY KEY,
  orderDate DATE,
  memberNo INT,
  branchNo INT,
  paymentID INT,
  menuID INT,
  menuname character,
  price REAL,
  FOREIGN KEY (memberNo) REFERENCES members(staff), --Link Table
  FOREIGN KEY (branchNo) REFERENCES branch(branchNo),
  FOREIGN KEY (paymentID) REFERENCES payment(paymentID),
  FOREIGN KEY (menuID) REFERENCES menu(menuID)
  );

INSERT INTO orders values
 (1 ,'2022-11-02', 011253, 101 , 1 ,1 ,'Pad Ka Pao Thai Beef' ,70),
 (2 ,'2022-11-02', 011024, 102 , 3 ,5 ,'Leng Sab' ,120),
 (3 ,'2022-11-02', 025153, 102 , 2 ,3 ,'Craft Beer' ,100),
 (4 ,'2022-11-02', 013653, 103 , 1 ,7 ,'Pad Ka Pao AUS Beef' ,100),
 (5 ,'2022-11-03', 025253, 101 , 1 ,4 ,'Larb' ,70),
 (6 ,'2022-11-03', 016024, 102 , 1 ,2 ,'Papaya Salad' ,60),
 (7 ,'2022-11-03', 011253, 103 , 2 ,8 ,'Sticky Rice' ,20),
 (8 ,'2022-11-03', 013433, 103 , 3 ,2 ,'Papaya Salad' ,60),
 (9 ,'2022-11-06', 011113, 101 , 1 ,6 ,'Soi Ju' ,170),
 (10,'2022-11-06', 019824, 102 , 1 ,5 ,'Leng Sab' ,120),
 (11,'2022-11-06', 020953, 102 , 2 ,9 ,'Chicken Gril' ,70),
 (12,'2022-11-06', 011253, 103 , 3 ,5 ,'Leng Sab' ,120),
 (13,'2022-11-10', 020953, 101 , 2 ,10 ,'Tom Sap' ,100) 
;

--(DiM Table 2 )
create table members(
  staff int not null primary key ,
  FirstName    character,
  LastName     character,
  NumberPhone  int,
  StartMember  date,
  MemberPoint  real
);

INSERT INTO members values 
  (011253,'Apichat' ,'DangDong'  ,0912958121, '2022-01-04',  1300),
  (011024,'Karnjana','Naja'      ,0837183924, '2022-05-20',  500),
  (025153,'Prayut'  ,'Ochaya'    ,0928571984, '2022-06-25',  1200),
  (013653,'Ratana'  ,'Duangpen'  ,0828591837, '2022-08-16',  700),
  (025253,'Pongsub' ,'Tangtong'  ,0827165893, '2022-09-26',  250),
  (016024,'Watsapol','Bobo'      ,0873895011, '2022-10-21',  800),
  (013433,'Prapa'   ,'Pornpen'   ,0917295193, '2022-11-09',  550 ),
  (019824,'Yenjai'  ,'Hothead'   ,0917492716, '2022-12-01',  430 ),
  (020953,'Yenneck' ,'Mentol'    ,0981736192, '2022-12-25',  280)
;  

--Diim Table 3
create table branch(
branchNo int  not  null  primary key,
city      character,
country   character  
);

insert into branch values
  (101  ,'London'     ,'England'),
  (102  ,'Reo'        ,'Brazil'),
  (103  ,'California' ,'United State')
;

--Diim, Table 4
create table payment (
  paymentID int not null primary key,
  type      character
);

insert into payment values
  (1,'Cash'),
  (2,'Transfer Slip'),
  (3,'Credit Card')
;

--sqlite command
.mode markdown
.header on

--Analyze Data
--Query 1 Total Sale per Day
  select 
  orderDate ,  
  sum(price) as amt_Pday
  from orders 
  Group by orderDate
  order by amt_Pday desc
;
--Query 2 Top Sale each Branch
With sub2 As   
  (select 
    *
  from orders as ord
  join branch
  on ord.branchNo = branch.branchNo)

  select 
    country,
      sum(price) as total_amt
  from sub2
  Group by country
  order by sum(price) DESC
;
 
--Query 3 Show Best Seller Top 5
  select
  menuID,
  menuname,
    count (*) as n_menu
  from orders
  Group by menuname
  order by n_menu DESC Limit 5;
--Query 4 Top Spender
With sub3 as
  (select
    *
  from orders as ord
  join members
  on ord.memberNo = members.staff)
  select
  FirstName,
  LastName,
  Sum(price) as Spender
  from sub3
  Group by FirstName
  order by Spender DESC Limit 5
;
--Query 5 Top Payment Type
With sub as
  (select
    *
  from orders as ord
  join payment
  on ord.paymentID = payment.paymentID)

  select
    paymentID,
    type as Payment_Type
  from sub
  group by paymentID
  order by Payment_Type desc;  
