
create table person 
(login varchar(20) primary key, 
Password varchar(20), 
id varchar(20), 
name varchar(20), 
address varchar(30), 
phno numeric(10,0), 
type varchar(20) ); 

create table leavetype 
(ltid varchar(20) primary key, 
ltname varchar(30), 
typecount numeric(3,0)); 

create table contains 
(login varchar(20) references person(login), 
ltid varchar(20) references leavetype(ltid)); 

create table authority 
(aid varchar(20) primary key,
aname varchar(20), 
aaddress varchar(30), 
aphno numeric(10,0)); 

create table leave 
(leaveid varchar(20) primary key, 
Reason varchar(50), 
count numeric(3,0), 
apprstatus varchar(20), 
fromdate date, 
todate date, 
aid varchar(20) references authority(aid) ); 

create table apply 
(login varchar(20) references person(login), 
ltid varchar(20) references leavetype(ltid), 
leaveid varchar(20) references leave(leaveid)); 

create table specialrequest 
(exid varchar(20) primary key, 
ecount numeric(3,0)); 

create table extends 
(leaveid varchar(20) references leave(leaveid), 
exid varchar(20) references specialrequest(exid)); 


insert into person values
('user1','dbms1','s001','Sai','nellore',9010100876,'student'),
('user2','dbms2','f001','Nayana','kollam',9020407876,'faculty'),

('user3','dbms3','s002','Ayan','tirchur',9010602904,'student'),
('user4','dbms4','f002','Navneeth','malappuram',8020407876,'faculty');
insert into leavetype values
('lt01','casual',14),
('lt02','maternity',180),
('lt03','medical',15),
('lt04','dutyleave',5),
('lt05','sabbatical',10);
insert into contains values
('user1','lt04'),
('user2','lt02'),
('user1','lt03');
insert into authority values
('a001','greeshma','kochi',9443322551),
('a003','remya','allepey',7443322551),
('a002','anjali','trivandrum',8909014356);
insert into leave values
('l004','maternity',150,'Y','2007-03-10','2007-08-10','a002'),
('l003','duty leave',2,'N','2007-07-17','2007-07-19','a001'),
('l001','sisters marriage',3,'Y','2019-09-11','2019-09-14','a001'),
('l005','jaundice',10,'Y','2006-02-10','2006-02-20','a003'),
('l002','viral fever',7,'Y','2018-12-4','2018-12-10','a002');
insert into apply values
('user1','lt04','l003'),
('user2','lt02','l004'),
('user1','lt03','l005');
insert into specialrequest values
('e001',2),
('e002',1);
insert into extends values
('l004','e001');


