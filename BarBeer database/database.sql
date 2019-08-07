
CREATE DATABASE BarBeer;
USE BarBeer;

/*Table structure for 'bar' table */
-- drop table bar

CREATE TABLE bar (
    Bar_Name varchar(200),
    Open_Time time, 
    Close_Time time, 
    License varchar(7),
    City varchar(200),
    State varchar(2),
    Phone varchar(30),
    Address varchar(200)
);
/*Table structure for 'beer' table */

-- drop table beer
CREATE TABLE beer (
	Beer_Name varchar(200), 
    Manuf varchar(200)
);

/*Table structure for 'drinker' table */
-- drop table drinker
CREATE TABLE drinker (
	Drinker_Name varchar(200), 
    City varchar(200), 
    Phone varchar(200), 
    Address varchar(200),
    State varchar(2)
);

/*Table structure for 'frequents' table */

-- drop table frequents
CREATE TABLE frequents (
	Drinker_Name varchar(200), 
    Bar_Name varchar(200)
);

/*Table structure for 'likes' table */

-- drop table likes
CREATE TABLE likes (
	Drinker_Name varchar(200), 
    Beer_Name varchar(200)
);

/*Table structure for 'sells' table */
/*
alter table sells
add column price decimal(5,2)

select * from sells

drop table sells
*/

CREATE TABLE sells (
	Bar_Name varchar(200), 
    Beer_Name varchar(200),
    Price decimal(5, 2)
);

/*Table structure for 'transactions' table */


CREATE TABLE transactions (
	Transaction_id int, 
    Drinker_Name varchar(200),
    Bar_Name varchar(200),
    Payment_Time datetime, 
    Total_Amount decimal(10,2), 
    Tax decimal(5,2), 
    Tip decimal(10,2)
); 


-- select * from bar

-- select * from sells;



-- query that returns rows where payment time is out of range of opening and closing times
select * 
 from transactions T
		inner join bar B
		 on  B.Bar_Name = T.Bar_Name
where time(T.Payment_Time) < B.Open_Time or time(T.Payment_Time) > B.Close_Time;



-- query that returns rows where drinker frequents bar in a different state
select * 
 from frequents F
		inner join bar B
		 on  B.Bar_Name = F.Bar_Name
		inner join drinker D
         on D.Drinker_Name = F.Drinker_Name
where D.State != B.State;



-- query that makes sure that beer prices are more expensive or less expensive in ALL bars, no exceptions 
-- (should return zero rows)

select * 
 from sells S1
		inner join sells S2
		 on  S1.Beer_Name = S2.Beer_Name
         and S1.Bar_Name != S2.Bar_Name
         and S1.Price <= S2.Price
		inner join sells S3
         on S3.Beer_Name = S1.Beer_Name
          and S3.Bar_Name != S1.Bar_Name
          and S3. Bar_Name != S2.Bar_Name
          and S3.Price < S1.Price
;




-- 


         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
 
