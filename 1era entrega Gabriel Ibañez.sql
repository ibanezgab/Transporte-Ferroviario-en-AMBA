-- Created by Gabriel Ibanez
-- date: 2023-06-17 

-- tables
-- Table: PASSENGER

use proyecto_final_gabriel_ibanez;

CREATE TABLE passenger (
	anio INT not null,
    mon VARCHAR(10) NOT NULL,
	lin VARCHAR (50) NOT NULL,
    eki VARCHAR (50) NOT NULL,
    dist VARCHAR (50) NOT NULL,
    ticket INT,
	description varchar(200) NOT NULL,
    CONSTRAINT PK_PASSENGER PRIMARY KEY (anio,mon,eki)
   );
   
   -- Table: POPULATION
   
   CREATE TABLE population (
	anio INT not null,
    people VARCHAR(8) NOT NULL,
	state VARCHAR (50) NOT NULL,
    dist VARCHAR (50) NOT NULL,
	CONSTRAINT PK_POPULATION PRIMARY KEY (anio,dist)
   );
   
    -- Table: RAILWAY EQUIPMENT
      
	CREATE TABLE Railway_equipment(
	anio INT not null,
    mon VARCHAR(10) NOT NULL,
	lin VARCHAR (50) NOT NULL,
    loc int not null,
    coch_elec int not null,
    Coch_Mot int not null,
    Coch_Remol int not null,
    CONSTRAINT PK_RAILWAY_EQUIPMENT PRIMARY KEY (anio,mon,lin)
   );

 -- Table: DATA

	CREATE TABLE data(
    Eki VARCHAR(20) NOT NULL,
    lin VARCHAR (50) NOT NULL,
    ram VARCHAR(20) NOT NULL,
    Dist float,
    state VARCHAR(20) NOT NULL,
	mun VARCHAR(20) NOT NULL,
    Den VARCHAR(20) NOT NULL,
	loc VARCHAR(20) NOT NULL,
    Lat VARCHAR(10) NOT NULL,
    tro VARCHAR(10) NOT NULL,
    Longi VARCHAR(30) NOT NULL,
    CONSTRAINT PK_DATA PRIMARY KEY(eki)
   );
   
   -- Table: SERVICE
   
   	CREATE TABLE service(
   	anio INT not null,
    mon VARCHAR(10) NOT NULL,
	lin VARCHAR (50) NOT NULL,
    trapro int not null,
    tracan int not null,
    tracor int not null,
    trapun int not null,
    traatra int not null,
    CONSTRAINT PK_SERVICE PRIMARY KEY(anio,mon,lin)
   );
   
    -- Table: INFRAESTRUCTURE
   
	CREATE TABLE infraestructure(
   	anio INT not null,
    mon VARCHAR(10) NOT NULL,
	lin VARCHAR (50) NOT NULL,
	lvenet float,
	lvenea float,
	lveet float,
	lveea float,
	pavebm INT not null,
	paveba INT not null,
	pavebf INT not null,
	pavemsa INT not null,
	pavess INT not null,
	pavebn INT not null,
	paven INT not null,
	papebn INT not null,
	papesn INT not null,
	papean INT not null,
	seau float,
	sesiau float,
	sema float,
    CONSTRAINT PK_INFRAESTRUCTURE PRIMARY KEY(anio,mon,lin)
   );
     
     
-- foreign keys
-- Reference: FK__PASSENGER_EKI (table: PASSENGER)

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_EKI FOREIGN KEY FK__PASSENGER_EKI (eki)
REFERENCES data (eki);

-- Reference: FK__PASSENGER_RAILWAY_EQUIPMENT (table: PASSENGER)
    
ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_RAILWAY_EQUIPMENT FOREIGN KEY FK__PASSENGER_RAILWAY_EQUIPMENT (anio,mon,lin)
REFERENCES Railway_equipment (anio,mon,lin);

-- Reference: FK__PASSENGER_POPULATION (table: PASSENGER)

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_POPULATION FOREIGN KEY FK__PASSENGER_POPULATION(anio,dist)
REFERENCES population (anio,dist);

-- Reference: FK__PASSENGER_INFRAESTRUCTURE (table: PASSENGER)

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_INFRAESTRUCTURE FOREIGN KEY FK__PASSENGER_INFRAESTRUCTURE(anio,mon,lin)
REFERENCES infraestructure (anio,mon,lin);

-- Reference: FK__PASSENGER_SERVICE (table: PASSENGER)

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_SERVICE FOREIGN KEY FK__PASSENGER_SERVICE(anio,mon,lin)
REFERENCES service (anio,mon,lin);


