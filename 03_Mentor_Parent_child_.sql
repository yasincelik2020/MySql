create table Books (
Book_id int primary key,
Title varchar (255) not null,
Author varchar (255) not null,
Published_Year int,
Genre varchar (50),
Available_Copies int
);
Insert into Books (
Book_Id, Title, Author, Published_Year, Genre, Available_Copies) values 
(00551, 'The_Great_Gatsby', 'F_Scott_Fitzgerald', '19250410', 'Tragedy', '10000'),
(00552, 'ULYSSES', 'James_Joyce', '19220202', 'Modernist_Novel', '10000'),
(00553, 'Lolita', 'Vladimir_Nabokov', '19552001', 'Novel', '10000'),
(00554, 'Brave_New_World', 'Aldous_Huxley', '19320505', 'Science_Fiction_Dystopian_Fiction', '10000'),
(00555, 'The_Sound_And_The_Fury', 'William_Faulkner', '19290103', 'Southern_Gothic', '10000'),
(00556, 'Catch22', 'Joseph_Heller', '19611010', 'Dark_Comedy', '10000'),
(00557, 'The_Grapes_Of_Wrath', 'John_Steinbeck', '19391404', 'Novel', '10000'),
(00558, 'I_Claudius', 'Robert_Graves', '19340810', 'Historical', '10000'),
(00559, 'To_The_Lighthouse', 'Virginia_Woolf', '19270505', 'Modernism', '10000'),
(05510, 'Slaughterhouse_Five', 'Kurt_Vonnegut', '19693103', 'War_Novel', '10000'),
(05511, 'Invisible_Man', 'Ralph_Ellison', '19521404', 'African_American_Literature', '10000'),
(05512, 'Native_Son', 'Richard_Wright', '19400103', 'Social_Protest', '10000'),
(05513, 'USA_Trilogy', 'John_Dos_Passos', '19300405', 'Political_Fiction', '10000'),
(05514, 'A_Passage_To_India', 'E_M_Forster', '19240406', 'Novel', '10000'),
(05515, 'Tender_Is_The_Night', 'F_Scott_Fitzgerald', '19341204', 'Tragedy', '10000'),
(05516, 'Animal_Farm', 'George_Orwell', '19451708', 'Political_Satire', '10000'),
(05517, 'The_Golden_Bowl', 'Henry_James', '19041011', 'Philosophy', '10000'),
(05518, 'A_Handful_Of_Dust', 'Evelyn_Waugh', '19340603', 'Fiction', '10000'),
(05519, 'As_I_Lay_Dying', 'William_Faulkner', '19300302', 'Black_Comedy', '10000'),
(05520, 'The_Heart_Of_The_Matter', 'Graham_Greene', '19480302', 'Nove', '10000');
select * from books;

-- Task 1:Animal Farm kitabı kime ait
Select author from books where Title='animal_farm';
-- Task 2:Native Son kiatbının id si kaçtır
Select Book_id from books where Title='Native_Son';
-- Task 3:id si 05520 olan kitabın bilgilerini getiriniz
Select * from books where Book_id='05520';
-- Task 4:Lolita kitabını listeden silin
delete from books where title='lolita';

create table Members (
Member_id int primary key,
Name varchar (100) not null,
Email varchar (100) unique,
barrow_book int,
constraint bookfk FOREIGN KEY (barrow_book) References books(Book_id)
);
-- 1. Üye
insert into members(member_id,name,email,barrow_book) values(101,'asya','asya@gmail.com',00551);
-- 2. Üye
INSERT INTO members(member_id, name, email, barrow_book) VALUES(102, 'Ahmet Öztürk', 'ahmet.oztrk@example.com', 05520);
-- 3. Üye
INSERT INTO members(member_id, name, email, barrow_book) VALUES(103, 'Didem Çelik', 'didem.celik@example.com', 00554);
-- 4. Üye
INSERT INTO members(member_id, name, email, barrow_book) VALUES(104, 'Burak Kaya', 'burak.kaya@example.com', 00555);
-- 5. Üye
INSERT INTO members(member_id, name, email, barrow_book) VALUES(105, 'Esra Demir', 'esra.demir@example.com', 00556);

-- 6. Üye
INSERT INTO members(member_id, name, email, barrow_book) VALUES(106, 'Mehmet Yıldırım', 'mehmet.yildirim@example.com', 00557);

-- 7. Üye
INSERT INTO members(member_id, name, email, barrow_book) VALUES(107, 'Ayşe Karataş', 'ayse.karatas@example.com', 00558);

-- 8. Üye
INSERT INTO members(member_id, name, email, barrow_book) VALUES(108, 'Hasan Yılmaz', 'hasan.yilmaz@example.com', 00559);

-- 9. Üye
INSERT INTO members(member_id, name, email, barrow_book) VALUES(109, 'Fatma Çiftçi', 'fatma.ciftci@example.com', 05510);

-- 10. Üye
INSERT INTO members(member_id, name, email, barrow_book) VALUES(110, 'Ali Koç', 'ali.koc@example.com', 05511);

select * from members; 

-- Task 1:  Ali Koç 'un ödünc aldığı kitap bilgisi
select books.Title, books.Author, members.Name, members.barrow_book
from books, members
where members.name='Ali Koç' and members.barrow_book= books.book_id;

select * from books,members where members.name='Ali Koç' and members.barrow_book= books.book_id;

-- Task 2: 557 numaralı kitap kim tarafından ve hangi mail tarafindan yazılmıştır
select books.Author, members.Email from books, members where Book_id='557' and members.barrow_book= books.book_id;
-- Task 3: Fatma Çifçi adlı üyeyi listeden siliniz
delete from members where name='Fatma Çiftçi';

select * from members;



