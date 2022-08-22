-- step1: get the rating details from the rating table
-- step2: get order details based on order_id
-- step3: get supplier_id from suppier_pricing table based on pricing_id
-- step4: get supplier data from supplier table based on supp_id
-- step5: calculate the average group by supp_id
-- step6: print required result based on the Average Rating

delimiter $$
CREATE PROCEDURE `displayService`()
BEGIN
	select supplier.SUPP_ID, supplier.SUPP_NAME, avg(table3.RAT_RATSTARS) as Average_Rating, 
    case when avg(table3.RAT_RATSTARS) = 5 then 'Excellent Service'
    when avg(table3.RAT_RATSTARS) > 4 then 'Good Service'
    when avg(table3.RAT_RATSTARS) > 2 then 'Average Service'
    else 'Poor Service'
    end as 'Type Of Service'
    from supplier
	join
	(
		select sp.SUPP_ID, table2.* from supplier_pricing sp
		join 
		(
			select ord.*, table1.RAT_RATSTARS from `order` ord
			join
				(select * from rating) as table1 where ord.ord_id = table1.ORD_ID
		) as table2 where sp.PRICING_ID = table2.PRICING_ID order by supp_id
	) as table3 where supplier.SUPP_ID = table3.SUPP_ID group by supplier.SUPP_ID order by supp_id;
END