-- Created by Gabriel Ibanez
-- date: 2023-07-20 

-- tables
-- Table: PASSENGER

use new_proy_fin_gabriel_ibanez;

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

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_INFRAESTRUCTURE FOREIGN KEY FK__PASSENGER_INFRAESTRUCTURE(year,month,line)
REFERENCES infraestructure (year,month,line);

-- Reference: FK__PASSENGER_SERVICE (table: PASSENGER)

ALTER TABLE passenger ADD CONSTRAINT FK__PASSENGER_SERVICE FOREIGN KEY FK__PASSENGER_SERVICE(year,month,line)
REFERENCES service (year,month,line);


