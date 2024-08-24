create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);

create table priorities(
  id_priority serial primary key,
  type_name varchar(50) not null  
);

create table contact_request(
  id_email varchar(50) primary key not null,
  id_country INTEGER NOT NULL,
  id_priority INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  detail VARCHAR(100) NOT NULL,
  physical_address VARCHAR(100) NOT NULL,
  foreign key (id_country) references countries (id_country),
  foreign key (id_priority) references priorities (id_priority)
);