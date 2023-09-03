create database SocialNetwork;

CREATE TABLE SocialNetwork.users
(
first_name varchar(15) not null,
last_name varchar(15) not null,
email varchar(30) not null,
sex char(1), # M,F,N
account_id integer(10), # Backend infomation for database  
home_address varchar(40) not null,
state varchar(10) not null,
city varchar(15) not null,
zipcode integer(15),
PRIMARY KEY (account_id)
);

CREATE TABLE SocialNetwork.user_interface
(
username varchar(20) not null,
login_password varchar(25) not null,
likes integer(6), # Max 999,999 likes then turns into 1.0M
number_friends integer(6) not null,
post_location varchar(25) not null,
PRIMARY KEY (username)
);

CREATE TABLE SocialNetwork.user_interface_connector 
(
username varchar(20) not null,
account_id integer(10), # FROM user
FOREIGN KEY (account_id) REFERENCES SocialNetwork.users(account_id),
FOREIGN KEY (username) REFERENCES SocialNetwork.user_interface(username)
);

CREATE TABLE SocialNetwork.ads 
(
ad_type varchar(10) not null, # Video or image
product varchar(25) not null, # car parts or tech parts
ad_company varchar(15) not null, # Tesla or Amazon 
account_id_ads varchar(10),
PRIMARY KEY (account_id_ads)
);

CREATE TABLE SocialNetwork.ads_connector 
(
account_id integer(10), # FROM user
account_id_ads varchar(10),
FOREIGN KEY (account_id) REFERENCES SocialNetwork.users(account_id),
FOREIGN KEY (account_id_ads) REFERENCES SocialNetwork.ads(account_id_ads)
);

CREATE TABLE SocialNetwork.ad_revenue
(
ad_client_num integer(10) not null, # backend info to save about job
revenue integer(6) not null, # money made 
cost_per_ad integer(6) not null, # cost per ad
num_ads integer(6) not null, # number of ads
time_running integer (6) not null, # months or a day
PRIMARY KEY (ad_client_num)
);

CREATE TABLE SocialNetwork.ad_revenue_connector
(
account_id integer(10), # FROM user
ad_client_num integer(10) not null,
FOREIGN KEY (account_id) REFERENCES SocialNetwork.users(account_id),
FOREIGN KEY (ad_client_num) REFERENCES SocialNetwork.ad_revenue(ad_client_num)
);

CREATE TABLE SocialNetwork.third_party_accounts
(
third_party_login_username varchar(20) not null,
third_party_login_password integer(10) not null,
third_party_service varchar(10) not null,
login_password varchar(25),
PRIMARY KEY (third_party_login_username)
);
CREATE TABLE SocialNetwork.third_party_accounts_connector 
(
account_id integer(10), # FROM user
third_party_login_username varchar(20) not null,
FOREIGN KEY (account_id) REFERENCES SocialNetwork.users(account_id),
FOREIGN KEY (third_party_login_username) REFERENCES SocialNetwork.third_party_accounts(third_party_login_username)
);


# Set SCHEMA as default or code won't insert data 
INSERT INTO users 
VALUES
(first_name, last_name, email, sex,account_id,home_address, state, city, zipcode) ,
('Brayan', 'Villatoro ', 'brayan@jjay.com', 'M','872361','Cliff Ave','NY', 'Glen Cove', 11541),
('Emily', 'Ford', 'NotFord@gmail.co.uk', 'F', '986231','Sees Ave','NY', 'Glen Cove', 11542),
('Kyle', 'Banks', 'KBanks@gmail.co.uk', 'M', '523351','Glen st','FL', 'Buck', 11543),
('Lisa', 'Bakes', 'BakesL@gmail.co.uk', 'F', '623561','Sheesh rd','TX', 'Dallas', 11544);
SELECT * FROM users;

# DELETE FUNCTION 
DELETE FROM users WHERE zipcode between 11541 and 11542 ;
#SELECT * FROM users; 

# MODIFY FUNCTION 
UPDATE users SET zipcode = 21500; 
# SELECT * FROM users;

#Retrieve Ordered Data 
SELECT * FROM users ORDER BY account_id;


INSERT INTO user_interface  
VALUES 
(username,login_password, likes, number_friends,post_location),
('Brayan.tourdefrance','RedSocksSuck','12000', '89000','Long Island'),
('Dayana.swim','NewYorkIsExpensive','800', '1100','HElls Kitchen'),
('Tyan.baseball','DallasIsCool','999999', '9650000','Brooklyn'),
('max.cycle','NYYankeesSuck','1434', '2421','Queens');
SELECT * FROM user_interface;

# DELETE FUNCTION 
DELETE FROM user_interface WHERE likes between 150000 and 600000;
#SELECT * FROM user_interface; 

# MODIFY FUNCTION 
UPDATE user_interface SET likes = 999999; 
# SELECT * FROM user_interface;

#Retrieve Ordered Data 
SELECT * FROM user_interface ORDER BY likes;

INSERT INTO ads
VALUES 
(ad_type, product, ad_company,account_id_ads), 
('video', 'iphone','apple','Apple corp.'),
('image', 'iphone repair tool','Fixit','Fixit Tools'),
('video', 'pop-os laptop','system72','Linux Rules'),
('image', 'andriod phone','samsung','Samsung corp.');
SELECT * FROM ads;

# DELETE FUNCTION 
DELETE FROM ads WHERE product = 'iphone';
#SELECT * FROM ads; 

# MODIFY FUNCTION 
UPDATE ads SET ad_type = 'video'; 
# SELECT * FROM ads;

INSERT INTO ad_revenue  
VALUES 
(ad_client_num, revenue, cost_per_ad,num_ads,time_running),
( '956207', '3600', '6.00','600','2'),
( '846719', '18750', '1.25','15000','5'),
( '506218', '3075', '10.25','300','1'),
( '134627', '4050', '4.50','900','4');
SELECT * FROM ad_revenue;

# DELETE FUNCTION 
DELETE FROM ad_revenue WHERE num_ads between 0 and 1000;
#SELECT * FROM ad_revenue; 

#Retrieve Ordered Data RUN BEFORE CHANING COST PER AD
SELECT * FROM ad_revenue ORDER BY cost_per_ad;

# MODIFY FUNCTION 
UPDATE ad_revenue SET cost_per_ad = 14.50; 
# SELECT * FROM ad_revenue;

INSERT INTO third_party_accounts
VALUES
(third_party_login_username,third_party_login_password,third_party_service,login_password),
('BrayanSoccer','5345345','Instagram','examplepwd');
#'simp_car','5425435','Snapchat,'FDwww'),
#('solar9','98345','VSCO','sswordthree'),
#('kylefoot','7645435','Twitter','siswordone');

SELECT * FROM third_party_accounts;

# DELETE FUNCTION 
DELETE FROM third_party_accounts WHERE login_password = 'examplepwd';
#SELECT * FROM third_party_accounts; 

# MODIFY FUNCTION RUN BEFORE DELETE TO SEE THAT IT WORKS BUT THEN DELETE WONT WORK SINCE THE NEW PASSWORD WONT MATCH WITH THE DELETE COMMEND
UPDATE third_party_accounts SET login_password = 'admin'; 
# SELECT * FROM third_party_accounts;