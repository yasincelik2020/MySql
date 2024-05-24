
USE sakila;
SELECT * FROM sakila.city;


-- Task01-> City'deki her şeyi göster. Ancak sıralama country_id ' ye göre olsun ve baştan sona dogru sıralansın.
select * from city
order by country_id;

-- Task02-> City'deki her şeyi göster. Ancak sıralama city_id ' ye göre olsun ve sondan başa dogru sıralansın.
select * from city
order by city_id desc;

-- Task03-> City'deki her şeyi göster. Ancak sıralama city ' ye göre olsun ve sondan başa dogru sıralansın.
select * from city
order by city  desc;

-- Task04-> City’lerin arasından A harfi ile başlayanları, city id lerine göre tersten yazdır. 
select * from city
where city like 'A%'
order by city  desc;

-- Task05->  city_id  , city , country_ id yi yazdırın. Koşul olarak country_id si 50 den büyük olanları yazdırın.country id ile tersten sıralayın.
select city_id  , city , country_id
from city
where country_id>50
order by country_id  desc;

-- Task06->  city_id  , city , country_ id yi yazdırın. Koşul olarak country id si 20 ile 25 arasında olanları yazdır ve country id ye göre yazdır.
select city_id  , city , country_id
from city
where country_id between 20 and 25
order by country_id  desc;

-- Task07-> Bir Job_id içerisinde kaç kişi çalışıyor? Job id grubu oluşturarak yazalım.


-- Task08-> Yukarıdaki örneğe ek olarak, ismi T harfi ile biten job_id leri yazdırmasını isteyelim.