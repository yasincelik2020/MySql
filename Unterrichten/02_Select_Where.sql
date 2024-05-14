/***************************
      SELECT - WHERE -> filtreleme
****************************/
/*
verileri select komutu ile  db'den çekerken filtrelem yapmak için WHERE komutu SELECT ile kullanilir.
syntax -> SELECT column1,column2.... FROM tablo_Name WHERE koşul;
*/
create table ogrenciler
(
id int,
isim varchar(45),
adres varchar(100),
sinav_not double(4,2) 
); -- once boyutunu, den sonra kac basamak oalcak, onu giriyoruz.
insert into ogrenciler values(101,'Rasit','Samsun', 55.75);
insert into ogrenciler values(102,'Ercan','Agri', 80.75);
insert into ogrenciler values(102,'Mahmut','Kayseri', 38.75);
insert into ogrenciler values(103,'Nuray','Trabzon', 61.75);
insert into ogrenciler values(104,'Ebru','Mus', 49.75);
insert into ogrenciler values(105,'Yasin','Ankara', 82.75);
insert into ogrenciler values(106,'Beyza','Bursa', 16.75);
select * from ogrenciler;

-- Task01-> sinav notu 80'den büyük (where) öğrencileri (*) listeleyen (select) query create ediniz...
select * from ogrenciler where sinav_not>=80; -- <> bu isaret esit degil isareti.

-- Task02-> sinav notu 80'den büyük öğrencilerin id'lerini listeleyen query create ediniz...
select id from ogrenciler where sinav_not>=80;

-- Task03-> adresi Ankara olan öğrencilerin isim ve adreslerini listeleyen query create ediniz...
select isim,adres from ogrenciler where adres='Ankara'; -- incase sensitive
select isim,adres from ogrenciler where adres='ankara'; -- incase sensitive
select isim,adres from ogrenciler where adres='ANKARA'; -- incase sensitive

/***************************
      SELECT - BETWEEN
****************************/

-- BETWEEN 2 mantıksal ifade ile  belirtilen   veriler arasındaki dataları  listeler
-- ahan da TRICK -> BETWEEN de; belirttigini sınır degerleri de, listelemeye dahildir.

create table personel 
(
id char(4),
isim varchar(50),
maas int
);


insert into personel values('1001', 'Haluk Bilgin', 70000);
insert into personel values('1002', 'Java Han', 85000);
insert into personel values('1003', 'Ipek Bilir', 65000);
insert into personel values('1004', 'Java Tar', 95000);
insert into personel values('1005', 'Javva Nur', 80000);
insert into personel values('1006', 'Java Naz', 100000);
insert into personel values('1006', 'Java Su', 333000);
insert into personel values('1006', 'Java Can', 222000);
select * from personel;

-- Task04 -> id'si 1002 ile 1005 arasında olan personel bilgilerini listeleyen query create ediniz.
-- 1.yol
select * from personel where id between '1002' and '1005';

/*********************************
              AND - OR
**********************************/ 
/*
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
En az bir tanesi gerçekleşmez ise listelemez.kaynana gibi kötümser

SELECT * FROM matematik sinav1 > 50 AND sinav2 > 50
Hem sinav1 hemde sinav2 alanı, 50'de büyük olan kayıtları listeler.

OR (veya): Belirtilen şartlardan en az biri gerçekleşirse, kayıt listelenir. ANA gibi iyimser

SELECT * FROM matematik sinav1 > 50 OR sinav2 > 50
Hem sinav1 veya sinav2 alanı, 50'de büyük olan kayıtları listeler.
*/
-- 2.yol
select * from personel where id>='1002' and id<='1005';

-- Task05 ->  Maaşı 70000 veya ismi Java Naz  olan personeli listeleyen query create ediniz.
select * from personel where maas = 70000 or isim = 'Java Naz'; -- int degerini '' icinde veya tirnaksiz yazabiliriz.
select * from personel where maas = '70000' or isim = 'Java Naz'; -- int degerini '' icinde veya tirnaksiz yazabiliriz.

/*********************************
                       IN
**********************************/ 
/*
IN: Birden fazla mantıksal ifade ile tanımlabilen durumları tek komutla
sorgu yazabilme imkanı verir.
 
Syntax->  SELECT sutun1, sutun2 ....
 FROM tablo_adı
 WHERE sutun_adı IN (deger1, deger2)
*/

-- Task06 -> id'si 1001,1002 ve 1004 olan personel bilgilerini listeleyen query create ediniz.
-- 1.yol cincix code
select * from personel where id in ('1001',1002,'1004'); -- rakamsal ifade oldugu icin tirnak olmadan da yazabiliyoruz.
-- 2.yol amele code
select * from personel where id='1001' or id='1002' or id='1007'; -- 1007 id olmadigi icin record gozukmedi.

-- Task06.5 -> Maaşı sadece 70000 veya ismi javva Nur olan personeli listeleyen query create ediniz. ->
select * from personel where maas=70000 or isim='javva nur'; -- sadece maas sütununa baktigi icin bu sütunda 'javva nur' bulamaz
select * from personel where maas in(70000,'javva nur');

-- Ahan da Trick-> 'in' için sabit bir column ama 'or' için birden farkli colum sorgulanabilir
-- 'in' oldugu zaman farkli kolonlardan cagirma islemi yapilamaz.

/*********************************
              SELECT - LIKE
**********************************/ 

/*
SELECT - LIKE
LIKE: Sorgulama yaparken belirli patternleri kullanabilmesini  sağlar

Syntax –> SELECT sutun1, sutun2, ...FROM tablo_adı WHERE sutünN LIKE pattern

PATTERN İÇİN
% -> 0 veya daha fazla karakteri belirtir.
_ -> Tek bir karakteri belirtir.  _ : karakter sayısı kadar kullanılır.
*/

-- Task07 -> İsmi J harfi ile başlayan personeli listeleyen query create ediniz.
select * from personel where isim like 'j%'; -- % kensidinden sonra sonsuz karakter anlamina gelir.

-- Task07.5 -> İsmi J harfi ile başlayan 8 harfli personeli listeleyen query create ediniz.
select * from personel where isim like 'j_______'; -- _ kac tane koyarsak o kadar karakter eklenmis hali demektir.

-- Task08 -> İsmi N harfi ile biten personeli listeleyen query create ediniz.
select * from personel where isim like '%n'; -- % kensidinden sonra sonsuz karakter anlamina gelir.

-- Task09 -> İsminin 2. harfi A olup takip eden harflerinde U olan personel listeleyen query create ediniz.
select * from personel where isim like '_a%u%';
/* SELECT * FROM Personel
WHERE SUBSTRING(İsim, 2, 1) = 'E'
AND İsim LIKE '_A%' */

-- Task10-> ismi 1. harfi j ve 7. harfi A olan personeli listeleyen query create ediniz.
select * from personel where isim like 'j_____a%';

-- Task11 -> İsminde A harfi olmayan personeli listeleyen query create ediniz.
select * from personel where isim not like '%a%';

