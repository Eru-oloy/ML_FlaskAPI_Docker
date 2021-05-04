

--Creation des tables

CREATE TABLE TRANSACTIONS(
		date_TR		DATE,
		order_id  VARCHAR(20),
		client_id VARCHAR(20),
		prod_id  VARCHAR(20),
		prod_price FLOAT(8,2),
		prod_qty int(10)
);

CREATE TABLE PRODUCT_NOMENCLATURE(
		prod_id  VARCHAR(20) PRIMARY KEY,
		prod_type  VARCHAR(20),
		prod_name  VARCHAR(20)
);


--INSERTION

INSERT INTO TRANSACTIONS (date_TR, order_id, client_id, prod_id, prod_price, prod_qty) 
VALUES ('2020-01-01', '1234', '999', '490756', 50, 1), 
('2020-01-01', '1234', '999', '389728', 3.56, 4), 
('2020-01-01', '3456', '845', '490756', 50, 2), 
('2020-01-01', '3456', '845', '549380', 300, 1),
 ('2020-01-01', '3456', '845', '293718', 10, 6);
 
 INSERT INTO PRODUCT_NOMENCLATURE (prod_id, prod_type, prod_name)
 VALUES ('490756', 'MEUBLE', 'Chaise'), 
 ('389728', 'DECO', 'Boule de Noël'), 
 ('549380', 'MEUBLE', 'Canapé'), 
 ('293718', 'DECO', 'Mug');
 
 
--QUESTION 1

SELECT date_TR , SUM(prod_price*prod_qty) AS CA
FROM TRANSACTIONS
GROUP BY date_TR
HAVING strftime('%Y', date_TR) = '2019'
ORDER BY date_TR;


--QUESTION 2

select X.client_id, CA_deco, CA_meuble 
from 
(select client_id, SUM(prod_price*prod_qty)as CA_deco 
 from TRANSACTIONS 
 join (select * from PRODUCT_NOMENCLATURE where prod_type='DECO') d 
 on d.prod_id = TRANSACTIONS.prod_id 
 group by client_id HAVING strftime('%Y', date_TR) = '2019') X 
join 
(select client_id, SUM(prod_price*prod_qty) as CA_meuble 
 from 
 TRANSACTIONS 
 join (select * from PRODUCT_NOMENCLATURE where prod_type='MEUBLE') m 
 on m.prod_id = TRANSACTIONS.prod_id 
 group by client_id HAVING strftime('%Y', date_TR) = '2019') Y 
on X.client_id=Y.client_id ;
