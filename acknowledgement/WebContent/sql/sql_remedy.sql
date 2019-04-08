
create table Status (id number(5) primary key, Details varchar(100), Status varchar(10));
Create table Ack (id number(5),  Acknowledgement varchar(100) , foreign key(id) references Status(id)); 
