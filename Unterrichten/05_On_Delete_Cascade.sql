/*============================== ON DELETE CASCADE =============================
    Her defasında önce child tablodaki verileri silmek yerine doğrudan parent record silmek için
 ON DELETE CASCADE (kademeli silme)  komutu kullanılır.
 
  Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli
 
==============================================================================*/
CREATE TABLE ogrenciler -- Parent table -> PK
(
id CHAR(3) primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
   
INSERT INTO ogrenciler VALUES(101, 'Haluk Bilgin', 'JavaCan',75);
INSERT INTO ogrenciler VALUES(102, 'Ipek Bilir', 'JavaNaz',85);
INSERT INTO ogrenciler VALUES(103, 'Harun Bil', 'JavaSu',85);
INSERT INTO ogrenciler VALUES(104, 'Hasan Bilmiş', 'JavaTar',95);
INSERT INTO ogrenciler VALUES(105, 'Halime Bilse', 'JavvaNur',99);

select * from ogrenciler;

CREATE TABLE notlar -- Child table -> FK
( ogrenci_id char(3),-- FK
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY(ogrenci_id) REFERENCES ogrenciler(id)
ON DELETE CASCADE);
/*
ON DELETE CASCADE komutu ile parent table'daki record child table silinmeden silinebilir.
Ancak ON DELETE CASCADE komutu tanimlanmzsa önce child table silinir sonra parent table silinir...
*/
INSERT INTO notlar VALUES ('101','kimya',75);
INSERT INTO notlar VALUES ('102', 'fizik',65);
INSERT INTO notlar VALUES ('103', 'tarih',90);
INSERT INTO notlar VALUES ('104', 'Matematik',90);

select * from ogrenciler;
select * from notlar;
select * from ogrenciler, notlar where ogrenciler.id=notlar.ogrenci_id;

delete from notlar where ogrenci_id=101; -- child table record silindi
delete from ogrenciler where id=104; -- parent table record FK'den sonra on delete cascade oldugu icin parent ve child tablodaki veriler silindi.

