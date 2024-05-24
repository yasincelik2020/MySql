/*=============================== ALTER TABLE =========================================
    
    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin kullanılır.
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de kullanılır.
    	constraint check ->  Bir sütuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır .
        syntax -> ALTER TABLE table_name ADD constraint check(kosul);
=======================================================================================*/

CREATE TABLE personel
(
	id int PRIMARY KEY, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas int, 
	sirket VARCHAR(20)
);

INSERT INTO personel VALUES(123456789, 'Haluk Bilgin', 'Istanbul', 50000, 'IBM');
INSERT INTO personel VALUES(234567890, 'Ipek Bilir', 'Istanbul', 25000, 'Google');
INSERT INTO personel VALUES(345678901, 'Harun Bilmiş', 'Ankara', 13000, 'IBM');
INSERT INTO personel VALUES(456789012, 'Harun Bilmiş', 'Izmir', 10000, 'Microsoft');
INSERT INTO personel VALUES(567890123, 'Harun Bilmiş', 'Ankara', 17000, 'Amazon');
INSERT INTO personel VALUES(456789013, 'Ipek Bilir', 'Ankara', 15000, 'Microsoft');
INSERT INTO personel VALUES(123456710, 'Halime Bak', 'Bursa', 25000, 'IBM');

-- task01-> personel tablosuna ulke_isim adinda ve default degeri 'Turkiye' olan yeni bir sutun ekleyiniz.
alter table personel add ulke_isim varchar(50) default 'Turkiye';

-- task02-> personel tablosuna cinsiyet Varchar(20) ve yas int data type yeni sutunlar ekleyiniz.
-- alter table personel add cinsiyet Varchar(20);
-- alter table personel add yas int;
alter table personel add (cinsiyet Varchar(20),yas int);

-- task03-> personel tablosundan sirket sutununu siliniz.
alter table personel drop column sirket;

-- task04-> personel tablosundaki ulke_isim sutununun adini ulke_adi olarak degistiriniz
alter table personel rename column ulke_isim to ulke_adi;

-- task05-> personel tablosunun adini sefil_ameleler olarak degistiriniz.
alter table personel rename to sefil_ameleler;

-- task06-> sefil_ameleler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ekleyiniz ve veri tipini VARCHAR(30) olarak değiştiriniz.
alter table sefil_ameleler modify ulke_adi varchar(30) not null;
INSERT INTO sefil_ameleler VALUES(123456789, 'Hanimiş bee', 'Istanbul', 50000, null,null,34);-- ulke_adi mot nulll
INSERT INTO sefil_ameleler VALUES(123456777, 'Hanimiş Bee', 'Istanbul', 50000, 'Amergonya',null,34);

-- task07-> sefil_ameleler tablosunun maas sutununa 9000'den buyuk datalar eklenebilir kisitlamasi ekleyiniz.
alter table sefil_ameleler add constraint check (maas>9000);
INSERT INTO sefil_ameleler VALUES(12345666, 'Jet Lee', 'Istanbul', 50000, 'Cin',null,48);
INSERT INTO sefil_ameleler VALUES(12345333, 'Hanimiş Bee', 'Istanbul', 5000, 'Fizan',null,48);-- constraint oldugu icin maasi 9000 den asagi olan maas eklenemez.


select * from personel;
select * from sefil_ameleler;
