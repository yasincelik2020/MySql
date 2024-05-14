/* ============================== DELETE ===================================  

DELETE FROM tablo_adı;  Tablonun tüm içerğini siler.
DELETE FROM tablo_adı WHERE sutun_adi = veri; Tabloda istediğiniz veriyi siler.

=========================================================================*/

CREATE TABLE ogrenciler
(
id CHAR(3),
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler VALUES(101, 'Haluk Bilgin', 'JavaCan',75);
INSERT INTO ogrenciler VALUES(102, 'Ipek Bilir', 'JavaNaz',85);
INSERT INTO ogrenciler VALUES(103, 'Harun Bil', 'JavaSu',85);
INSERT INTO ogrenciler VALUES(104, 'Hasan Bilmiş', 'JavaTar',95);
INSERT INTO ogrenciler VALUES(105, 'Halime Bilse', 'JavvaNur',83);
INSERT INTO ogrenciler VALUES(106, 'Haline Bak', 'JavaLar',99);
INSERT INTO ogrenciler VALUES(107, 'Hanimiş Bee', 'JavaHan',91);

-- secerek-filtreleyerek delete için WHERE komutu kullainilir
select * from ogrenciler;

-- task01-> id'si 102 olan ogrenciyi delete eden query create ediniz...
  
    
-- task02-> ismi Haluk Bilgin olan satırı delete eden query create ediniz...
    
    
-- task03-> ismi Halime Bilse veya Hasan Bilmiş olan kayıtları delete eden query create ediniz...
    
    
-- task04-> İsmi Harun Bil ve id'si 103 olan kaydı delete eden query create ediniz...
    
    
-- task05-> id 'si 103'dan büyük olan kayıtları delete eden query create ediniz...
    
    
-- task06-> id'si 106, 107 veya 104 olan kayitlari delete eden query create ediniz...
      
    
-- task07->  TABLODAKİ TÜM KAYITLARI delete eden query create ediniz...