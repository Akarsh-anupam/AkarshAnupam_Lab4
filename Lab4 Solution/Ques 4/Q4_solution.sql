select ord.*, product.PRO_NAME 
from `order-directory`.`order` as ord, supplier_pricing, product
where ord.CUS_ID = 2 and ord.PRICING_ID = supplier_pricing.PRICING_ID 
and supplier_pricing.PRO_ID = product.PRO_ID;
