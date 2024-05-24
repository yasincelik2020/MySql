CREATE TABLE personel
(
id int primary key, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
sirket VARCHAR(20)
);

INSERT INTO personel VALUES(123456789, 'Haluk Bilgin', 'Istanbul', 50000, 'IBM');
INSERT INTO personel VALUES(234567890, 'Ipek Bilir', 'Istanbul', 25000, 'Google');
INSERT INTO personel VALUES(345678901, 'Harun Bilmiş', 'Ankara', 13000, 'IBM');
INSERT INTO personel VALUES(456789012, 'Harun Bilmiş', 'Izmir', 10000, 'Microsoft');
INSERT INTO personel VALUES(567890123, 'Harun Bilmiş', 'Ankara', 17000, 'Amazon');
INSERT INTO personel VALUES(456789013, 'Ipek Bilir', 'Ankara', 15000, 'Microsoft');
INSERT INTO personel VALUES(123456710, 'Halime Bak', 'Bursa', 25000, 'IBM');
select * from personel;

select * from markalar;