drop table personel;

create table personel (
musteri_no int,
ad VARCHAR(22),
soyad VARCHAR(25),
sehir varchar(45),
cinsiyet varchar(15),
puan int
);
INSERT INTO personel VALUES(111,'Haluk', 'Bilgin','Istanbul','errrkek',63);
INSERT INTO personel VALUES(222,'Ipek', 'bilir','Istanbul','kadin',99);
INSERT INTO personel VALUES(333,'Harun','Bilmiş','Izmir','errrkek',43);
INSERT INTO personel VALUES(444, 'Çin','Li','Fizan','errrkek',11);
INSERT INTO personel VALUES(555, 'Tatarrr','IrmIzan','Alcadraz','errrkek',41);

select * from personel;

-- ****************************************  concat ********************************************************

 -- SYNTAX-> concat('character', column,...);
--  column record'larini girilen value ile birleştirip yeni bir column'da return eder... 

-- task01-> ad ve soyadi record'larini 'Adiniz Soyadiniz : Haluk Bilgin ' şeklnde listeleyen query create ediniz...
select concat('Adiniz Soyadiniz : ',ad,' ',soyad) as Ad_Soyad_Bilgileri
from personel;
select musteri_no, concat(ad,' ',soyad) as Ad_Soyad, sehir, cinsiyet, puan
from personel;

-- ****************************************  length-left-right ********************************************************
-- SYNTAX-> length(column,);
-- column daki record'larin karakter sayisini(uzunluk) yeni bir column'da return eder.

-- task02-> ad ve soyad record'larinin  karakter sayisini listeleyen query create ediniz...

select ad, length(ad) as ad_uzunluk, soyad,length(soyad) as soyad_uzunluk
from personel;

-- ****************************************  left-right ********************************************************
-- SYNTAX-> left-right(column,karakter_sayisi);
-- column daki record'larin sol-sağDan girilen karakter sayisine göre parcasini yeni bir column'da return eder.

-- task03-> ad ve soyad record'larinin  ilk karakterini  listeleyen query create ediniz...
select left(ad,1) as ad_birinci_karakter,left(soyad,1) as soyad_birinci_karakter
from personel;

-- task04-> ad ve soyad record'larinin  ilk harflerini A.B şeklinde   listeleyen query create ediniz..
select concat(left(ad,1), '.' ,left(soyad,1)) as birlesmis_hali
from personel;

-- task05-> adin uzunlugu 4 den buyuk harfli record'larinin 1.3 ve 5. harflerini(MORIS -> MRS) listeleyen query create ediniz...
select  ad , concat(left(ad,1),right(left(ad,3),1),right(left(ad,5),1)) as bir_uc_besinci_harfi
from personel
where length(ad)>4;

SELECT CONCAT(SUBSTRING(ad, 1, 1), '.', SUBSTRING(ad, 3, 1), SUBSTRING(ad, 5, 1)) AS transformed_ad
FROM personel
WHERE LENGTH(ad) > 4;

-- ****************************************  substring ********************************************************
-- SYNTAX-> substr(column,);
-- column daki record'larin girilen değere göre bir paracasini yeni bir column'da return eder.
 -- task 05.1 -> ad'in ucuncu karakterinden sonrasini record eden query yaziniz.
 select ad, substring(ad,3) as son_uc
 from personel;
-- task 05.2 -> ad'in ilk uc harfini record eden query yaziniz.
 select ad, left(ad,3) as ilk_uc
 from personel;
 select ad, substring(ad,1,3) as ilk_uc
 from personel;
 
-- task05.3-> ad'in ilk 2 karakterini atlayip 2 karakterini record eden query yaziniz
 select ad, substring(ad,3,2) as iki_karakter -- birinci eger baslanacak karakter, ikinci deger kac karakter yazilacagini gosterir
 from personel;
 
 -- ****************************************** replace  ******************************************************

-- SYNTAX-> replaca(column,old_value,new_value);
-- column daki record'larin old_value,new_value olarak atayarak yeni bir column'da return eder.

-- task06-> ad ve soyad  record'larinin i harfini * ile değiştirip listeleyen query create ediniz...
select ad,
replace(ad,'i','*') as yildizli_ad,replace(soyad,'i','*') as yildizli_soyad
from personel;

-- task07-> ad ve soyad  record'larinin son 3 harfi *** ile değiştirip listeleyen query create ediniz...
select ad,
replace(ad,right(ad,3),'***'), replace (soyad,right(soyad,3),'***')
from personel;

-- ******************************************  repeat  *******************************************************************
-- SYNTAX-> repeat('yeni character',character_sayısi)
-- column daki record'lari girilen karakteri istenen sayi kadar  yeni bir column'da return eder.
 
-- task08-> ad ve soyad  record'larinin ilk harfleri hariç tum harflerini * ile değiştirip listeleyen query create ediniz...
select ad,
concat(left(ad,1),repeat('*',length(ad)-1)) as yildizli_ad,
soyad, concat(left(soyad,1),repeat('*',length(soyad)-1)) as yildizli_soyad
from personel;

-- ******************************************  lower upper  *************************************************************************
-- SYNTAX-> lower/upper(column);
-- column daki record'lari BUYUK-KUCUK harf ile yeni bir column'da return eder.

-- task09-> Personel tablosundan ad'lari kucuk soyad'lari buyuk olarak record eden query yaziniz
select ad,lower(ad),soyad,upper(soyad)
from personel;

