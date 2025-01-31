
/*name:hirwa dukuze valentin                              LE 31/01/2025
reg:2405000522
department:BIT
sckool:it
lecture:dr.BUGINGO EMANUEL
*/


-- database creation
-- library_management_system database creation
create database library_managements_system;
use library_managements_system;
-- create tables
-- books table creation
create table books(bookid int primary key,book_name varchar(50) not null,author varchar(70),number_of_book int);
desc books;
-- members table creation
create table members(memberid int primary key,membername varchar(70)not null,phone varchar(10));
desc members;
-- loans table creation
create table loans(loanid int primary key,bookid int,borrowdate date,returndate date,foreign key(bookid) references books(bookid));
desc loans;
alter table loans add column memberid int after bookid;
alter table loans add constraint foreign key(memberid) references members(memberid);

-- crud
-- insert into books
insert into books(bookid,book_name,author,number_of_book) 
values(011,'biology','bruce okoyi',14),
(012,'chemistry','the ben',12),(013,'physics','juno kamishi',10),(014,'economics','the ben',30);
select * from books;
select sum(number_of_book) from books;
select avg(number_of_book) from books;
select count(number_of_book) from books;

-- insert into members
insert into members(memberid,membername,phone)
values(1,'papa cyangwe','1234567'),(2,'mama cyangwe','7654321'),(3,'cyangwe','234567'),(4,'cyirabiranya','34567');
select * from members;
select sum(phone) from members;
select avg(phone) from members;
select count(phone) from members;

-- insert into loans
insert into loans(loanid,bookid,memberid,borrowdate,returndate)
values(55,011,1,'2025-01-01','2025-01-11'),(66,012,2,'2025-01-12','2025-01-13'),(77,013,3,'2025-01-13','2025-01-14'),
(88,014,4,'2025-01-19','2025-01-21');
select * from loans;
select sum(loanid) from loans;
select avg(loanid) from loans;
select count(loanid) from loans;

-- view creation
-- first view of list_of_book. from books table
create view list_of_book AS select book_name,author from books;
select * from list_of_book;
-- second view of lessbook from books table
create view lessbook AS select bookid,book_name,number_of_book from books where number_of_book<14;
select * from lessbook;
-- third view of membernames from members table
create view membernames AS select membername from members;
select * from membernames;
-- fourh view of member id and their phone number only
create view memberid_and_phone_number AS select memberid,phone from members;
select * from memberid_and_phone_number;
-- firth view of loanid_and_returndate from loan table
create view loanid_and_returndate AS select loanid,returndate from loans;
select * from loanid_and_returndate ;
-- sixth view from loans table
create view bookid_and_borrowdate AS select bookid,borrowdate from loans;
select * from bookid_and_borrowdate;
-- stored procedure
-- stored procedure  for insert in book table
DELIMITER $$
CREATE PROCEDURE inserboo(in bookiparam int,in booknaparam varchar(70),in authparam varchar(50),in numberparam int)
begin
insert into books values(bookiparam,booknaparam,authparam,numberparam);
end $$
delimiter ;
call inserboo(16,'geograph','oko',70); 
select * from books;
-- stored procedure to delete in members table

DELIMITER $$
CREATE PROCEDURE delmember(in memberparam int)
begin
update members set membername='kagame' where memberid=memberparam;
end $$
delimiter ;
call delmember(4);
select * from members;


-- stored procedure for delete in loans

DELIMITER $$
CREATE PROCEDURE delloans(in loaniparam int)
begin
delete from loans where loanid=loaniparam;
end $$
delimiter ;
call delloans(66);
select * from loans;

-- stored procedure select in loans
DELIMITER $$
CREATE PROCEDURE seloans(in loaiparam int)
begin
select * from loans where loanid=loaiparam;
end $$
delimiter ;
call seloans(55);


-- stored procedure to select in books

DELIMITER $$
CREATE PROCEDURE selboo(in booiparam int)
begin
select * from books where bookid=	booiparam;
end $$
delimiter ;
call selboo(12);
call selboo(14);


-- stored procedure to update books table
DELIMITER $$
CREATE PROCEDURE upbooks(in booidparam int)
begin
update books set author='chiris' where bookid=booidparam;
end $$
delimiter ;
call upbooks(16);
select * from books;

-- triger after insert in books
delimiter $$
create trigger upbl
after insert on books
for each row
begin
update loans set bookid=bookid+1;
end $$
delimiter ;
show triggers;
drop trigger inserbook;

-- insert into books(bookid,book_name,author,number_of_book) values(015,'ideology','kisekedi',11);
insert into books(bookid,book_name,author,number_of_book) values(015,'ideology','kisekedi',11);

-- creattion of user
create user 'valenti'@'127.0.0.1' identified by '2405000522';
grant all privileges on *.* to 'valenti'@'127.0.0.1';
flush privileges;



