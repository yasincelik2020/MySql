/* ======================== TRUNCATE - DROP ============================   
   1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
       Ancak, seçmeli silme yapilamaz.TRUNCATE TABLE where ...... OLMAZ
    
   2-) DELETE komutu beraberinde WHERE cümleciği kullanılabilir ama TRUNCATE ile kullanılmaz.
       Delete komutu ile silinen veriler tanimlanan savepoint name; dan itibaren 
       ROLLBACK Komutu ile kolaylıkla geri getirilebilir.
  
   3-) TRUNCATE komutu tablo yapısını değiştirmeden, tablo içinde yer alan tüm verileri tek komutla silmenizi sağlar.
       TRUNCATE ile silinen veriler geri alınması daha zordur. Ancak Transaction yöntemi ile geri alınması mümkün olabilir.
    
   4-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da siler ROLLBACK çalişmaz. 
===================================================================================*/
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
savepoint ogrencileri_geri_getir; -- Bu komut tanimlandigi satirdan (record'dan) oncekileri yedekler.
INSERT INTO ogrenciler VALUES(107, 'Ali At', 'JavaHan',91);

select * from ogrenciler;

-- savepoint ogrencileri_geri_getir;
-- savepoint sorunu için--> ayarlar sql execution auto commit tik iptal
--  SET autocommit=0; komutu run edilerek gerekli ayar yapilir

select * from ogrenciler;
delete from ogrenciler;
rollback to ogrencileri_geri_getir; -- savepoint ile kaydettigimiz verileri geri getirir
truncate table ogrenciler; -- bu sekilde silince rollback ile geri getiremiyoruz. (truncate ile silinenler rollback ile getirilemez)
select * from ogrenciler;
drop table ogrenciler;


