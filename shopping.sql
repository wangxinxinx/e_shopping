DROP DATABASE IF EXISTS shopping;
CREATE DATABASE shopping
    CHARACTER SET 'utf8';
use shopping;

/*
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS shop;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS indent;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS bill;
*/

CREATE TABLE user(
uid char(14) PRIMARY KEY,
username varchar(100) UNIQUE NOT NULL,
password varchar(100) NOT NULL,
recv_name varchar(100) NOT NULL,
tel varchar(11) NOT NULL,
postcode varchar(6) NOT NULL,
address varchar(100) NOT NULL,
u_pic_path varchar(200) NOT NULL DEFAULT '/images/user/userdefault.jpg',
email varchar(30),
sex varchar(10) ,
birthday datetime,
u_money double(15,2) DEFAULT 0,
u_credit int DEFAULT 0,
reg_day datetime,

CHECK((tel LIKE '1[358][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') AND 
        (postcode LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]' ) AND
        (u_money>=0)AND
        (u_credit>=0))
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE shop(
sid char(14) PRIMARY KEY,
s_name varchar(100) UNIQUE NOT NULL,
s_desc varchar(300),
s_pic_path varchar(200) DEFAULT 'images/shop/shopdefault.jpg',
s_credit double(15,2) default 0,
s_reg_day datetime,
uid char(14),

FOREIGN KEY (uid) REFERENCES user(uid),
CHECK( s_credit>=0)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE product(
pid char(14) PRIMARY KEY,
p_name varchar(100) NOT NULL,
category varchar(10),
p_desc varchar(1000),
price double(15,2),
discount decimal(3,2),
p_pic_path varchar(200) DEFAULT 'images/product/productdefault.jpg',
create_day datetime,
salses int default 0,
p_credit int default 0,
sid char(14),

FOREIGN KEY (sid) REFERENCES shop(sid),
CHECK( (category='服装' OR category='家电' OR category='家具' OR category='数码' OR category='汽车' OR category='美食' OR category='学习' OR category='其它') AND
(price >=0) AND
        (discount>=0 AND discount <=1)AND
        (salses>=0))

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE indent(
iid char(14) PRIMARY KEY,
i_num int,
i_total_price double(15,2),
state varchar(20),
create_time datetime,
send_time datetime,
success_time datetime,
refund_time datetime,
cancel_time datetime,
pid char(14),
uid char(14),


FOREIGN KEY (pid) REFERENCES product(pid),
FOREIGN KEY (uid) REFERENCES user(uid),
CHECK( (state='待发货' OR state='已发货' OR state='交易成功' OR state='退款中' OR state='交易取消')AND
       (i_num>=0))

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE cart(
cid char(14) PRIMARY KEY,
c_num int,
c_total_price double(15,2),
pid char(14),
uid char(14),

FOREIGN KEY (pid) REFERENCES product(pid),
FOREIGN KEY (uid) REFERENCES user(uid),
CHECK (c_num>=0) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE bill(
bid char(14) PRIMARY KEY,
b_money double(15,2),
deal_type varchar(10),
remark varchar(300),
time datetime,
uid char(14),
deal_object char(14),

FOREIGN KEY (uid) REFERENCES user(uid) ,
CHECK (deal_type='充值' OR deal_type='转账' OR deal_type='收款' OR deal_type='购物' OR deal_type='货款' OR deal_type='退款')
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

delimiter |
CREATE TRIGGER updateShopCreditU
AFTER UPDATE ON product
FOR EACH ROW 
BEGIN
    UPDATE shop SET s_credit =(SELECT AVG(p_credit) FROM product WHERE product.sid=shop.sid);
END|

CREATE TRIGGER updateShopCreditD
AFTER DELETE ON product
FOR EACH ROW 
BEGIN
    UPDATE shop SET s_credit =(SELECT AVG(p_credit) FROM product WHERE product.sid=shop.sid);
END|

CREATE TRIGGER updateShopCreditI
AFTER INSERT ON product
FOR EACH ROW 
BEGIN
    UPDATE shop SET s_credit =(SELECT AVG(p_credit) FROM product WHERE product.sid=shop.sid);
END|
delimiter ;
insert into user(uid,username,password,recv_name,tel,address,postcode,email,sex,birthday,reg_day)
 values("U1212345434565","1","1","a","1234567","address","123456","","女","2013-02-21","2016-09-08 12:09:11");