-- Created by Gabriel Ibanez
-- date: 2023-08-27 

-- tables
-- Table: PASSENGER

use proyecto_final;

CREATE TABLE passenger (
	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
    eki VARCHAR (50) NOT NULL,
    district VARCHAR (50) NOT NULL,
    ticket INT,
	CONSTRAINT PK_PASSENGER PRIMARY KEY (year,month,eki)
   );
   
   -- Table: POPULATION
   
   CREATE TABLE population (
	year INT not null,
    people VARCHAR(8) NOT NULL,
	state VARCHAR (50) NOT NULL,
    district VARCHAR (50) NOT NULL,
	CONSTRAINT PK_POPULATION PRIMARY KEY (year,district)
   );
   
    -- Table: RAILWAY EQUIPMENT
      
	CREATE TABLE Railway_equipment(
	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
    locomotive int not null,
    elec_train int not null,
    motor_train int not null,
    towed_train int not null,
    CONSTRAINT PK_RAILWAY_EQUIPMENT PRIMARY KEY (year,month,line)
   );

 -- Table: DATA

	CREATE TABLE data(
    eki VARCHAR(30) NOT NULL,
    line VARCHAR (50) NOT NULL,
	distance int,
    state VARCHAR(20) NOT NULL,
	district VARCHAR(20) NOT NULL,
    type VARCHAR(20) NOT NULL,
	loc VARCHAR(20) NOT NULL,
	longi VARCHAR(30) NOT NULL,
	gauge VARCHAR(10) NOT NULL,
    CONSTRAINT PK_DATA PRIMARY KEY(eki)
   );
   
   -- Table: SERVICE
   
   	CREATE TABLE service(
   	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
    schedule_train int not null,
    cancel_train int not null,
    running_train int not null,
    on_time_train int not null,
    delay_train int not null,
    CONSTRAINT PK_SERVICE PRIMARY KEY(year,month,line)
   );
   
    -- Table: INFRAESTRUCTURE
   
	CREATE TABLE infrastructure(
   	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
	non_Electr int,
	electr int,
	auto_sign int,
	without_sign int,
    man_sign INT not null,
	cross_on INT not null,
	cross_under INT not null,
    CONSTRAINT PK_INFRAESTRUCTURE PRIMARY KEY(year,month,line)
   );
   
CREATE TABLE tren_de_la_costa (
	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
    eki VARCHAR (50) NOT NULL,
    district VARCHAR (50) NOT NULL,
    ticket INT,
	CONSTRAINT PK_TREN_DE_LA_COSTA PRIMARY KEY (year,month,eki)
   );
   
   CREATE TABLE subway (
	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
    ticket INT,
	CONSTRAINT PK_SUBWAY PRIMARY KEY (year,month,line)
   );
   
CREATE TABLE tren_del_este (
	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
	ticket INT,
	CONSTRAINT PK_TREN_DEL_ESTE PRIMARY KEY (year,month)
   );
   
   CREATE TABLE ticket_cost (
	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
	ticket_cost INT,
	CONSTRAINT PK_TICKET_COST PRIMARY KEY (year,month,line)
   );
   
	CREATE TABLE subsidie (
	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
	amount INT,
	CONSTRAINT PK_SUBSIDIES PRIMARY KEY (year,month,line)
   );
   
	CREATE TABLE subway_station (
	year INT not null,
    month VARCHAR(10) NOT NULL,
	line VARCHAR (50) NOT NULL,
    quantity int not null,
    CONSTRAINT PK_SUBWAY_STATION PRIMARY KEY (year,month,line)
   );
   
   	CREATE TABLE bus (
	year INT not null,
    month VARCHAR(10) NOT NULL,
    line VARCHAR (50) NOT NULL,
	ticket INT,
    CONSTRAINT PK_BUS PRIMARY KEY (year,month)
   );
   
      
-- foreign keys
-- Reference: FK__PASSENGER_EKI (table: PASSENGER)

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_EKI FOREIGN KEY FK__PASSENGER_EKI (eki)
REFERENCES data (eki);

-- Reference: FK__PASSENGER_RAILWAY_EQUIPMENT (table: PASSENGER)
    
ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_RAILWAY_EQUIPMENT FOREIGN KEY FK__PASSENGER_RAILWAY_EQUIPMENT (year,month,line)
REFERENCES Railway_equipment (year,month,line);

-- Reference: FK__PASSENGER_POPULATION (table: PASSENGER)

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_POPULATION FOREIGN KEY FK__PASSENGER_POPULATION(year,district)
REFERENCES population (year,district);

-- Reference: FK__PASSENGER_INFRAESTRUCTURE (table: PASSENGER)

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_INFRASTRUCTURE FOREIGN KEY FK__PASSENGER_INFRASTRUCTURE(year,month,line)
REFERENCES infrastructure (year,month,line);

-- Reference: FK__PASSENGER_SERVICE (table: PASSENGER)

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_SERVICE FOREIGN KEY FK__PASSENGER_SERVICE(year,month,line)
REFERENCES service (year,month,line);

-- Reference: FK__SUBSIDIES_PASSENGER (table: SUBSIDIES)

ALTER TABLE SUBSIDIES ADD CONSTRAINT FK__SUBSIDIES_PASSENGER FOREIGN KEY FK__SUBSIDIES_PASSENGER(year,month,line)
REFERENCES passenger (year,month,line);

-- Reference: FK__TREN_DE_LA_COSTA_SUBSIDIES (table: TREN_DE_LA_COSTA )

ALTER TABLE TREN_DE_LA_COSTA ADD CONSTRAINT FK__TREN_DE_LA_COSTA_SUBSIDIES FOREIGN KEY FK__TREN_DE_LA_COSTA_SUBSIDIES (year,month,line)
REFERENCES subsidies (year,month,line);

-- Reference: FK_BUS_SUBSIDIES (table: BUS )

ALTER TABLE BUS ADD CONSTRAINT FK__BUS_SUBSIDIES FOREIGN KEY FK__BUS_SUBSIDIES (year,month,line)
REFERENCES subsidies (year,month,line);

-- Reference: FK_TREN_DEL_ESTE_SUBSIDIES (table: TREN_DEL_ESTE)

ALTER TABLE TREN_DEL_ESTE ADD CONSTRAINT FK_TREN_DEL_ESTE_SUBSIDIES FOREIGN KEY FK_TREN_DEL_ESTE_SUBSIDIES (year,month,line)
REFERENCES subsidies (year,month,line);

-- Reference: FK_SUBWAY_SUBSIDIES (table: SUBWAY)

ALTER TABLE SUBWAY ADD CONSTRAINT FK_SUBWAY_SUBSIDIES FOREIGN KEY FK_SUBWAY_SUBSIDIES (year,month,line)
REFERENCES subsidies (year,month,line);

-- Reference: FK_SUBWAY_STATION_SUBWAY (table: SUBWAY_STATION)

ALTER TABLE SUBWAY_STATION ADD CONSTRAINT FK_SUBWAY_STATION_SUBWAY FOREIGN KEY FK_SUBWAY_STATION_SUBWAY (year,month,line)
REFERENCES subway (year,month,line);

-- Reference: FK_TICKET_COST_PASSENGER (table: TICKET_COST)

ALTER TABLE TICKET_COST ADD CONSTRAINT FK_TICKET_COST_PASSENGER FOREIGN KEY FK_TICKET_COST_PASSENGER (year,month,line)
REFERENCES passenger (year,month,line);


show tables;
