select customer.CUS_ID, customer.CUS_NAME, customer.CUS_GENDER, ord.ord_amount from customer, `order` as ord
where customer.CUS_ID = ord.CUS_ID and ord.ORD_AMOUNT >= 3000 group by customer.CUS_ID;
