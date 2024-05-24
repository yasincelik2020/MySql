drop table if exists ogrenciler;
drop table if exists dersler;
drop table if exists notlar;

create table ogrenciler(
o_no int unique not null,
isim varchar(45),
sube char(3)
);
insert into ogrenciler values (10,'Hasan','3A'),(11,'Ali','2A'),(12,'Fatma','2A'),
(13,'Canan','3A'),(14,'Zişan','3A'),(15,'Şeyda','3A'),(16,'Fatih','2A'),(17,'Yusuf','3A');

create table dersler (
d_kod int unique not null,
d_ad varchar(20),
d_ogr varchar(30),
d_kredi int
);
insert into dersler values (101,'Fizik','Mehmet hoca',5),(102,'Tarih','Hasan hoca',2),
(103,'Bilgisayar','Ayşe hoca',5),(104,'Kimya','Kamil hoca',5),(105,'Resim','Ece hoca',5); 

create table notlar (
d_kod int,
o_no int,
skor int
);
insert into notlar values (101,10,5),(101,11,8),(101,12,5),(101,10,7),
(104,10,8),(102,10,9),(102,12,7),(102,11,7),(102,10,9),(102,13,3);

select * from ogrenciler;
select * from notlar;
select * from dersler;

-- Soru 1) Oğrencileri aldıkları notlar ile birlikte listeleyen query create ediniz.
select ogrenciler.*, notlar.skor
from ogrenciler 
left join notlar
on ogrenciler.o_no=notlar.o_no;

-- Soru 2) Herhangi bir not kaydı bulunan öğrencileri aldıkları notlar ile birlikte listeleyen query create ediniz.
select ogrenciler.*, notlar.skor
from ogrenciler 
inner join notlar
on ogrenciler.o_no=notlar.o_no;
-- veya
select ogrenciler.*, notlar.skor
from ogrenciler 
right join notlar
on ogrenciler.o_no=notlar.o_no;

-- Soru  3) öğrencilerin aldıkları notları ders hocasının adı ile birlikte listeleyen query create ediniz.
select notlar.skor, dersler.d_ogr
from dersler
right join notlar
on dersler.d_kod=notlar.d_kod;
