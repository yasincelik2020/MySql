CREATE TABLE calisanlar
(
id CHAR(5),
isim VARCHAR(50),
maas int,
CONSTRAINT calisanlar_id_pk PRIMARY KEY (id)
);
INSERT INTO calisanlar VALUES('1001', 'Haluk Bilgin', 70000); 
INSERT INTO calisanlar VALUES('1002', 'Ipek Bilir' ,63000);
INSERT INTO calisanlar VALUES('1003', 'Hasan Hasmayan ', 45000);
INSERT INTO calisanlar VALUES('1004', 'Halime Baak', 15000);
select * from calisanlar;