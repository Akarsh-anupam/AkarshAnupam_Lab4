-- step1: get product detail along with min price from supplier_pricing table 
-- 	select pro_id, min(supp_price) from supplier_pricing group by pro_id

-- step2: get the product details from the product table and join with above table
-- 	select product.CAT_ID, product.PRO_NAME, table1.* from product
-- 		join (select pro_id, min(supp_price) from supplier_pricing group by pro_id) as table1 
-- 		where product.PRO_ID = table1.PRO_ID

-- step3: join the above table with category table to get the required result and group them using category_id
select category.CAT_NAME, table2.* from category
join
	(
		select product.CAT_ID, product.PRO_NAME, table1.* from product
		join (select pro_id, min(supp_price) from supplier_pricing group by pro_id) as table1 
		where product.PRO_ID = table1.PRO_ID
	) as table2
    where category.CAT_ID = table2.CAT_ID
group by category.CAT_ID order by category.CAT_ID;
