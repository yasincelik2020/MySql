CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(50) NOT NULL,
  City VARCHAR(50)
);
INSERT INTO Customer (CustomerID, CustomerName, City)
VALUES
  (1001, 'John Smith', 'New York'),
  (1002, 'Jane Doe', 'London'),
  (1003, 'Michael Lee', 'Paris'),
  (1004, 'Ashley Williams', 'Los Angeles'),
  (1005, 'David Miller', 'Chicago');
  
    CREATE TABLE Orders (
  OrderID INT PRIMARY KEY AUTO_INCREMENT,  -- Order ID with auto-increment
  CustomerID INT NOT NULL,  -- Foreign key referencing the Customer table
  OrderDate DATE NOT NULL,  -- Order date
  OrderAmount DECIMAL(10,2) NOT NULL,  -- Order amount
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)  -- Foreign key constraint
);
INSERT INTO Orders (CustomerID, OrderDate, OrderAmount)
VALUES
  (1001, '2024-05-17', 150.25),  -- Customer 1001, order on today's date with a specific amount
  (1002, '2024-05-16', 89.99),  -- Customer 1002, order on yesterday's date with a specific amount
  (1003, '2024-05-14', 35.70),  -- Customer 1003, order on two days ago with a specific amount
  (1004, '2024-05-15', 278.50),  -- Customer 1004, order on one day ago with a specific amount
  (1001, '2024-05-10', 99.00),  -- Customer 1001 (repeat), order on a previous date with a specific amount
  (1002, '2024-05-12', 121.45),  -- Customer 1002 (repeat), order on a previous date with a specific amount
  (1005, '2024-05-13', 42.10) ;-- Customer 1005 (new), order on a previous date with a specific amount;
  
  select * from customer;
  select * from orders;
  
  -- task1 müşterilerin isimlerini ve şehirlerini  tek satırda birleştirerek yazdırınız
  select concat(customerName,' : ', city) as isim_sehir
  from customer;
  
  -- task2 müsteri isimlerinin uzunluklarına göre sıralyınız
  select customerName, length(customerName) as isim_Uzunluk
  from customer
  order by length(customerName);
  
  -- task3 tablodaki müşteri ism ve soy isimleri A.A şeklinde başharflerini alara sıralayınız
-- 1.yol
SELECT 
    customername, concat(substring(CustomerName, 1, 1) , '.' , substring(substring(CustomerName, instr(CustomerName, ' ') + 1), 1, 1)) as BasHarfler
FROM 
    customer;
-- 2.Yol
select concat(left(substring_index(CustomerName,' ',1),1),'.',left(substring_index(CustomerName,' ',-1),1)) as sund
from customer;

-- 1. Her Müşterinin  Sipariş Tarihini ve Sipariş Miktarını Göster
select customername, orderdate, orderamount
from orders
left join customer
on customer.CustomerID=orders.CustomerID;

-- 2. Müşteriye göre son siperiş tarihini gösteriniz
select customername, max(orderdate)
from customer
left join orders
on customer.CustomerID=orders.CustomerID
group by CustomerName;

-- 3. Mayıs ayının 12'sinden Sonra Sipariş Veren Müşterileri ve Siparişlerini Göster
select customername, orders.*
from customer
left join orders
on customer.CustomerID=orders.CustomerID
where orderdate>'2024-05-12';

-- 4. Tüm müşterileri ve siparişlerini (varsa) listele:
select customer.CustomerName,customer.City, orders.*
from customer
left join orders
on customer.CustomerID=orders.CustomerID;

-- 5.New York şehrindeki müşterileri ve siparişlerini listele:
select customer.CustomerName,customer.City, orders.*
from customer
left join orders
on customer.CustomerID=orders.CustomerID
where customer.City='New York';

-- 6.Sipariş vermemiş müşterileri listele:
select customer.CustomerName,customer.City, orders.*
from orders
right join customer
on customer.CustomerID=orders.CustomerID
where orderID is null;

INSERT INTO Customer VALUES (1006, 'John Cash', 'New York');
  INSERT INTO Customer VALUES (1007, 'Asya Ash', 'New York');
   INSERT INTO Customer VALUES (1008, 'yusuf Cash', 'New York');
  INSERT INTO Customer VALUES (1009, 'bersah Ash', 'New York');

INSERT INTO Orders (CustomerID, OrderDate, OrderAmount) VALUES (1006, '2024-05-13', 52.10);
  INSERT INTO Orders(CustomerID, OrderDate, OrderAmount) VALUES (1007, '2024-05-13', 82.10);
  INSERT INTO Orders(CustomerID, OrderDate, OrderAmount) VALUES (1007, '2024-05-14', 78.70);
  INSERT INTO Orders(CustomerID, OrderDate, OrderAmount) VALUES (1007, '2024-05-14', 78.70);
  
  -- 7. Her şehre göre müşterilerinin adlarını ve şehrin toplam sipariş tutarını hesapla:
select city, group_concat(CustomerName separator' , ') as siparis_verenler, sum(OrderAmount) siparis_tutari
from orders
left join customer
on customer.CustomerID=orders.CustomerID
group by City;



-- 8. 1003 numaralı müşterinin siparişlerini veya aynı tarihte sipariş veren diğer müşterilerin bilgilerini listele:
select customer.CustomerName,customer.City, orders.*
from customer
right join orders
on customer.CustomerID=orders.CustomerID
where customer.CustomerID='1003';
  
  
  