/* ===================== CONSTRAINTS - KISITLAMALAR  =====================================
           
    NOT NULL    - Bir Sütunun  NULL içermemesini yani boş olmamasını sağlar.
    UNIQUE		- Bir sütundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar.  
    PRIMARY KEY	- Bir sütünün NULL içermemesini ve sütundaki verilerin  BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
    FOREIGN KEY	- Başka bir tablodaki Primary Key’i referans göstermek için kullanılır.
                  Böylelikle, tablolar arasında ilişki kurulmuş olur. 
                  foreign ve primary ile tablolar birbirine bağlamadan da, id leri ayni olan
                  satirlarda işlem yap diyebiliriz, böylelikle ayni field verilebilir, parent child ilişkisi olmamiş olur

========================================================================================*/

CREATE TABLE calisanlar -- parent table -> PK
(
id CHAR(5) PRIMARY KEY, 
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE

);

--                             id PK      isim  U      maas NN  ise_baslama
INSERT INTO calisanlar VALUES('1002', 'Haluk Bilgin' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('1008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('1010', null, 5000, '2018-04-14'); -- null unique kisitlamasini kabul etmez. Istedigimiz kadar null kullanabiliriz.
INSERT INTO calisanlar VALUES('1004', 'Ipek Bilir', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('1005', 'Harun Bil', 5000, '2018-04-14');
-- INSERT INTO calisanlar VALUES('1006', 'Halime Bilse', NULL, '2019-04-12');-- maas null deger alamaz. Error Code: 1048. Column 'maas' cannot be null
INSERT INTO calisanlar VALUES('1003', 'Merve Bilmiş', 5000, '2018-04-14');
-- INSERT INTO calisanlar VALUES('1007', 'Merve Bilmiş', 5000, '2018-04-14');--  Error Code: 1062. Duplicate entry 'Merve Bilmiş' for key 'calisanlar.isim'
-- Merve Bilimis kayitli oldugu icin duplicate giris olamaz.
-- INSERT INTO calisanlar VALUES('1009', 'cem', '', '2018-04-14'); -- Error Code: 1366. Incorrect integer value: '' for column 'maas' at row 1
-- integer degere bir deger atamasi yapmak gerekiyor. int type hiclik kabul etmez.
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14'); -- hiclik null olarak kabul edilmez.
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- Error Code: 1062. Duplicate entry '' for key 'calisanlar.PRIMARY'
-- bir onceki degere hiclik olarak atadigimiz icin tekrar hiclik '' kabul etmiyor. Cunku id unique. 
-- INSERT INTO calisanlar VALUES( '1002', 'ayse Yılmaz' ,12000, '2018-04-14');-- Error Code: 1062. Duplicate entry '1002' for key 'calisanlar.PRIMARY'
-- pk unique oldugu icin duplicate kabul etmez.
-- INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- Error Code: 1048. Column 'id' cannot be null
-- pk null deger kabul etmez.

select *from calisanlar; 

-- KISITLAMALAR (  FOREIGN KEY)
     
CREATE TABLE adresler  -- child table ->FK
(
adres_id CHAR(5) ,    
sokak VARCHAR(50),
cadde VARCHAR(30),
sehir VARCHAR(15),
--           name.       FK.  Child column.         ParentTable column
CONSTRAINT id_clsnlr FOREIGN KEY(adres_id) REFERENCES calisanlar (id)-- parent table ile chil table PY ve FK ile ilişkilendirildi

);

--                          adres_id  sokak     cadde    sehir
INSERT INTO adresler VALUES('1003','Ebik Sok', '34.Cad.','IST');
INSERT INTO adresler VALUES('1003', 'Gabik Sok', '6.Cad.','Ankara');
INSERT INTO adresler VALUES('1002','Ağa Sok', '35.Cad.','Izmir');
INSERT INTO adresler VALUES('1008','Falan ', '23.Cad.','Elaziz');-- 
-- INSERT INTO adresler VALUES('1011','Filan ', '21.Cad.','D.Bakir');-- record sadece adresler table girer ama calisanlar table'da 1011 olmadiği için record girmez
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`fsae03`.`adresler`, CONSTRAINT `id_clsnlr` FOREIGN KEY (`adres_id`) REFERENCES `calisanlar` (`id`))
INSERT INTO adresler VALUES(null,'Ağa Sok', '35.Cad.','Izmir');--  FK null atanabilir

select * from adresler;
select * from calisanlar;
select * from calisanlar, adresler where calisanlar.id=adres_id;

drop table calisanlar; -- Error Code: 3730. Cannot drop table 'calisanlar' referenced by a foreign key constraint 'id_clsnlr' on table 'adresler'.
-- parent table, child table silinmeden silinemez.
drop table adresler; -- child tablo silindi.
drop table calisanlar; -- child table silindigi icin parent table silinebilir.

delete from calisanlar where id=1003;
delete from adresler where adres_id=1003; -- on delete cascade olmadigi icin  once child dan, daha sonra parent dan silmek lazim.



