create database tienda;
use tienda;

create table cliente(
	idCliente int not null primary key,
	nombre varchar(25),
	apPat varchar(20),
	apMat varchar(20),
	rfc varchar(30),
	sexo char,
	telefono varchar(20),
	credito float,
	deuda float,
	domicilio varchar(100),
	fechaNac date,
	correo varchar(50),
	fechaAlta date
);

create table producto(
	idProducto int not null primary key,
	nomProducto varchar(25),
	existencia int,
	precCompra float,
	precMinVenta float,
	precSugerido float,
	idProv int, /*foranea*/
	marca varchar(25),
	codigoBarra int,
	modelo varchar(25)
);

create table proveedor(
	idProv int not null primary key,
	nomProv varchar(25),
	domicilioProv varchar(100),
	compañia varchar(50),
	rfcProv varchar(30),
	correoProv varchar(50),
	telProv varchar(25)
);

create table venta(
	idVenta int not null primary key,
	fechaVta date,
	idCliente int, /*foranea*/
	totalVenta float
);

create table prodVendidos(
	idProdVend int not null primary key,
	idVenta int, /*foranea*/
	idProducto int, /*foranea*/
	cantidad int,
	precioVenta float
);

/*
	buscar kendo ui
*/

insert into cliente (idCliente, nombre, apPat, apMat, rfc, sexo, telefono, credito, deuda, 
domicilio, fechaNac, correo, fechaAlta)	values 
	(1, 'Ana', 'Martinez', 'Villarreal', 'rfc', 'F', '1728394650', 1200.00, 500.00, 'su casa :v', '2005/05/09', '1@hotmail.com', '2000/01/01'),
	(2, 'Annette', 'Juarez', 'Gomez', 'rfc', 'F', '1928406342', 900.00, 150.00, 'su casa :v', '2003/10/10', '2@hotmail.com', '2000/01/01'),
	(3, 'Brigitte', 'Grey', 'Corona', 'rfc', 'F', '1526378461', 1200.00, 0.00, 'su casa :v', '1997/04/12', '3@hotmail.com', '2000/01/01'),
	(4, 'Cristian', 'Gonzalez', 'Aguilar', 'rfc', 'M', '09493847568', 900.00, 600.00, 'su casa :v', '1990/07/10', '4@hotmail.com', '2000/01/01'),
	(5, 'Catalina', 'Bautista', 'Arredondo', 'rfc', 'F', '7485965342', 1200.00, 450.00, 'su casa :v', '1998/09/09', '5@hotmail.com', '2000/01/01'),
	(6, 'Cesar', 'Caballero', 'Cruz', 'rfc', 'M', '0926354874', 4000.00, 4000.00, 'su casa :v', '1999/02/04', '6@hotmail.com', '2000/01/01'),
	(7, 'Dante', 'Jimenez', 'Prieto', 'rfc', 'M', '9872536478', 1200.00, 100.00, 'su casa :v', '1993/03/01', '7@hotmail.com', '2000/01/01'),
	(8, 'Diana', 'Rodriguez', 'de la Torre', 'rfc', 'F', '4466772288', 4000.00, 67.00, 'su casa :v', '1991/01/01', '8@hotmail.com', '2000/01/01'),
	(9, 'Edgar', 'Catalan', 'Salgado', 'rfc', 'M', '7733664499', 1200.00, 1200.00, 'su casa :v', '1993/12/12', '9@hotmail.com', '2000/01/01'),
	(10, 'Flor', 'Alamilla', 'de la O', 'rfc', 'F', '1122334455', 900.00, 10.00, 'su casa :v', '1997/07/07', '10@hotmail.com', '2000/01/01');

/*Consulta1*/
select concat (nombre, ' ', apPat, ' ', apMat) from cliente;

/*Consulta2*/
select concat (nombre, ' ', apPat) from cliente;

/*Consulta3*/
select concat (apPat, ' ', apMat, ' ', nombre) from cliente;

/*Consulta4*/
select concat ('El cliente ', nombre, ' se apellida ', apPat) from cliente where nombre='Edgar';

/*Consulta5*/
select concat (nombre, ' vive en ', domicilio) from cliente where nombre='Edgar';

/*Consulta6*/
select (credito - deuda) as "Credito disponible" from cliente;

/*Consulta7*/
select concat (nombre, ' el 15% de tu deuda es: ', (deuda* 0.15)) from cliente;

/*Consulta8*/
select nombre, deuda, (deuda*0.1) as "Comisión(10%)", (deuda+(deuda*0.1)) as "Deuda + Comisión" from cliente;

/*Consulta9*/
select nombre as "pagos mensuales a", round((deuda/6), 2) as "6 meses", round((deuda/12), 2) as "12 meses", 
	round((deuda/24), 2) as "24 meses" from cliente;

/*Consulta10*/
select nombre, apPat, apMat, deuda, round((deuda/6)*0.1, 2) as "a 6 meses con cargo del 10%" from cliente;

/*Consulta11*/
select nombre, deuda, round((deuda*0.7),2) as "deuda-30%" from cliente;

/*Consulta12*/
select nombre as "pagos mensuales(anticipado ya 30%) a", round(((deuda*0.7)/6), 2) as "6 meses", 
	round(((deuda*0.7)/12), 2) as "12 meses", round(((deuda*0.7)/24), 2) as "24 meses" from cliente;

/*Consulta13*/
select concat ('el crédito máximo de ', nombre, ' es ', credito) from cliente where nombre='Edgar';

/*Consulta14*/
select concat (nombre, ' tiene un crédito de ', credito, ' y debe ', deuda, ' le queda disponible ', 
		(credito-deuda)) from cliente where nombre='Edgar';

/*Consulta15*/
select concat (nombre, ' con crédito a 6 meses debe pagar ', deuda, '. Mensualmente pagará ', 
		(deuda/6)) from cliente where nombre='Edgar';

/*Consulta16*/
select concat ('Estimado cliente ', nombre, ' ', apPat, ' le recordamos que tiene una deuda de ', deuda, 
		' pesos, le ofrecemos la posibilidad de pagar el 40%[', round((deuda*0.4), 2), 
		' pesos] y el resto a 6 meses con el 10% de interés, quedando en ',  round(((deuda*0.6*1.1)/6), 2), 
		' pesos mensuales') as "aviso" from cliente where nombre='Edgar';