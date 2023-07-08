/*vista de trenes demorados en las lineas Belgrano y Mitre por año*/

create or replace view trendem_anio_BelgranoYMitre as 
(select anio, traatra,lin from service
where lin = 'belgrano norte' or lin = 'Mitre' );

/*ticket vendidos por estaciòn por año en Vicente Lopez*/

create or replace view ticket_vend_esta_anio_VL as 
(select anio, ticket 
from passenger p join data d on (p.eki = d.eki)
where d.mun like '%vicente lopez%');

/*Pasos bajos a nivel por año en las lineas Belgrano y Mitre */

create or replace view BajANiv_anio_BelYMit as 
(select anio, lin, pbj
from infrastructure
where lin = 'belgrano norte' or lin = 'Mitre' );

/*Poblaciòn de Vicente Lopez por año y boletos vendidos*/

create or replace view pob_vl_anio_bol as 
(select p.ticket,p.mon ,p.anio,z.people
from passenger p join population z on (p.anio like z.anio)
where z.dist like '%vicente lopez%');


/*trenes por año en el Belgrano y Mitre*/

create or replace view tren_anio_BelYMit as 
(select anio, mon, lin  
from railway_equipment 
where lin = 'belgrano norte' or lin = 'Mitre' );




