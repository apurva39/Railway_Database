create database railway_tickets;
use railway_tickets;
    -- USER TABLE 

create table user(
user_id int not null,
name varchar(40),

gender varchar(2) check(gender in('M','f')),
age int,
phone_no int,
state varchar(30),
city varchar(30),
pin int
);


-- PASSANGERS TABLE

create table passanger(
p_id int not null,
user_id int not null,
ticket_id int not null,
name varchar(40),
age int,
gender varchar(2) check(gender in('M','f')),
book_date date,
primary key(p_id)
);

   -- STATION TABLE
   
   create table station(
station_no int not null,

station_name varchar(40) not null,
hault int,
arrival time,
primary key(station_no)
);

    --  TRAIN TABLE
    
    create table train(
train_no int not null,
train_name varchar(40),
arrival time,
departure time,
availability int,
Date date,

primary key(train_no)
);

   -- TRAIN STATS
   
  create table train_stats(
train_id int not null,
ac_seat int,
non_ac_seat int,
fare int
);

   -- TICKETS TABLE
   
      create table tickets(
ticket_no int not null,
user_id int not null,
status varchar(2),
Ac_nonAc varchar(2),
fare int,
train_no int not null
);

alter table tickets add constraint ticket_no primary key(ticket_no);


-- CANCEL TABLE

   create table cancel(
user_id int,
p_id int,
ticket_id int
);

    -- BOOKS TABLE
    
      create table book(
ticket_id int,
p_id int 
);

  -- STOP TABLE

  create table stop_at(
train_no int not null,
station_no int not null

);

  -- START TABLE
  
    create table start_at(
train_no int not null,
station_no int not null
);

  -- REACHES TABLE
  
   create table reach_at(
train_no int not null,
station_no int not null,
arr_time time
);


alter table user add constraint user_id primary key(user_id);

alter table passanger add constraint p3 foreign key(ticket_id) references tickets(ticket_no); 
alter table passanger add constraint p1 foreign key(user_id) references user(user_id); 
alter table tickets add constraint ti1 foreign key(user_id) references user(user_id);
alter table tickets add constraint ti2 foreign key(train_no) references train(train_no);

alter table train_stats add constraint train_id foreign key(train_id) references train(train_no) on update cascade on delete cascade;

alter table stop_at add constraint train_no foreign key(train_no) references train(train_no) on update cascade on delete cascade;

alter table stop_at add constraint s1 foreign key(station_no) references station(station_no) on update cascade on delete cascade;


alter table start_at add constraint t2 foreign key(train_no) references train(train_no) on update cascade on delete cascade;

alter table start_at add constraint s2 foreign key(station_no) references station(station_no) on update cascade on delete cascade;

alter table reach_at add constraint t3 foreign key(train_no) references train(train_no) on update cascade on delete cascade;

alter table reach_at add constraint t2 foreign key(station_no) references station(station_no) on update cascade on delete cascade;
  
  
  
       -- ADDING CONSTARINTS TO TABLE
       
 


alter table user add constraint check(user_id>0);
alter table passanger add constraint check(p_id>0);
alter table passanger add constraint check(ticket_id>0);

alter table train add constraint check(train_no>0);
alter table user add constraint check(age>0);
alter table station add constraint check(station_no>0);
alter table tickets add constraint check(ticket_no>0);
alter table passanger add constraint check(age>0);
alter table user add CONSTRAINT check(phone_no like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]');



      -- INSERTIING VALUES TO TABLES
      
   
-- alter table user add constraint phone_no1 check(phone_no>0);


insert into user  values(1,'Apurva','m',19,834077655,'jharkhand','dumka',814141); 
select * from train;
insert into Train values (10002,'Shatabdi','21:30:00','10:00:00',3, '2022-10-04');
insert into Train values (10003,'Durunto exp','22:30:00','11:00:00',7, '2022-09-13');
insert into Train values (10004,'Ranchi exp','11:30:00','19:00:00',10, '2022-7-04');
insert into Train values (10005,'Ranchi exp','13:39:00','10:00:00',11, '2022-11-04');
insert into Train values (10006,'Duronto Express','07:22:00','10:00:00',20, '2022-11-04'),
                         (10007,'Shatabdi Express','23:30:00','17:00:00',34, '2022-10-14'),
                         (10008,'Jan Shatabdi','13:39:00','10:00:00',65, '2022-10-03'),
                         (10009,'Humsafar Express','13:39:00','12:00:00',21, '2022-11-20'),
                         (10010,'Kavi Guru Express','17:39:00','11:00:00',11, '2022-11-24'),
                         (10011,'Tejas Express','19:39:00','15:00:00',34, '2022-11-8'),
                         (10012,'Suvidha Express','15:39:00','18:00:00',17, '2022-11-7'),
                         (10013,'Intercity Express','18:39:00','19:00:00',51, '2022-11-04');
                          

select * from train;


insert into user values(1,'Apurva','m',19,'jharkhand','dumka',814141,'8340776554');
insert into user values(2,'Anand','m',14,'jharkhand','dumka',814141,'9431312834');
insert into user values(20,'sonal','m',19,'jharkhand','deoghar',814141,'8340434343'),
(16,'mrinal','m',19,'jharkhand','deoghar',810141,'8000434343'),
(17,'surbhi','f',18,'bihar','gya',814101,'9940434343'),
(18,'aman','m',20,'bihar','gya',814001,'9840434343'),
(19,'ravi','m',19,'chandigarh','mohali',234141,'8020434343'),
(3,'Chahat','f',20,'himachal','hamirpur',814100,'8340776551');

insert into user values(5,'komal','f',19,'jharkhand','deoghar',814141,'8340434343');

insert into user values(4,'monal','m',20,'jharkhand','dumka',814101,'8000000004');

insert into user values(7,'sonal','m',21,'jharkhand','deoghar',814108,'83440779054');
insert into user values(10,'ranjan','m',19,'bihar','araria',814141,'9040776554');

insert into user values(12,'ranju','f',19,'jharkhand','dumka',814141,'89409776554');

insert into user values(13,'Apurva1','m',19,'jharkhand','dumka',814101,'8340776554');

insert into user values(15,'Apurva','m',19,'jharkhand','dumka',813141,'8340776554');
select * from user order by user_id;


insert into station values (1,'Howrah',12,'11:30:00');
insert into station values (2,'KR Puram',10,'21:30:00'),
(3,'Panaji',10,'21:30:00'),
(4,'Mysore',111,'13:30:00'),
(5,'Shivaji_terminal',30,'21:30:00');
insert into station values(6,'ranchi',3,'20:10:00'),
                          (7,'goa',12,'23:10:00'),
                          (8,'dumka',3,'22:10:00'),
                          (9,'chandigarh',4,'20:10:00'),
                          (10,'ambala',3,'20:10:00');

select* from station order by station_name;

SET GLOBAL FOREIGN_KEY_CHECKS=0;
insert into stop_at values(10003,2),
(10005,9),
(10002,3),
(10002,6),
(10004,8),
(10002,7),
(10005,2);
insert into stop_at values
                          (10008,03),
                          (10009,04),
                          (10010,12),
                          (10011,6),
                          (10012,13),
                          (10013,14);
                          
select distinct(station_no),train_no from stop_at;


insert into start_at VALUES(10002,7),(10005,3);
insert into start_at VALUES(10002,2),(10005,4);
insert into start_at VALUES(10002,6),(10003,7);
select * from start_at;

insert into train_stats values (10002,50,60,2500);
insert into train_stats values (10004,52,54,1500),(10005,15,50,1000),(10003,40,55,500);
insert into train_stats values (10006,32,34,1700),
                               (10007,52,54,1800),
                               (10008,43,84,1900),
                               (10009,62,74,1600),
                               (10010,52,59,1700),
                               (10011,55,54,1500);

select * from train_stats;

insert into reach_at VALUES(10002,3,'4:10:00');
insert into reach_at VALUES(10003,4,'14:00:00');
insert into reach_at VALUES(10002,5,'13:10:00');
insert into reach_at VALUES(10003,7,'7:00:00');
insert into reach_at VALUES(10005,7,'23:10:00');
insert into reach_at VALUES(10004,5,'4:10:00');
insert into reach_at VALUES(10003,9,'4:10:00');
insert into reach_at VALUES(10006,2,'6:10:00'),
                           (10007,1,'2:10:00'),
                           (10008,8,'8:10:00'),
                           (10009,10,'9:10:00'),
                           (10010,10,'12:10:00'),
                           (10011,11,'14:10:00'),
                           (10012,12,'15:10:00');

 select * from reach_at;
insert into tickets values(100,1,'C','AC',1800,10001);
insert into tickets values(102,2,'C','AC',1900,10002),
                           (103,1,'C','SL',1500,10001),
                           (104,4,'C','SL',1700,10005),
                           (105,5,'C','SL',1800,10006),
                           (106,6,'C','AC',1800,10007),
                           (107,7,'NC','AC',1800,10010),
                           (108,9,'C','AC',1800,10012),
                           (109,12,'NC','AC',1800,10011),
                           (110,11,'C','AC',1800,10008),
                           (111,4,'C','AC',1800,10009);
                           
                           select * from tickets;
 
insert into passanger values(100001,1,101,'apurva',19,'m','2022-10-04');
insert into passanger values(100002,3,104,'anand',18,'m','2022-11-14'),
                             (100003,1,101,'chiku',19,'f','2022-10-04'),
                             (100004,4,105,'sippy',19,'m','2022-11-24'),
                             (100005,5,106,'nick',23,'m','2022-06-04'),
                             (100006,7,108,'jack',43,'m','2022-11-12');
                             
                             select * from passanger;

insert into book values(101,100001),(102,100002),(103,100003),(104,100004),(105,100005),(106,100006);
select * from book;

insert into cancel values(1,100001,101),(2,100002,102),(3,100003,103),(1,100004,104);
select * from cancel;
select * from book;
select * from cancel;
select * from passanger;
select * from reach_at;
select * from start_at;
select * from station;


select * from train;
select * from train_stats;
select * from user;


