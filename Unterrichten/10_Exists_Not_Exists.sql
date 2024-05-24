/*=========================== EXISTS, NOT EXIST ================================
   EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer olarak,
   EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde 
   bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar. 
   
   EXISTS operatorü bir Boolean operatördür ve true - false değer döndürür. 
   EXISTS operatorü sıklıkla Subquery'lerde satırların doğruluğunu test etmek 
   için kullanılır.
    
   Eğer bir subquery (altsorgu) bir satırı döndürürse EXISTS operatörü de TRUE 
   değer döndürür. Aksi takdirde, FALSE değer döndürecektir.
   
   Özellikle altsorgularda hızlı kontrol işlemi gerçekleştirmek için kullanılır
	
    SYTAX:
    SELECT kolan_ismi  
	FROM tablo_ismi  
	WHERE [NOT] EXISTS (  
    SELECT kolon_ismi   
    FROM tablo_ismi   
    WHERE koşul  
); 
==============================================================================*/

CREATE TABLE mayis
   (
     urun_id int,
     musteri_isim varchar(50), 
     urun_isim varchar(50)
    );
    
   CREATE TABLE haziran 
    (
     urun_id int ,
     musteri_isim varchar(50), 
     urun_isim varchar(50)
    );
  
   INSERT INTO mayis VALUES (10, 'Haluk', 'javaCAN');
   INSERT INTO mayis VALUES (20, 'Harun', 'javaTAR');
   INSERT INTO mayis VALUES (30, 'Ipek', 'javaNAZ');
   INSERT INTO mayis VALUES (20, 'Hasan', 'javaHAN');
   INSERT INTO mayis VALUES (10, 'Halime', 'javaSU');
   INSERT INTO mayis VALUES (40, 'Ebik', 'Gabik');
   INSERT INTO mayis VALUES (20, 'Merve', 'javvaNUR');
    
   INSERT INTO haziran VALUES (10, 'Hasmayan', 'javaCAN');
   INSERT INTO haziran VALUES (10, 'Kemal', 'javaCAN');
   INSERT INTO haziran VALUES (20, 'Hesna', 'javaTAR');
   INSERT INTO haziran VALUES (50, 'Esen', 'javvaNUR');
   INSERT INTO haziran VALUES (20, 'Esmeyen', 'javaTAR');
   select * from mayis;
      /* -----------------------------------------------------------------------------
  task01-> mayis VE haziran aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri mayis ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/
 -- 1.Yol (in)
 select urun_id, musteri_isim 
 from mayis 
 where urun_id in (select urun_id from haziran where haziran.urun_id=mayis.urun_id);
-- 2. Yol (exists)
select urun_id, musteri_isim 
 from mayis 
 where exists (select urun_id from haziran where haziran.urun_id=mayis.urun_id);
 
 /* -----------------------------------------------------------------------------
  task02-> Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve
  bu ürünleri  haziran ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/
 select urun_isim, musteri_isim 
 from haziran 
 where exists (select urun_id from mayis where mayis.urun_id=haziran.urun_id);
 
 /* -----------------------------------------------------------------------------
  task03-> Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve
  bu ürünleri haziran ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/ 
 select musteri_isim, urun_isim -- haziran ayinda satilmayanlari getirdi.
 from haziran
 where not exists (select urun_id from mayis where mayis.urun_id=haziran.urun_id);
 
  select musteri_isim, urun_isim -- mayis ayinda satilmayanlari getirdi.
 from mayis as m
 where not exists (select urun_id from haziran as h where h.urun_id=m.urun_id);
   
   select * from mayis;
   select * from haziran;
   
   INSERT INTO mayis VALUES (20, 'Esmeyen', 'javaTAR');
   INSERT INTO mayis VALUES (20, 'Hesna', 'javaTAR');

-- task 5-> mayis ve haziran tablosunda ortak olan musteri isimlerini yazdırın (edited) 
 select musteri_isim 
 from haziran 
 where exists (select musteri_isim from mayis where mayis.musteri_isim=haziran.musteri_isim);
 
 -- task 5.5-> mayis ve haziran tablosunda ortak olan H ile başlayan ortak  musteri isimlerini yazdırın
 select musteri_isim 
 from haziran 
 where exists (select musteri_isim from mayis where mayis.musteri_isim=haziran.musteri_isim and haziran.musteri_isim like 'H%');
