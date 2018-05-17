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
select date_format(now(), "%d de %M del %Y") as "fecha actual";

/*Consulta2*/
select date_format(date_add(current_date, interval 1 week), "%d de %M del %Y") as "fecha mas una semana";

/*Consulta3*/
select nombre, concat(date_format(current_date, "%Y") - date_format(fechaAlta, "%Y"), " años") as antiguedad from cliente;

/*Consulta4*/
select date_format(now(), "%d") as "numero del dia actual", date_format(now(), "%W") as "nombre del dia actual"; 

/*Consulta5*/
select nombre, year(fechaAlta) as "año Alta", monthname(fechaAlta) as "mes Alta", dayofmonth(fechaAlta) as "dia Alta", date_format(fechaAlta, "%H") as "hora alta", date_format(fechaAlta, "%i") as "minuto alta" from cliente; 

/*Consulta6*/
select concat("si se comprara hoy algo a credito:") as "descripcion", date_add(current_date, interval 1 month) as "primer pago", date_add(current_date, interval 2 month) as "segundo pago", date_add(current_date, interval 3 month) as "tercer pago";

/*Consulta7*/
select nombre, concat(date_format(current_date, "%Y") - date_format(fechaAlta, "%Y"), " años, ", date_format(current_date, "%m") - date_format(fechaAlta, "%m"), " meses, ", date_format(current_date, "%d") - date_format(fechaAlta, "%d"), " dias") as antiguedad from cliente;
 
/*Consulta8*/
select concat("El dia de hoy ", current_date, " es ", date_format(current_date, "%W"));

/*Consulta9*/
select concat(nombre, " ", apPat, " se dio de alta el ", date_format(fechaAlta, "%W %d %m %Y")) from cliente where nombre="Edgar";

/*Consulta10*/
select nombre, fechaAlta from cliente;

/*Consulta11*/
select nombre, fechaAlta from cliente where year(fechaAlta)=2010;

/*Consulta12*/
select concat(nombre, " ", apPat) as "Clientes que se han registrado en enero" from cliente where date_format(fechaAlta, "%m")=12;

/*Consulta13*/
select nombre, fechaAlta from cliente where (year(fechaAlta)=2010) and (month(fechaAlta)=2);

/*Consulta14*/
select nombre, fechaAlta from cliente where fechaAlta="2010-08-15";

/*Consulta15*/
select concat(nombre, " ", apPat) as "Hoy cumple años" from cliente where date_format(fechaNac, "%d %m")=date_format(now(), "%d %m");

/*Consulta16*/
select nombre, apPat, fechaNac from cliente where (year(current_date)-year(fechaNac))<18;

/*Consulta17*/
select nombre, fechaAlta from cliente where (month(current_date)-month(fechaAlta))<6 and (year(current_date)-year(fechaAlta))=0;

/*Consulta18*/
select concat("Estimado cliente ", nombre, " ", apPat, " le recordamos que el dia de hoy ", date_format(now(), "%d %m %Y "),
		"usted nos debe ", deuda, " pesos. Le ofrecemos la posibilidad de pagar a 6 meses con el 10% de interés, por lo que esperamos su primer pago de ", 
		round((deuda/6)*1.1, 2), " pesos a mas tardar el dia ", date_format(date_add(current_date, interval 1 month), "%d de %M del %Y"), ". Por su atencion Gracias.") from cliente where deuda>5000;