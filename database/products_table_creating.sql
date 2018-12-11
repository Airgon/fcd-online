CREATE TABLE products(
	plu integer PRIMARY KEY,
	article char(20),
	name char(45),
	distribution_type smallint(1),
	quantity float,
	barcode integer,
	purchase_price float,
	retail_price float,
	discount float
);
