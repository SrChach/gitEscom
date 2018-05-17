create database experimental;
use experimental;

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

create table producto(
	idProducto int unsigned not null primary key auto_increment,
	nomProducto varchar(25),
	existencia int,
	precCompra float,
	precMinVenta float,
	precSugerido float,
	idProv int unsigned not null, /*foranea*/
	marca varchar(25),
	codigoBarra int,
	modelo varchar(25)
);

create table proveedor(
	idProv int unsigned not null primary key auto_increment,
	nomProv varchar(25),
	domicilioProv varchar(100),
	compañia varchar(50),
	rfcProv varchar(30),
	correoProv varchar(50),
	telProv varchar(25)
);

create table venta(
	idVenta int unsigned not null primary key auto_increment,
	fechaVta date,
	idCliente int unsigned not null, /*foranea*/
	totalVenta float
);

create table prodVendidos(
	idProdVend int unsigned not null primary key auto_increment,
	idVenta int unsigned not null, /*foranea*/
	idProducto int not null, /*foranea*/
	cantidad int,
	precioVenta float
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
select nombre, left(nombre, 3) as "3 primeras letras" from cliente;

/*Consulta2*/
select nombre, right(nombre, 3) as "3 ultimas letras" from cliente;

/*Consulta3*/
select nombre, substring(nombre, 2, 4) as "del 2do al 5to char" from cliente;

/*Consulta4*/
select nombre as "nombre original", replace(nombre, "d", "s") as "cambiando las d por s" from cliente;

/*Consulta5*/
select apPat, char_length(apPat) as "longitud del apellido" from cliente;

/*Consulta6*/
select rtrim(nombre) as "quita espacios en blanco al final del nombre" from cliente;

/*Consulta7*/
select nombre as "con espacio al final" from cliente where right(nombre, 1) = " ";

/*Consulta8*/
select nombre, upper(nombre) as "nombre en mayusculas" from cliente;

/*Consulta9*/
select apPat, lower(apPat) as "apellido paterno en minusculas" from cliente

/*Consulta10*/
select upper(apPat) as "apellido paterno", upper(apMat) as "apellido materno", upper(nombre) as "nombre" from cliente;

/*Consulta11*/
select nombre, concat(substring(nombre, 1, char_length(nombre)-1), upper(substring(nombre, char_length(nombre), char_length(nombre)))) as "ultima letra del nombre con mayusculas" from cliente;

/*Consulta12*/
select concat(upper(left(nombre, 1)), right(nombre, char_length(nombre)-1) ) as "primer letra del nombre en mayuscula" from cliente;

/*Consulta13*/
select concat(substring(nombre, 1, 2), upper(substring(nombre, 3, 1)), substring(nombre, 4, char_length(nombre)-3)) as "tercer caracter en mayus" from cliente

/*Consulta14*/
select concat(left(nombre, 1), upper(substring(nombre, 2, 1)), substring(nombre, 3, 1), upper(substring(nombre, 4, 1)), substring(nombre, 5, char_length(nombre)-4)) as "segundo y cuarto chars en mayus" from cliente;

/*Consulta15*/
select nombre from cliente where char_length(nombre) >5;

/*Consulta16*/
select replace(nombre, "Benito", "B.") as "delegacion", nombre from cliente where delegacion="Benito Juarez";