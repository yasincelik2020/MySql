create table ogrenci(
    ogrenci_id   int auto_increment PRIMARY KEY,
    ogrenci_isim        varchar(30) not null,
    ogrenci_soyisim   varchar(30) not null,
    ogrenci_eMail    varchar(50) DEFAULT'',
    ogrenci_telefon    varchar(10) DEFAULT'',
    bolum_id   int not null ,
    FOREIGN KEY (bolum_id) REFERENCES bolum(bolum_id)  -- Foreign key constraint
    );

create table bolum(
   bolum_id   int PRIMARY KEY auto_increment ,
   bolum_isim   varchar(50) 
    
);

create table ders(
    ders_id   int PRIMARY KEY,
    ders_isim   VARCHAR(50),
    ders_saat int
);


-- 

INSERT INTO ogrenci(ogrenci_isim, ogrenci_soyisim, ogrenci_eMail, bolum_id)
VALUES
  ('Ahmet', 'Yildiz', 'ahmet.yildiz@example.com', 1),
  ('Ayse', 'Can', 'ayse.can@example.com', 2),
  ('Burak', 'Deniz', 'burak.deniz@example.com', 3),
  ('Cansu', 'Ozcan', 'cansu.ozcan@example.com', 1),
  ('Deniz', 'Coskun', 'deniz.coskun@example.com', 2),
  ('Elif', 'Yilmaz', 'elif.yilmaz@example.com', 3),
  ('Fatih', 'Arslan', 'fatih.arslan@example.com', 1),
  ('Gul', 'Cam', 'gul.cam@example.com', 2),
  ('Hasan', 'Dogan', 'hasan.dogan@example.com', 3),
  ('Irem', 'Kurt', 'irem.kurt@example.com', 1);
INSERT INTO bolum(bolum_isim)
VALUES
  ('Bilgisayar Mühendisliği'),
  ('Elektrik Mühendisliği'),
  ('Makine Mühendisliği'),
  ('Ekonomi'),
  ('İşletme'),
  ('Matematik'),
  ('Fizik'),
  ('Kimya'),
  ('Biyoloji'),
  ('Tarih');



SELECT bolum_id, count(*)
from ogrenci
group by bolum_id;

sELECT * FROM bolum;
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (2,'müzik', '1');
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (1,'matematik', '3');
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (3,'fizik', '2');
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (4,'kimya', '2');
INSERT INTO ders(ders_id,ders_isim, ders_saat) VALUES (5,'geometri', '3');
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (6,'biyoloji', '5'); 
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (7,'sanat', '4'); 

 SELECT * from  ders;
 select * from ogrenci;
 select * from bolum;
 
-- Task01->  öğrencilerin bölümlerini listeleyiniz.
select ogrenci.ogrenci_isim,ogrenci.ogrenci_soyisim,bolum.bolum_isim
from bolum
left join ogrenci
on ogrenci.bolum_id=bolum.bolum_id;

-- Task02->  hangi bölümden kaç ders kaydi olduğunu bulunuz.
select bolum.bolum_isim, count(ogrenci.ogrenci_id) as ders_kayit
from bolum
left join ogrenci
on ogrenci.bolum_id=bolum.bolum_id
group by bolum.bolum_isim;

-- Task03->  Ogrenci tablosuna ders_id adında bir sutun ekleyiniz ve bu sutun ders tablosundaki id için foreign key olsun
alter table ogrenci 
add column ders_id int,
add constraint fk_ders
foreign key (ders_id)
references ders(ders_id);

-- Task04->  Ogrenci tablosundaki telefon sutununu siliniz
alter table ogrenci
drop column ogrenci_telefon;

-- Task05->  Ogrenci tablosundaki ogrenci_emaili sutun adını sadece mail olarak değiştiriniz
alter table ogrenci
rename column ogrenci_eMail to mail;

-- Task06->  ogrenci tablosundaki ders_id değerlerine 1'den 7'ye kadar rastgele bir değer atayınız
update ogrenci
set ders_id = (select floor(rand() * 7)+1)
where ders_id is null;

-- Task07->  herhangi bir derse kayitli olmayan öğrenci listesini yazdiriniz
select * 
from ogrenci
where ders_id is null;

-- Task08->  hangi derse kaç  öğrencininkayit yaptirdiğini bulunuz.
select ders_isim, count(ogrenci_isim) as ders_Kayit, group_concat(ogrenci_isim separator ', ') as ogrenciler
from ders
left join ogrenci
on ogrenci.ders_id=ders.ders_id
group by ders_isim;

-- Task09->  her bölümün kayitli olan toplam ders saatini bulunuz.
select bolum_isim, sum(ders_saat) as toplam_ders_saati
from ogrenci
left join ders on ders.ders_id=ogrenci.ders_id
left join bolum on ogrenci.bolum_id = bolum.bolum_id
group by bolum_isim;

-- Task010->  en yüksek ders saatine sahip bölümü bulunuz.
select bolum_isim, sum(ders_saat) as toplam_ders_saati
from ogrenci
left join ders on ders.ders_id=ogrenci.ders_id
left join bolum on ogrenci.bolum_id = bolum.bolum_id
group by bolum_isim
order by toplam_ders_saati desc
limit 1;

-- Task10->  matematik ve kimya dersini alan ogrenci isim ve soy isimlerini birleştirerek yazdırın
select concat(ogrenci_isim,' ', ogrenci_soyisim) as matematik_kimya_dersi_alanlar
from ogrenci
left join ders
on ders.ders_id=ogrenci.ders_id
where ders_isim in ('matematik','kimya');















-- Task09->  her bölümün kayitli olan toplam ders saatini bulunuz.
select bolum_isim, sum(ders_saat) as toplam_ders_saati
from ogrenci
left join bolum on ogrenci.bolum_id=bolum.bolum_id
left join ders on ogrenci.ders_id=ders.ders_id
group by bolum_isim;

-- Task010->  en yüksek ders saatine sahip bölümü bulunuz.
select bolum_isim, sum(ders_saat) as toplam_ders_saati, group_concat(ders_isim separator ' , ') as dersler, group_concat(ders_saat separator ' , ') as ders_saat, group_concat(ogrenci_isim separator ' , ') as ogrenciler
from ogrenci
right join bolum on ogrenci.bolum_id=bolum.bolum_id
right join ders on ogrenci.ders_id=ders.ders_id
group by bolum_isim;

-- Task010->  en yüksek ders saatine sahip bölümü bulunuz.
select bolum_isim, sum(ders_saat) as toplam_ders_saati
from ogrenci
left join bolum on ogrenci.bolum_id=bolum.bolum_id
left join ders on ogrenci.ders_id=ders.ders_id
group by bolum_isim
order by toplam_ders_saati desc
limit 1;
