use proyecto_final;

-- se crea tabla de log de la tabla passenger--

create table log_passenger (
id int auto_increment primary key,
year int(4),
month varchar(10),
line varchar(50),
eki varchar(50),
ticket int,
user_modify varchar(50),
date_modify date, 
time_modify time,
kind varchar(10),
tab_le varchar(10)
);

-- se crea el trigger asociado a la tabla passenger. La funciòn del mismo es el de enviar el registro borrado con el usuario que aplicò el cambios, la fecha y la hora de la modificaciòn --
-- Ademas agreguè el motivo del trigger (delete) y la tabla donde aplico el cambio --

delimiter //
create trigger `log_passenger_old`
before delete on `passenger`
for each row
begin
insert into log_passenger (year,month,line,eki,ticket,user_modify,date_modify,time_modify,kind,tab_le)
values(old.year,old.month,old.line,old.eki,old.ticket,user(),curdate(),current_time(),'DELETE','PASSENGER');
end //

-- test del trigger --

delete from passenger
where year = 2010 and month = 'Septiembre' and  eki = 'Retiro Belgrano Norte';

select * from passenger;
select * from log_passenger;

-- se crea el trigger asociado a la tabla passenger. La funciòn del mismo es el de enviar el registro actualizado con el usuario que aplicò el cambios, la fecha y la hora de la modificaciòn --
-- Ademas agreguè el motivo del trigger (update) y la tabla donde aplico el cambio --

delimiter //
create trigger `log_passenger_update`
after update on `passenger`
for each row
begin
insert into log_passenger (year,month,line,eki,ticket,user_modify,date_modify,time_modify,kind,tab_le)
values(new.year,new.month,new.line,old.eki,old.ticket,user(),curdate(),current_time(),'UPDATE','PASSENGER');
end //

-- test del trigger --

update passenger set 
district = '10'
where year = 2010 and month = 'Junio' and eki = 'Retiro Belgrano Norte'

select * from passenger;
select * from log_passenger;

-- se crea tabla de log de la tabla service--

create table log_service (
id int auto_increment primary key,
year int(4),
month varchar(10),
line varchar(50),
schedule_train int,		
cancel_train int,
running_train int,
on_time_train int,
delay_train int,
user_modify varchar(50),
date_modify date, 
time_modify time,
kind varchar(10),
tab_le varchar(10)
);

    
-- se crea el trigger asociado a la tabla service. La funciòn del mismo es el de enviar el registro borrado con el usuario que aplicò el cambios, la fecha y la hora de la modificaciòn --
-- Ademas agreguè el motivo del trigger (delete) y la tabla donde aplico el cambio --

delimiter //
create trigger `log_service_old`
before delete on `service`
for each row
begin
insert into log_service (year,month,line,schedule_train,cancel_train,running_train,on_time_train,delay_train,user_modify,date_modify,time_modify,kind,tab_le)
values(old.year,old.month,old.line,old.schedule_train,old.cancel_train,old.running_train,old.on_time_train,old.delay_train,user(),curdate(),current_time(),'DELETE','SERVICE');
end //

-- test del trigger --

delete from service
where year = 2010 and month = 'Abril' and  line = 'Belgrano norte';

select * from service;
select * from log_service;

-- se crea el trigger asociado a la tabla service. La funciòn del mismo es el de enviar el registro insertado con el usuario que aplicò el cambios, la fecha y la hora de la modificaciòn --
-- Ademas agreguè el motivo del trigger (delete) y la tabla donde aplico el cambio --

delimiter //
create trigger `log_service_insert`
after insert on `service`
for each row
begin
insert into log_service (year,month,line,schedule_train,cancel_train,running_train,on_time_train,delay_train,user_modify,date_modify,time_modify,kind,tab_le)
values(new.year,new.month,new.line,new.schedule_train,new.cancel_train,new.running_train,new.on_time_train,new.delay_train,user(),curdate(),current_time(),'INSERT','SERVICE');
end //

-- test del trigger --

insert into service
(year ,month ,line,schedule_train,cancel_train,running_train,on_time_train,delay_train)
values (2014, 'Mayo','Belgrano Norte',10,2,3,5,9);

select * from service;
select * from log_service;
