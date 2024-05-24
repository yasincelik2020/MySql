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

select * from personel;

-- task 1 personel tablosunda  şirket sutunun ismini departman adı olarak değiştiriniz
alter table personel rename column sirket to depertman;

-- task 2  personel tablosuna pozisyon adında yeni bir sütun ekleyiniz
alter table personel add pozisyon Varchar(20);

-- task3 -> "maas" sütununu "DECIMAL(10,2)" veri türüne dönüştürün.
alter table personel modify maas DECIMAL(10,2);

-- task4-> personel tablosunda sehiri silip yerine ülke sütunu ekleyiniz ve default olarak Almanya yapınız
alter table personel drop column sehir, add ulke_isim varchar(50) default 'Almanya';

alter table personel 
add constraint check (ulke_isim like 'A%');
INSERT INTO personel VALUES(123456711, 'Halime Cak', 25000, 'IBM','','Aollanda');
INSERT INTO personel VALUES(123456722, 'Mehmet', 23000, 'IBM','','Azerbaycan');
INSERT INTO personel VALUES(123456716, 'Ahmet', 26000, 'IBM','','Turkiye');