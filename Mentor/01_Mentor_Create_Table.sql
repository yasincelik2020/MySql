create database books;
use books;
create table book_List(
bookId int(5),
bookName varchar(15),
writerName char(12)
);
select * from book_List;
insert into book_List values(001, 'Filler ','Esra Aydin');
insert into book_List values(002, 'book1 ','Emin Zola');
insert into book_List values(003, 'book2 ','Hemingway');
insert into book_List values(004, 'book3 ','Sarah');
insert into book_List values(005, 'book4 ','Orhan Kemal');
insert into book_List values(006, 'book5 ','G');
create table bookPriceList(
bookId int(5),
bookPrice double(5,0)
);
insert into bookpricelist values(001, 15.00);
insert into bookpricelist values(002, 13.00);
insert into bookpricelist values(003, 11.00);