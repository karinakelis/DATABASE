create database lab1;
create table lab1.clients(
    client_id INT GENERATED ALWAYS AS IDENTITY ,
    first_name VARCHAR(60),
    last_name VARCHAR(60),
    email VARCHAR(100),
    date_joined DATE,
    PRIMARY KEY (client_id)
);
alter table lab1.clients
add column status int;

alter table lab1.clients
alter column status type boolean;

alter table lab1.clients
alter column status set default true;

create table lab1.orders(
    order_id INT GENERATED ALWAYS AS IDENTITY,
    order_name VARCHAR(100),
    client_id INT,
    PRIMARY KEY (order_id),
    FOREIGN KEY (client_id) REFERENCES lab1.clients(client_id)
);

DROP TABLE lab1.orders;

DROP DATABASE lab1;