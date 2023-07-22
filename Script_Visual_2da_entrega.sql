/*vista de trenes demorados en las lineas Belgrano y Mitre por año*/

create or replace view trenes_demorados_anio_BelgranoYMitre as 
(select year, delay_train,line from service
where line = 'belgrano norte' or line = 'Mitre' );

select * from trenes_demorados_anio_BelgranoYMitre;

/*ticket vendidos por estaciòn por año en Vicente Lopez*/

create or replace view ticket_vendidos_estacion_anio_VL as 
(select year, ticket 
from passenger p join data d on (p.eki = d.eki)
where d.district like '%vicente lopez%');

select * from ticket_vendidos_estacion_anio_VL;

/*Pasos bajos a nivel por año en las lineas Belgrano y Mitre */

create or replace view Paso_bajo_nivel_BelYMit as 
(select year, line, month, cross_under
from infrastructure
where line = 'belgrano norte' or line = 'Mitre' );

select * from Paso_bajo_nivel_BelYMit;

/*Poblaciòn de Vicente Lopez por año y boletos vendidos*/

create or replace view poblacion_VL_anio_boletos_vend as 
(select p.ticket,p.month ,p.year,z.people
from passenger p join population z on (p.year like z.year)
where z.district like '%vicente lopez%');

select * from poblacion_VL_anio_boletos_vend;

/*trenes por año en el Belgrano y Mitre*/

create or replace view tren_x_anio_BelYMit as 
(select year, month, line ,motor_train,elec_train 
from railway_equipment 
where line = 'belgrano norte' or line = 'Mitre' );

select * from tren_x_anio_BelYMit;




