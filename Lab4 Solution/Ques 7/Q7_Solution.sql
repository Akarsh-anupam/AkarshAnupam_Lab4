-- step1: get order details from order table ordered after 2021-10-05
-- 	select * from `order` ord where ord.ORD_DATE > '2021-10-05'

-- step2: get the product_id  from supplier pricing table by joining the above table on pricing id
-- select sp.PRO_ID, table1.* from supplier_pricing sp
-- 		join
-- 		(select * from `order` ord where ord.ORD_DATE > '2021-10-05') as table1
-- 		where sp.pricing_id = table1.PRICING_ID

-- step3: get product details from the product table using join on the above table

select product.PRO_ID, product.PRO_NAME from product
join
	(
		select sp.PRO_ID, table1.* from supplier_pricing sp
		join
		(select * from `order` ord where ord.ORD_DATE > '2021-10-05') as table1
		where sp.pricing_id = table1.PRICING_ID
	) as table2
where product.PRO_ID = table2.PRO_ID;
