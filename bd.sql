create table if not exists usuarios (
	id int auto_increment primary key,
    nombre varchar(100) not null,
    email varchar(100) not null,
    password_hash varchar(255) not null,
    role enum('user','admin') not null default 'user',
    two_factor_enabled tinyint(1) not null default 0,
    two_factor_method enum('totp','email') default 'totp',
    two_factor_secret varchar(255) null,
    two_factor_temp_secret varchar(255) null,
    created_at timestamp default current_timestamp
);

create table if not exists usuario_otps(
id int auto_increment primary key,
user_id int not null,
code_hash varchar(255) not null,
expires_at datetime not null,
used tinyint(1) default 0,
index(user_id)
);