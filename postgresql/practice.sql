-- practice
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

create table order_items(
items_id int generated always as identity primary key,
order_id int,
p_id int,
quantity int,
foreign key (order_id) references orders(order_id),
foreign key (p_id) references products(p_id)
);



insert into products(pname,price) values
