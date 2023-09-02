use proyecto_final;

-- ordenar de forma ascendente y descendente de una columna de la tabla data--

DELIMITER //
CREATE PROCEDURE get_data_orderby(in g_data varchar(200), in s_sort varchar(4))
BEGIN
	 SET @consulta = concat( 'SELECT * FROM DATA ORDER BY', g_data, ' ',s_sort);
     PREPARE consulta from @consulta;
     EXECUTE consulta;
end
//

call get_data_orderby(' eki', 'desc');
call get_data_orderby(' district', 'asc');

-- eliminar o insertar registros en la tabla data con validaciòn de campo/s de ingreso--

DELIMITER //
CREATE PROCEDURE insert_or_delete_data(
in s_eki varchar(50), 
in l_line varchar(8), 
in d_distance int, 
in s_state varchar(20),
 in m_district varchar(20), 
 in t_type varchar(20), 
 in l_lat varchar(10), 
 in l_longi varchar (30),
 in g_gauge varchar(10)
 )
begin
if s_eki = '' or l_line = '' or d_distance is null or s_state = '' or m_district = '' or t_type = '' or l_lat = '' or l_longi = '' or g_gauge = '' then
select 'error, el campo o los campos no pueden estar vacio/s';
else
if exists(select eki from data where eki=s_eki)
then
delete from data where eki=s_eki;
else
insert into data (eki,line,distance,state,district,type,lat,longi,gauge) values (s_eki,l_line,d_distance,s_state,m_district,t_type,l_lat,l_longi,g_gauge);
end if;
select eki,line,distance,state,district,type,lat,longi,gauge from data;
end if;
end
//

select * from data;

call insert_or_delete_data('Tigre', 'Mitre',50,'Buenos Aires','Tigre','Estaciòn','-34,537979','-58,478379','1600m');

call insert_or_delete_data('Tigre', 'Mitre',50,'Buenos Aires','Tigre','Estaciòn','-34,537979','-58,478379','1600m');





