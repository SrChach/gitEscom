create database tienda;
use tienda;

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
	
/*
	Inicia practica 4 
*/

/*Consulta1*/
select concat (nombre, ' ', apPat, ' ', apMat ) as "clente = Edgar", credito from cliente where nombre='Edgar';

/*Consulta2*/
select concat (nombre, ' ', apPat, ' ', apMat ) as "no Edgar" from cliente where nombre != 'Edgar';

/*Consulta3*/
select concat (nombre, ' ', apPat, ' ', apMat ) as "con credito mayor a 5000", credito from cliente where deuda> 5000;

/*Consulta4*/
select concat (nombre, ' ', apPat, ' ', apMat ) as "con credito menor a 5000", credito from cliente where deuda< 5000;

/*Consulta5*/
select concat (nombre, ' ', apPat, ' ', apMat ) as "de Delegacion Iztacalco" from cliente where delegacion='Iztacalco';

/*Consulta6*/
select concat (nombre, ' ', apPat, ' ', apMat ) as "No viven en Iztacalco", delegacion from cliente where delegacion!='Iztacalco';

/*Consulta7*/
select concat (nombre, ' ', apPat, ' ', apMat ) as "no Edgar" from cliente where nombre != 'Edgar';

/*Consulta8*/
select concat (nombre, ' ', apPat, ' ', apMat ) as "Edgar o Juan" from cliente where (nombre='Edgar') or (nombre='Juan');

/*Consulta9*/
select nombre, apPat, apMat, credito from cliente where (credito>5000) and (credito<10000);

/*Consulta10*/
select nombre, apPat, apMat from cliente where (nombre='Edgar') and (apPat='Catalan' or apMat='Catalan');

/*Consulta11*/
select nombre, apPat, apMat from cliente where (nombre!='Edgar') and (apPat='Catalan' or apMat='Catalan');

/*Consulta12*/
select nombre, apPat, apMat from cliente where (nombre='Imelda') xor (apPat='Catalan' or apMat='Catalan');

/*Consulta13*/
select nombre, apPat, credito from cliente where (delegacion='Iztacalco')and(deuda>500)and(deuda<1000);

/*Consulta14*/
select nombre, apPat, credito, delegacion, deuda from cliente where (delegacion='Iztacalco' or delegacion='Coyoacan') and (deuda>1000 and deuda <2000);

/*Consulta15*/
select nombre, round((deuda/6), 2) as 'pago mensual 6 meses' from cliente where (deuda/6)>=100;

/*
	Parte2: Operadores Especiales
*/

/*Consulta1*/
select nombre, apPat, apMat, credito from cliente where credito between 500 and 1000;

/*Consulta2*/
select nombre, apPat, apMat, delegacion from cliente where delegacion in ('Iztacalco', 'Coyoacan', 'Benito Juarez');

/*Consulta3*/
select nombre, apPat, deuda, round((deuda/12),2) as "pago mensual a 12 meses" from cliente where (deuda between 1000 and 1500) and ((deuda/12) between 50 and 100);

/*Consulta4*/
select nombre, apPat, delegacion, round(((deuda/6)*0.9), 2) as "Pago mensual a 6 meses con 10% de descuento" from cliente where (delegacion in ('Iztacalco', 'Coyoacan', 'GAM')) and (deuda between 1000 and 1500);

/*
	Parte3: Operadores para busqueda de patrones
*/

/*Consulta1*/
select nombre, apPat from cliente where nombre regexp '^.*edgar.*$';

/*Consulta2*/
select nombre from cliente where nombre regexp '^.d';

/*Consulta3*/
select nombre from cliente where nombre regexp '^[aeiou]';

/*Consulta4*/
select nombre from cliente where nombre regexp '^[^aeiou]';

/*Consulta5*/
select nombre from cliente where nombre regexp 'r$';

/*Consulta6*/
select nombre from cliente where nombre regexp '^[aeiou].*h$';

/*Consulta7*/
select nombre from cliente where nombre regexp '^..g';

/*Consulta8*/
select nombre from cliente where nombre regexp '^e..a';

/*Consulta9*/
select nombre from cliente where nombre regexp '^.*e.*$';

/*Consulta10*/
select nombre from cliente where nombre regexp '^.*[e].*[e].*$';

/*Consulta11*/
select nombre from cliente where nombre regexp '^.*[aeiou].*[aeiou].*$';

/*Consulta12*/
select nombre from cliente where nombre not regexp '^.*[aeiou].*[aeiou].*$'; 

/*Consulta13*/
select nombre, apPat from cliente where nombre='Edgar' and apPat regexp '^c';

/*Consulta14*/
select nombre, apPat, apMat from cliente where nombre='Edgar' and (apPat regexp '^c' or apMat regexp '^c');

/*Consulta15*/
select nombre, apPat from cliente where apPat regexp '^[a-m]';

/*Consulta16*/
select nombre, apPat from cliente where apPat regexp '^[n-z]';

/*Consulta17*/
select nombre, apPat from cliente where (apPat regexp '^[^ae]' and apPat regexp '^[a-m]');

/*Consulta18*/
select nombre, apPat, credito from cliente where (apPat regexp '^[n-z]' and credito>1000);

/*Consulta19*/
select nombre, apPat, credito, (deuda/6) as "Pagos mensuales a 6 meses" from cliente where ((apPat regexp '^[n-z]' and credito>1000) and (deuda/6)>100);

/*Consulta20*/
select nombre, apPat from cliente where nombre regexp '^e.*a.$';

/*Consulta21*/
select nombre, apPat from cliente where nombre regexp '^e..z.*[aeiou]..$';

/*Consulta22*/
select nombre, apPat from cliente where nombre regexp '^.* .*$';

/*
	Parte4: Seleccion de Nulos
*/

/*Consulta1*/
select concat (nombre, ' ', apPat) as "Con credito nulo" from cliente where credito=null;

/*Consulta2*/
select concat (nombre, ' ', apPat) as "Con credito nulo" from cliente where rfc=null;
