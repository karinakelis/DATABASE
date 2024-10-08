CREATE TABLE Warehouse (
  code INTEGER PRIMARY KEY,
  location VARCHAR(255) NOT NULL,
  capacity INTEGER NOT NULL
);

CREATE TABLE Boxes (
  code CHAR(4) PRIMARY KEY,
  contents VARCHAR(255) NOT NULL,
  value REAL NOT NULL,
  warehouse INTEGER NOT NULL, 
  FOREIGN KEY (warehouse) REFERENCES Warehouse(code) 
);


INSERT INTO Warehouse(code, location, capacity) VALUES (1, 'Chicago', 3);
INSERT INTO Warehouse(code, location, capacity) VALUES (2, 'Chicago', 4);
INSERT INTO Warehouse(code, location, capacity) VALUES (3, 'New York', 7);
INSERT INTO Warehouse(code, location, capacity) VALUES (4, 'Los Angeles', 2);
INSERT INTO Warehouse(code, location, capacity) VALUES (5, 'San Francisco', 8);

INSERT INTO Boxes(code, contents, value, warehouse) VALUES('0MN7', 'Rocks', 180, 3);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('4H8P', 'Rocks', 250, 1);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('4RT3', 'Scissors', 190, 4);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('7G3H', 'Rocks', 200, 1);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('8JN6', 'Papers', 75, 1);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('8Y6U', 'Papers', 50, 3);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('9J6F', 'Papers', 175, 2);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('LL08', 'Rocks', 140, 4);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('P0H6', 'Scissors', 125, 1);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('P2T6', 'Scissors', 150, 2);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES('TU55', 'Papers', 90, 5);


select * from Warehouse;
select * from Boxes;
select * from Boxes where value > 150;

select dictinct contents from Boxes;

select warehouses, count(code) as box_numb
from Boxes group by warehouses having count(code)>2;

insert into Warehouses (code,location,capacity) values (6,"London",9);
insert into Boxes(code,contents,value,warehouse) values ("8UIO","paper",89.7);

update Boxes set value = value * 0.85
where code = (
select code from Boxes
order by value desc
limit 1 offset 2
);

delete from boxes where value < 150;

delete from Boxes using Warehouses 
where Boxes.warehouse = Warehouses.code
and Warehouses.location = 'London'
returning Boxes*;









