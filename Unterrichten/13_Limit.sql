-- *****************************LİMİT**********************************
    CREATE TABLE kisiler 
    (   id int PRIMARY KEY,
        ssn CHAR(9) ,
        isim VARCHAR(50), 
        soyisim VARCHAR(50), 
        maas int,
        adres VARCHAR(50) 
    );
    
    INSERT INTO kisiler VALUES(1,123456789, 'Haluk','Bilgin', 50000,'Istanbul');
    INSERT INTO kisiler VALUES(2,234567890, 'Haluk','Bilir', 40000,'Ankara');
    INSERT INTO kisiler VALUES(3,345678901, 'Haluk','Bil',33000,'Izmir');
    INSERT INTO kisiler VALUES(4,256789012, 'Hasan','Hasmayan',21000,'Adana');
    INSERT INTO kisiler VALUES(5,344678901, 'Halime','Baak', 15000,'Ankara');
    INSERT INTO kisiler VALUES(6,345458901, 'Hanimiş ','Bee',7000,'Istanbul');
    INSERT INTO kisiler VALUES(7,123456711, 'Çin','Li', 23000,'Fizan');
    INSERT INTO kisiler VALUES(8,234567812, 'Kim','TutarSeni',42000,'Gonya');
    INSERT INTO kisiler VALUES(9,345678913, 'Gemi','TutarBeni',38000,'Gayseri');
    INSERT INTO kisiler VALUES(10,256789231, 'Tatar','Irmizan',20000,'Denizli');
    INSERT INTO kisiler VALUES(11,344678134, 'Durmuş','Mu', 17000,'Muş');
    INSERT INTO kisiler VALUES(12,345458752, 'Sultan ','Sülüman',18000,'Cangiri');
    INSERT INTO kisiler VALUES(13,345458752, 'Sultan ','Sülüman',18000,'Cangiri');
    INSERT INTO kisiler VALUES(14,345458752, 'Sultan ','Sülüman',18000,'Cangiri');
    
    /* ----------------------------------------------------------------------------
  task01-> kisiler’den  ilk 10 veriyi listeleyen query create ediniz…
-----------------------------------------------------------------------------*/
select * from kisiler limit 10; -- bana ilk 10 veriyi ver.

/* ----------------------------------------------------------------------------
  task02-> kisiler’den 5. veriden sonraki 4(6,7,8,9) veriyi listeleyen query create ediniz…
-----------------------------------------------------------------------------*/
select * from kisiler limit 5,4; -- 5'den sonraki (5 haric) var olan 4 veriyi (6,7,8,9) listeler

-- task02.5 -> kisiler tablosundaki 7. veriden sonraki 12 veriyi siralayiniz.
select * from kisiler limit 7,12; -- 7 den sonraki 12 adet veriyi getirir(12 tane yoksa olani getirir)
-- where li cozum:
select * from kisiler 
where id>7
limit 12;
/* ----------------------------------------------------------------------------
  task03-> MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyen query create ediniz…
-----------------------------------------------------------------------------*/
select * from kisiler order by maas desc limit 3;
/* ----------------------------------------------------------------------------
  task04-> MAAŞ'ı en düşük  5 kişinin bilgilerini listeleyen query create ediniz…
-----------------------------------------------------------------------------*/
select * from kisiler order by maas  limit 5;


/* ----------------------------------------------------------------------------
  task05-> MAAŞ'a göre sıralamada 4. 5.  6. kişilerin bilgilerini listeleyen query create ediniz…
-----------------------------------------------------------------------------*/
select * from kisiler order by maas limit 3,3;
select * from kisiler; 

-- task-> id'si 9 dan büyük değerleri maasına göre  ilk 3 'ünü sıralayınız    
select * from kisiler where id>9 order by maas limit 3;   

-- task --> maasi,  maas ortalamasindan buyuk olan ilk iki kisiyi listeleyin.
select * 
from kisiler 
where maas>(select avg(maas) from kisiler ) 
order by maas
limit 2;