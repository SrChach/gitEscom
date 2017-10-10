create table cliente(
	idCliente int unsigned not null primary key auto_increment,
	nombre varchar(25),
	apPat varchar(20),
	apMat varchar(20),
	rfc varchar(30),
	sexo char,
	telefono varchar(20),
	credito float,
	deuda float,
	pais varchar(25),
	estado varchar(25),
	delegacion varchar(25),
	colonia varchar(25),
	calle varchar(25),
	numExt int,
	numInt int,
	CodPostal varchar(25),
	fechaNac date,
	correo varchar(50),
	fechaAlta date
);

insert into cliente (nombre, apPat, apMat, rfc, sexo, telefono, credito, deuda, fechaNac, correo, fechaAlta, pais, estado, delegacion, colonia, calle, numExt, numInt, CodPostal)	values 
	('Ana', 'Martinez', 'Villarreal', 'rfc', 'F', '1728394650', 1200.00, 500.00, '2005/05/09', '1@hotmail.com', '2000/01/01', 'Mexico', 'DF', 'Coyoacan', 'roma', 'calle', 13, 1, '42700'),
	('Annette', 'Juarez', 'Gomez', 'rfc', 'F', '1928406342', 900.00, 150.00, '2003/10/10', '2@hotmail.com', '2000/01/01', 'Mexico', 'DF', 'iztacalco', 'jupiter', 'calle', 04, 2, '42700'),
	('Brigitte', 'Grey', 'Corona', 'rfc', 'F', '1526378461', 1200.00, 0.00, '1997/04/12', '3@hotmail.com', '2000/01/01', 'Mexico', 'DF', 'GAM', 'saturno', 'calle', 08, 1, '42700'),
	('Cristian Alejandro', 'Gonzalez', 'Aguilar', 'rfc', 'M', '09493847568', 900.00, 600.00, '1990/07/10', '4@hotmail.com', '2000/01/01', 'Mexico', 'DF', 'iztacalco', 'roma', 'calle', 09, 2, '42700'),
	('Catalina', 'Bautista', 'Arredondo', 'rfc', 'F', '7485965342', 1200.00, 450.00, '1998/09/09', '5@hotmail.com', '2000/01/01', 'Mexico', 'DF', 'cuauhtemoc', 'saturno', 'calle', 45, 1, '42700'),
	('Cesar', 'Caballero', 'Cruz', 'rfc', 'M', '0926354874', 4000.00, 4000.00, '1999/02/04', '6@hotmail.com', '2000/01/01', 'Mexico', 'DF', 'Coyoacan', 'jupiter', 'calle', 76, 2, '42700'),
	('Dante', 'Jimenez', 'Prieto', 'rfc', 'M', '9872536478', 1200.00, 100.00, '1993/03/01', '7@hotmail.com', '2000/01/01', 'Mexico', 'DF', 'cuauhtemoc', 'saturno', 'calle', 02, 1, '42700'),
	('Elizabeth', 'Rodriguez', 'de la Torre', 'rfc', 'F', '4466772288', 4000.00, 67.00, '1991/01/01', '8@hotmail.com', '2000/01/01', 'Mexico', 'DF', 'atzcapozalco', 'jupiter', 'calle', 11, 1, '42700'),
	('Edgar', 'Catalan', 'Salgado', 'rfc', 'M', '7733664499', 1200.00, 1200.00, '1993/12/12', '9@hotmail.com', '2000/01/01', 'Mexico', 'DF', 'iztacalco', 'roma', 'calle', 33, 2, '42700'),
	('Flor', 'Alamilla', 'de la O', 'rfc', 'F', '1122334455', 900.00, 10.00, '1997/07/07', '10@hotmail.com', '2000/01/01','Mexico', 'DF', 'atzcapozalco', 'pluton', 'calle', 66, 2, '42700');

/*Consulta1*/
/*Consulta2*/
/*Consulta3*/
select nombre, date_format(current_date, "%Y") - date_format(fechaAlta, "%Y") as antiguedad from cliente;

/*Consulta4*/
/*Consulta5*/
/*Consulta6*/
select nombre, date_add(current_date, interval 1 month) as "mes+1" from cliente;

/*Consulta7*/
/*Consulta8*/
/*Consulta9*/
select concat(nombre, " ", apPat, " se dio de alta el ", date_format(fechaAlta, "%W %d %m %Y")) from cliente where nombre="Edgar";

/*Consulta10*/
/*Consulta11*/
/*Consulta12*/
select concat(nombre, " ", apPat) as "Clientes que se han registrado en enero" from cliente where date_format(fechaAlta, "%m")=12;

/*Consulta13*/
/*Consulta14*/
/*Consulta15*/
select concat(nombre, " ", apPat) as "Hoy cumple años" from cliente where date_format(fechaNac, "%d %m")=date_format(now(), "%d %m");

/*Consulta16*/
/*Consulta17*/
/*Consulta18*/
select concat("Estimado cliente ", nombre, " ", apPat, " le recordamos que el dia de hoy ", date_format(now, "%d %m %Y "), "usted nos debe ", deuda, ". Le ofrecemos la posibilidad de pagar a "