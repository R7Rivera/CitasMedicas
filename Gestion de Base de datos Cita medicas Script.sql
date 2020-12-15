CREATE TABLE public.paciente (
	Id_paciente integer NOT NULL,
	ced_paciente character(10),
	nomb_paciente character varying(30),
	ape_paciente character varying(30),
	direc_paciente character varying(50),
	telf_paciente character(10),
    fechaNaci_paciente date,
	genero_paciente varchar(1),
	peso_paciente numeric(4,2),
	email_paciente varchar(30),
	Alergias_Paciente varchar(30),
	CONSTRAINT paciente_pk PRIMARY KEY (Id_paciente)

);

CREATE TABLE public.medico (
	Id_medico integer NOT NULL,
	ced_medico character(10),
	nomb_medico character varying(30),
	ape_medico character varying(30),
	email_medico character varying(30),
	direc_medico character varying(50),
	telf_medico character(10),
	genero_medico varchar(1),
	id_categoria_categoria1 integer NOT NULL,
	CONSTRAINT medico_pk PRIMARY KEY (Id_medico)

);

CREATE TABLE public.categoria (
	id_categoria integer NOT NULL,
	tipo_categoria character varying(20),
	CONSTRAINT categoria_pk PRIMARY KEY (id_categoria)

);

CREATE TABLE public.pago (
	id_pago integer NOT NULL,
	estado_pago character varying(30),
	CONSTRAINT pago_pk PRIMARY KEY (id_pago)

);

CREATE TABLE public.cita_medica (
	id_cita integer NOT NULL,
	fecha_cita date,
	hora_cita character varying(10),
	area_cita character varying(30),
	estado_cita varchar(10),
	precio_cita numeric(4,2),
	medicamen_cita varchar(50),
	diagnositco_cita varchar(50),
	id_pago_pago integer NOT NULL,
	Id_medico_medico integer NOT NULL,
	Id_paciente_paciente integer NOT NULL,
	CONSTRAINT cita_medica_pk PRIMARY KEY (id_cita)

);

CREATE TABLE public.historial_clinico (
	id_historial integer NOT NULL,
	Id_paciente_paciente integer NOT NULL,
	CONSTRAINT historial_clinico_pk PRIMARY KEY (id_historial)

);

ALTER TABLE public.cita_medica ADD CONSTRAINT medico_fk FOREIGN KEY (Id_medico_medico)
REFERENCES public.medico (Id_medico) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.cita_medica ADD CONSTRAINT paciente_fk FOREIGN KEY (Id_paciente_paciente)
REFERENCES public.paciente (Id_paciente) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.historial_clinico ADD CONSTRAINT paciente_fk FOREIGN KEY (Id_paciente_paciente)
REFERENCES public.paciente (Id_paciente) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE public.medico ADD CONSTRAINT categoria_fk FOREIGN KEY (id_categoria_categoria1)
REFERENCES public.categoria (id_categoria) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE public.cita_medica ADD CONSTRAINT pago_fk FOREIGN KEY (id_pago_pago)
REFERENCES public.pago (id_pago) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;



INSERT INTO PAGO VALUES ('1','PAGADO');
INSERT INTO PAGO VALUES ('2','PENDIENTE');

INSERT INTO categoria VALUES ('1','Cardiología');
INSERT INTO categoria VALUES ('2','Pediátria');
INSERT INTO categoria VALUES ('3','Ginecología');
INSERT INTO categoria VALUES ('4','Medicina General');
INSERT INTO categoria VALUES ('5','Odontologia');


insert into PACIENTE values ('1','1314539485','ROSA GUADALUPE','RIVERA AlVARADO','calle 16 avenida 32',
							 '0980034395','2020/07/7','F','48.34','rosa@hotmail.com','Paracetamol');
							 


insert into PACIENTE values ('2','1304615055','FIAMA MARIA','DAVALOS PILOZO','Calle 12 avenida 13 ','0991337409',
							 '1993/05/20','F','58.02','fiama@hotmail.com','Ninguna');
							 
insert into PACIENTE values ('3','1308817673','BETSY YOLANDA','AZUA CASTILLO','Calle 106 avenida 108',
							 '0991337631',
							 '2012/7/8','F','40.00','azuab@hotmail.com','Amoxicilina');
							 
insert into PACIENTE values ('4','1303984809','BALTAZARA MERCHORA','PARRALES CHAVEZ','Avenida 4 de Noviembre(Paz)',
							'0991337662','1990/5/18','F','57.30','parrales@hotmail.com','ampicilina');
							 
insert into PACIENTE values ('5','1307924858','MARIA JESSENIA','BRAVO MACIAS','Barrio Porvenir','0991337428',
							 '2013/3/12','F','36.06','bravo@hotmail.com','Ninguna');
				 
							 
insert into PACIENTE values ('6','1303190985','BARBARA MARIA','PINARGOTE IBARRA','La Pradera,Manzana 1',
							 '0991345526','1970/2/2','F','66.06','Pinargote@hotmail.com','Anastecia local');
							 							 

insert into PACIENTE values ('7','1302013279','MONICA ELIZABETH','AVILA SALVATIERRA',
							 'Calle 15 ave 30 Santa Monica','0991361013','1970/4/8','F',
							 '56.02','Avila@hotmail.com','Ninguna');
							 
insert into PACIENTE values ('8','1303190986','PABLO WILMER','VERA LUCAS','Calle 12 ave 35 Santa Martha',
							 '0991361080',
							 '1980/6/2','M','80.2','Lucas@hotmail.com','Aspirina ');

insert into PACIENTE values ('9','1309041760','JORGE HUILTENVER','BALDA URDANIGO','Calle 15 ave 24','0991361595',
							 '2006/7/9','M','86.4','balda@hotmail.com','Ninguna');
							 
insert into PACIENTE values ('10','1303418535','JOSE FRANCISCO','PICO BALDA','Los Esteros Calle 104',
							 '0991361700','2011/7/9','M','48.5','fbalda@hotmail.com','Ninguna');
		 
insert into PACIENTE values ('11','1305393132','VICENTE SEBASTIAN','RUIZ CHEVEZ','La Campiña Manzana 8',
							 '0980155812','1993/1/2','M','70.8','cheves@hotmail.com','Paracetamol');
							 
insert into PACIENTE values ('12','1305600312',' CARLOS ENRIQUE','ARTEAGA CEDEÑO','Santa Clara,Cuba ',
							'0980155812', '1990/4/28','M','77.4','arteaga@hotmail.com',' Amoxicilina');
							 
insert into PACIENTE values ('13','1312575200','CARLOS SILVERIO','CAMPUZANO PINOARGOTE','Calle 17 ave 32',
							'0991364349', '1988/3/19','M', '68.4','pinargote@hotmail.com','Omeprazol');
							
insert into PACIENTE values ('14','1309752754','ONDINA OLIVIA','ZAMBRANO NEVAREZ','Barrio Jocay','0991365767',
							 '2010/5/6','F','48.3','zambrano@hotmail.com','Ninguna');


insert into medico values ('1','1314567393','GEMA BEATRIZ','OCHOA RAMIREZ',
'gema@hotmail.com','Malecón y calle 14','0992778119','F','4');


insert into medico values ('2','1306336916','PEDRO MARTIN','FLORES LUCAS','Pedro34@hotmail.com',
'Calle 1 avenida 14','0991244188','M','5'
);

insert into medico values ('3','1701120014','LUIS ALFONSO','TORRES TREJO','TLuis@hotmail.com',
						   'Calle 104 ave 109','0980184197','M','2');
						   
						   

insert into medico values ('4','1312442765','JESSICA ALEXANDRA','PONCE VARGAS','VargasJ@hotmail.com','Av 4 de Noviembre',
						   '0991253510','F','3');


insert into medico values ('5','1310063571','GEOVANNA ELOIZA','ROSAS ESCOBAR','REscobar@hotmail.com','Calle 119 ave 110',
                          '0991256714','F','4');

insert into medico values ('6','1301813786','MARCOS OSWALDO','CEVALLOS DELGADO','CevasM@hotmail.com','Calle 15 ave 32',
'0991259307','M','1');

insert into medico values ('7','1302146426',' JOSE RAMON','RENGIFO LOOR','Rloor@hotmail.com','Barrio 20 de Mayo',
'0991262467','M','1');


INSERT INTO Cita_Medica VALUES ('1','2020/12/20','12:00 AM',
							'Medicina General','pendiente','20.00','cefalosporinas,cefazolina',
								'Estafilococo aureus','1',
								'1','1');					
								
INSERT INTO Cita_Medica VALUES ('2','2020/05/2','9:00 AM',
							'Cardiologia','realizada','50.00','Diuréticos,Digoxina','Insuficiencia cardíaca','2'
								,'7','2');		
								
INSERT INTO Cita_Medica VALUES ('3','2020/12/22','9:00 AM',
							'Pediatria','pendiente','30.00','Antitusígenos,Expectorante','Tos Aguda','1','3','3');
													
INSERT INTO Cita_Medica VALUES ('4','2020/05/2','11:00 AM',
							'Medicina General','realizada','20.00','esomeprazol,omeprazol','Reflujo Gastroesofágico',
								'2','5','4');
													
INSERT INTO Cita_Medica VALUES ('5','2020/12/06','11:00 AM',
							'Pedriatria','pendiente','30.00','Descongestivos aerosol nasal','Sinusitis bacteriana','1','3','5');
							
						
INSERT INTO Cita_Medica VALUES ('6','2020/05/08','9:00 AM',
							'Cardiologia','realizada','50.00','Diuréticos de tiazida','Hipertensión','2','6','6');					
							
INSERT INTO Cita_Medica VALUES ('7','2020/05/9','9:00 AM',
							'Ginecologia','realizada','45.00','Terapia hormonal','Menopausia','1','4','7');
																			
INSERT INTO Cita_Medica VALUES ('8','2020/06/9','8:00 AM',
							'Odontologia','Realizada','35.00','Pasta dental que contengan flúor','Caries dental','2','2','8');
						
INSERT INTO Cita_Medica VALUES ('9','2020/06/9','10:00 AM',
							'Odontologia','suspendida','35.00','Angilepto','Gingivitis','1','2','9');

INSERT INTO Cita_Medica VALUES ('10','2020/06/10','8:00 AM',
							'Pediatria','realizada','30.00','trimoxazol,Ampicilina','gastroenteritis','1','3','10');

INSERT INTO Cita_Medica VALUES ('11','2020/06/10','8:00 AM',
							'Medicina General','suspendida','20.00','Azatioprina,Ciclosporina','1305393132','2','1','11');
							
INSERT INTO Cita_Medica VALUES ('12','2020/06/10','10:00 AM',
							'Medicina General','realizadas','20.00','Proto Glyvenol,Nikzon','Hemorroides','1','5','12');


INSERT INTO Cita_Medica VALUES ('13','2020/06/10','10:00 AM',
							'Cardiologia','realizada','50.00','Diuréticos de tiazida','Hipertensión','1','7','13');



INSERT INTO Cita_Medica VALUES ('14','2020/06/10','10:00 AM',
							'Pediatria','realizada','30.00','paracetamol,ibuprofeno','Resfriado común','1','3','14');









INSERT INTO Historial_Clinico VALUES ('1','1');
INSERT INTO Historial_Clinico VALUES ('2','2');
INSERT INTO Historial_Clinico VALUES ('3','3');
INSERT INTO Historial_Clinico VALUES ('4','4');
INSERT INTO Historial_Clinico VALUES ('5','5');
INSERT INTO Historial_Clinico VALUES ('6','6');
INSERT INTO Historial_Clinico VALUES ('7','7');
INSERT INTO Historial_Clinico VALUES ('8','8');
INSERT INTO Historial_Clinico VALUES ('9','9');
INSERT INTO Historial_Clinico VALUES ('10','10');
INSERT INTO Historial_Clinico VALUES ('11','11');
INSERT INTO Historial_Clinico VALUES ('12','12');
INSERT INTO Historial_Clinico VALUES ('13','13');
INSERT INTO Historial_Clinico VALUES ('14','14');







