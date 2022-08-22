select * from supplier where supplier.Supp_ID in 
(
	select supplier_pricing.Supp_ID from supplier_pricing 
	group by supplier_pricing.Supp_ID having count(distinct(supplier_pricing.pro_id)) > 1
);
