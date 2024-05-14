/*
Coklu   yorum satirina istedigimiz bilgileri girebiliriz.
*/
-- single yorum satiri
create database fsae03;
use fsae03; -- database i aktif yapmak icin yaptik.
create table javaCAN
(
id varchar(4),
javaCAN_name varchar(50),
yas int
);
/***************************
      VERI GIRISI
****************************/
insert into javaCAN values('101', 'Rasit Bey',33); -- database e veri girmek icin kullaniyoruz.
insert into javaCAN values('102', 'Mahmut Bey',32); -- char larda tek tirnak kullaniyoruz. int da trinak yok.
insert into javaCAN values('103', 'Nuray Hanim',31);
insert into javaCAN values('104', 'Yasin Bey',30);
insert into javaCAN values('105', 'Ercan Bey',34);
insert into javaCAN values('106', 'Ebru Hanim',34);
/***************************
TABLODAN VERI SORGULAMA
****************************/
-- syntax-> select * from table_name
select * from javacan; -- yildiz tum veriler anlamina gelir. Secilen tum veriler getirilsin anlami tasir.alter
select id, yas from javacan; -- javacan tablodan sadece Id ve yas fieldleri getirdik. (record edildi)

/***************************
PARCALI VERI GIRISI
****************************/
insert into javacan(id,javacan_name) values('106','Ercan Bey');
-- genel olarak java gibi degil. Bilgi girince tekrar guncellememiz gerekiyor. Yani tabloyu getirmek icin select yapmamiz lazim.
/***************************
TABLOYU DB'DEN SILME
****************************/
-- drop direk yikar. Burada drop gorecegiz
-- syntax-> drop table table_Name
drop table javacan;

