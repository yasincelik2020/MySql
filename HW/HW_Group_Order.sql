create table product_group (
g_code 	  char(7) primary key not null,
g_name 	  varchar(45),
p_manager varchar(45) default 'tanımlanmadı' );

create table products (
p_code varchar(20) unique not null,
p_name varchar(45),
g_code char(7) ,
g_renk varchar(10),
fiyat int,
CONSTRAINT group_fk FOREIGN KEY (g_code) REFERENCES product_group(g_code) );

insert into product_group (g_code,g_name) values 
('DT','DeskTop'),('LT','LapTop'),('MP','MobilePhone'),('PR','Printer');  

insert into products(p_code,p_name,g_code,fiyat) values 
('AS01', 'Asus 14" Notebook', 	'LT',450),('AS15', 'Asus 15" Notebook', 	'LT',650),
('D151', 'Dell 15" Notebook',  	'LT',550),('DT01','Asus Desktop Computer',	'DT',480),
('AP70', 'Asus Mobile phone ',  'MP',300),('DT02','Asus Desktop Computer',	'DT',460),
('AP20', 'Asus MMobile Phone',	'MP',290),('DT03','HP Desktop Computer',	'DT',440),
('HP05', 'HP 17" Notebook',    	'LT',600),('DT04','Dell Desktop Computer',	'DT',390),
('AS05', 'Asus 15" Notebook',  	'LT',570),('DT05','Dell Desktop Computer',	'DT',395),
('BL13', 'Brother Lazer Printr','PR',120),('DT06','Zenon Desktop Computer',	'DT',475),
('IJ10', 'HP InkJet Printer',  	'PR', 70),('DT07','Dell Desktop Computer',	'DT',495),
('LZ30', 'HP Lazer Printer',   	'PR', 99),('DT08','HP Desktop Computer',	'DT',500);

select * from products;
select * from product_group;
-- Soru 1) products table a marka column ekleyiniz

alter table products add  marka varchar(50);

-- Soru 2) product_group , g_name  i, varchar(20) olarak update edin
alter table product_group modify g_name varchar(20);

-- Soru 3) pruducts table renk column silin
alter table products drop column g_renk;

-- Soru 4) product_group , g_name i group_name olarak değiştirin.
alter table product_group rename column name to group_name;

-- Soru 5) product_group , group_name i g_name varchar(15) olarak değiştirin.
alter table product_group rename column group_name to g_name ;
alter table product_group modify g_name varchar(15) ;

-- Soru 6) kaç adet masaüstü(DT) ve  Laptop (LT) bilgisayar vardır listeleyen query create ediniz.
SELECT g_code, COUNT(*) AS adet
FROM products
WHERE g_code IN ('DT', 'LT')
GROUP BY g_code;

-- Soru 7) Laptopların fiyatları toplamı listeleyen query create ediniz.
SELECT g_code, SUM(fiyat) AS Laptop_Fiyat
FROM products
WHERE g_code ='LT'
GROUP BY g_code;

-- Soru 8) Printer ortalama fiyatı listeleyen query create ediniz.
SELECT g_code, avg(fiyat) AS Printer_Ortalama_Fiyat
FROM products
WHERE g_code ='PR'
GROUP BY g_code;

-- Soru 9) En ucuz ürünü listeleyen query create ediniz.


-- Soru 10) En ucuz DeskTop  listeleyen query create ediniz.


-- Soru 11) Her ürün grubundan kaç adet ürün vardır listeleyen query create ediniz..


-- Soru 12) Her bir ürün grubundaki en ucuz ürünleri listeleyen query create ediniz.


-- Soru 13) ustteki soru g_name ile yapın 


-- Soru 14) Her ürün grubundan kaç adet ürün vardır ve ortalma fiyatları nedir listeleyen query create ediniz.


-- Soru 15) (11 soru) Her ürün grubundan kaç adet ürün vardır listeleyen query create ediniz.(g name ile)