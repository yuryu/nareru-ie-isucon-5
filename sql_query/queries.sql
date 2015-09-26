create table user_salts as select users.id,users.account_name,users.nick_name,users.email,users.passhash,salts.salt from users INNER JOIN salts on users.id=salts.user_id;
