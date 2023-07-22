use  new_proy_fin_gabriel_ibanez;

DELIMITER //
CREATE FUNCTION `total_boletos_vendidos_año` (year2 int) RETURNS int
no sql
BEGIN
    DECLARE resultado INT;
    SET resultado = (select sum(ticket) from passenger where year = year2);
    RETURN resultado;
END//

select  total_Boletos_vendidos_año (2010);


DELIMITER //
CREATE FUNCTION `Retrasos_x_linea_x_año` (year2 int,line2 char(50)) RETURNS int
deterministic
BEGIN
    DECLARE resultado INT;
	SET resultado = (select sum(delay_train) from service where year = year2 and line = line2);
    RETURN resultado;
END//

select  Retrasos_x_linea_X_año(2010,'Belgrano Norte')

