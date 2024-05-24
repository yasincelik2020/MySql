/*==================== SET OPERATORLERI: UNION, UNION ALL======================
    UNION, UNION ALL, (oracleSql->INTERSECT, ve MINUS) gibi SET operatorleri yardimiyla  
    Çoklu Sorgular birlestirilebilirler.
    UNION :  Bir SET operatorudur. 2 veya daha fazla Sorgu ifadesinin sonuc 
    kumelerini birlesitirerek tek bir sonuc kumesi olusturur.    
    NOT:  Birlesik olan olan Sorgu ifadesinin veri türü diger sorgulardaki 
    ifadelerin veri türü ile uyumlu olmalidir.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    NOT: UNION operatoru SADECE benzersiz degerleri alir. Benzerli verileri almak
    için UNION ALL kullanilir.
==============================================================================*/
CREATE TABLE personel 
    (
	id int  PRIMARY KEY, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas int, 
	sirket VARCHAR(20)
    );
   
INSERT INTO personel VALUES(123456789, 'Haluk Bilgin', 'Istanbul', 50000, 'IBM');
INSERT INTO personel VALUES(234567890, 'Ipek Bilir', 'Istanbul', 25000, 'Google');
INSERT INTO personel VALUES(345678901, 'Harun Bilmiş', 'Ankara', 13000, 'IBM');
INSERT INTO personel VALUES(456789012, 'Harun Bilmiş', 'Izmir', 34000, 'Microsoft');
INSERT INTO personel VALUES(567890123, 'Harun Bilmiş', 'Ankara', 17000, 'Amazon');
INSERT INTO personel VALUES(567890144, 'Ankara', 'Ankara', 17000, 'Amazon');
INSERT INTO personel VALUES(456789015, 'Ipek Bilir', 'Ankara', 15000, 'Microsoft');
INSERT INTO personel VALUES(123456710, 'Halime Bak', 'Bursa', 25000, 'IBM');
INSERT INTO personel VALUES(123456733, 'Haluk Bilgin', 'Izmir', 35000, 'Google');

SELECT * FROM personel;

/* -----------------------------------------------------------------------------
  task01-> Maasi 20000’den cok olan isci isimlerini + 10000 liradan fazla maas 
  alinan sehirleri listeleyen query create ediniz...
------------------------------------------------------------------------------*/
select isim
from personel
where maas>20000
union
select sehir
from personel
where maas>10000;

/* -----------------------------------------------------------------------------
  task02-> Harun Bilmiş ismindeki kisilerin aldigi maaslari ve Ankara’daki 
  personelin maaslarini çoktan aza   siralayarak listeleyen query create ediniz...
------------------------------------------------------------------------------*/
select maas
from personel
where isim='Harun Bilmiş'
union
select maas
from personel
where sehir='Ankara'
order by maas desc;

/* -----------------------------------------------------------------------------
  task03-> Google IBM Microsoft şirketinde  calisan  personelin ismini listeleyen query create ediniz...
------------------------------------------------------------------------------*/
select isim
from personel
where sirket='Google'
union
select isim
from personel
where sirket='IBM'
union
select isim
from personel
where sirket='Microsoft';
-- ya da alternatif olarak distinct ve in kullanabiliriz
select distinct isim
from personel
where sirket in ('Google','IBM','Microsoft');

/*======================== FARKLI TABLOLARDAN BIRLESTIRME (UNION) ====================*/   
    CREATE TABLE personel_bilgi 
    (
	id int, 
	tel char(10) UNIQUE , 
	cocuk_sayisi int
    ); 
   
    INSERT INTO personel_bilgi VALUES(123, '5302345678', 5);
    INSERT INTO personel_bilgi VALUES(234, '5422345678', 4);
    INSERT INTO personel_bilgi VALUES(345, '5354561245', 3); 
    INSERT INTO personel_bilgi VALUES(478, '5411452659', 3);
    INSERT INTO personel_bilgi VALUES(789, '5551253698', 2);
    INSERT INTO personel_bilgi VALUES(344, '5524578574', 2);
    INSERT INTO personel_bilgi VALUES(125, '5537488585', 1);
    select * from personel_bilgi;
    
    /* -----------------------------------------------------------------------------
  task05-> id’si 123456733 olan personelin Personel tablosundan sehir ve 
  maasini, personel_bilgi tablosundan da (id ilk 3 hanesiyle kaydolmuş=123)
  tel ve cocuk sayisini listeleyen query create ediniz...  
------------------------------------------------------------------------------*/
select sehir as sehir_tel , maas as maas_cocuk
from personel
where id=123456733
union
select tel,cocuk_sayisi
from personel_bilgi
where id=123;

/* -----------------------------------------------------------------------------
  task06-> Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini ve 
 Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini listeleyen query create ediniz...
------------------------------------------------------------------------------*/
select id
from personel
where sehir in ('Istanbul','Ankara')
union
select id
from personel_bilgi
where cocuk_sayisi in (2,3);
