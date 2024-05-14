-- UPDATE - SET
-- SYNTAX
-- UPDATE tablo_adı SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,... WHERE koşul;
CREATE TABLE tedarikciler -- parent table
(
vergi_no int PRIMARY KEY,-- PK 
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Java CAN');
INSERT INTO tedarikciler VALUES (102, 'Clarus', 'Ebik Gabik');
INSERT INTO tedarikciler VALUES (103, 'Google', 'Java NAZ');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Java SU');
INSERT INTO tedarikciler VALUES (105, 'Micro Soft', 'Javva NUR');

select * from tedarikciler;
    
CREATE TABLE urunler -- child table
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim  VARCHAR(50),
CONSTRAINT urun_fk FOREIGN KEY(ted_vergino ) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Haluk Bilgin');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Ipek Bilir');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Harun Bil');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Hasan Bilmiş');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Halime Bak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Merve Bilmiş');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Gibi');
-- INSERT INTO urunler VALUES(106, 1007,'Tetris', 'Jet Lee'); -- parent table da olmayan id, child table a eklenemez.

select * from urunler;
select * from urunler,tedarikciler where tedarikciler.vergi_no=urunler.ted_vergino;

-- task01-> vergi_no’su 102 olan tedarikcinin (firma) ismini 'Istanbul' olarak güncelleyeniz.
update tedarikciler
set firma_ismi='Istanbul'
where vergi_no=102;

--  task02-> Tedarikciler tablosundaki tüm firma isimlerini 'Ankara' olarak güncelleyeniz.
update tedarikciler
set firma_ismi='Ankara';
select * from tedarikciler;

-- task03-> vergi_no’su 101 olan tedarikcinin ismini 'Gamze' ve irtibat_ismi’ni 'Okan' olarak güncelleyiniz.
update tedarikciler
set irtibat_ismi='Okan',
firma_ismi='Gamze'
where vergi_no=101;

-- task04-> urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id 1 arttrn.
update urunler
set urun_id=urun_id+1
where urun_id>1004;

-- task05-> urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler
set urun_isim='Telefon'
where urun_isim='Phone';

-- task06-> urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update urunler
set urun_id=urun_id+ted_vergino;

-- task07-> Laptop satin alan musterilerin ismini, firma_ismi Gamze’nin irtibat_ismi ile degistirin.
update urunler
set urunler.musteri_isim= (select tedarikciler.irtibat_ismi from tedarikciler where tedarikciler.firma_ismi='Gamze')
where urun_isim='Laptop';

select * from urunler;
select * from tedarikciler;