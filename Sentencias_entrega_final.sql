--  usuario de lectura en todas las tablas  --

-- creacion de usuario  --
create user 'usuariolectura@proyecfinal.com' identified by '123abc'; 

-- creacion de usuario de lectura en todas las tablas de mi esquema --

grant select on proyecto_final.* to 'usuariolectura@proyecfinal.com';

-- check de permisos --
show grants for 'usuariolectura@proyecfinal.com';


--  usuario de lectura Inserción y Modificación en todas las tablas de mi esquema  --

-- creacion de usuario  --
create user 'usuario_cru@proyecfinal.com' identified by '123abc'; 

-- creacion de usuario lectura Inserción y Modificación en todas las tablas de mi esquema --

grant select,update,insert on proyecto_final.* to 'usuario_cru@proyecfinal.com';

-- check de permisos --
show grants for 'usuario_cru@proyecfinal.com';

