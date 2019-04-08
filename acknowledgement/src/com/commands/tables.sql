
  create table login
  (uname varchar(20), pwd varchar(20));
  
  insert into login values('Tom', 'jerry21');


  create table userdetail
  (ticketno number(5) primary key, name varchar(30), gender varchar(10), age number(5), allergy varchar(30), bgroup varchar(10), treatment varchar(30), email varchar(50), contact number(12), description varchar(200));

  create table ticket_status
  (id number(5) primary key, details varchar(100), status varchar(20));
  
  create table ack
  (id number(5) primary key, acknow varchar(100));
  
  
  create sequence ticket_seq
  start with 1
  minvalue 0
  increment by 1;
  
  
  create trigger trg_ticket
  before insert on userdetail
  for each row
  begin
  select ticket_seq.nextval
  into :new.ticketno
  from dual;
  end;
  /
  
  
  create trigger trg_ticket_status
  before insert on ticket_status
  for each row
  begin
   select ticket_seq.currval
  into :new.id
  from dual;
  end;
  /
  
  create table doctor
    (id number(5) primary key, name varchar(20), special varchar(30), docstatus varchar(20));
    
    insert into doctor values(1,'Rashmi Mittal', 'Cardiovascular', 'Idle');
    insert into doctor values(2,'Rajeev Shukla', 'Neurological', 'Idle');
    insert into doctor values(3,'Balraj Gupta', 'Respiratory', 'Idle');
    insert into doctor values(4,'Ajay Bhansal','Cosmetic', 'Idle');
    insert into doctor values(5,'Sanjay Sood','Eye', 'Idle');
    insert into doctor values(6,'Iron Man', 'Cardiovascular', 'Idle');
    insert into doctor values(7,'Joker', 'Neurological', 'Idle');
    insert into doctor values(8,'Bane', 'Respiratory', 'Idle');
    insert into doctor values(9,'Scarecrow','Cosmetic', 'Idle');
    insert into doctor values(10,'Nick Fury','Eye', 'Idle');
  
  
  
  drop table userdetail;
  drop table ticket_status;
  drop table ack;
  drop table doctor;
  drop sequence ticket_seq;
  drop trigger trg_ticket;
  drop trigger trg_ticket_status;
  
  delete from ticket_status;
  delete from userdetail;
  
   
  
  
  
  
  
  
  
  