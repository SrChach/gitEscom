/*
	select sum(deuda), count (idCliente) from cliente;
	select sum(deuda), count(idCliente), max(deuda), delegacion from cliente group by delegacion;
*/

insert into producto (idProducto, idProv, nomProducto, existencia, precSugerido, precMinVenta, precCompra) Values
	(1, 1, 'Tele', 30, 5000,4000, 3000),
	(2, 1, 'DVd', 20, 1500, 1000, 900),
	(3, 1, 'Estereo', 3, 2000,2000, 1200),
	(4, 2, 'Pantalla', 5, 15000,14000, 10000),
	(5, 2, 'BlueRay', 10, 5500,5300, 5000),
	(6, 3, 'Mp3 Player', 13, 900, 900, 500),
	(7, 0, 'Compu', 15, 19000, 17000, 11500),
	(8, 0, 'Monitor', 10, 19000, 17000, 11500);

Insert into proveedor(idProv, nomProv) values
		(1,'lg'),
		(2,'yamaha'),
		(3,'samsung'),
		(4,'sony'),
		(5,'dell'),
		(6,'HP');

insert into venta (idVenta, idCliente, fechaVta) values 
		(1, 2, '2010/09/15'),
		(2, 5, '2010/09/17'),
		(3, 2, '2010/09/15');

	
insert into prodVendidos (idVenta, idProducto, cantidad, precioVenta) values 
		(1, 3, 2 ,2000),
		(1, 6, 1, 900),
		(1, 5, 3, 5500),
		(2, 5, 2, 5500),
		(2, 1, 1,5000), 
		(3, 4, 2, 15000);  

insert into cliente (idCliente, nombre, apPat, apMat, rfc, sexo, telefono, credito, deuda, fechaNac, correo, fechaAlta, pais, estado, delegacion, colonia, calle, numExt, numInt, CodPostal)	values 
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
select SUM(cantidad * precioVenta) from prodVendidos;

/*Consulta2*/
select idVenta, sum(cantidad * precioVenta) from prodVendidos group by idVenta;

/*Consulta3*/
select max(precioVenta) as "mayor precio", min(precioVenta) as "menor precio", avg(precioVenta) as "promedio prod vendidos" from prodVendidos;

/*Consulta4*/
select count(idCliente) as "total de clientes registrados" from cliente;

/*Consulta5*/
select delegacion, count(idCliente) as "total de clientes" from cliente group by delegacion;

/*Consulta6*/
select count(idProducto) as "total de productos diferentes en el inventario" from producto;

/*Consulta7*/
select count(idProv) as "total de proveedores" from proveedor;

/*Consulta8*/
select idProv, sum(existencia) as "productos en existencia" from producto group by idProv;

/*Consulta9*/
select min(credito) as "credito minimo", max(credito) as "credito maximo", avg(credito) as "promedio" from cliente;

/*Consulta10*/
select delegacion, min(credito) as "credito minimo", max(credito) as "credito maximo", avg(credito) as "promedio" from cliente group by delegacion;

/*Consulta11*/
select min(deuda) as "deuda minima", max(deuda) as "deuda maxima", avg(deuda) as "promedio" from cliente;

/*Consulta12*/
select delegacion, min(deuda) as "deuda minima", max(deuda) as "deuda maxima", avg(deuda) as "promedio" from cliente group by delegacion;

/*Consulta13*/
select date_format(fechaNac, "%Y") as "Edad", count(idCliente) from cliente group by date_format(fechaNac, "%Y");

/*Consulta14*/
select delegacion, count(idCliente), avg(date_format(current_date, "%Y") - date_format(fechaNac, "%Y")) as "edad promedio" from cliente group by delegacion;

/*Consulta15*/
select date_format(current_date, "%Y") - date_format(fechaNac, "%Y") as "Edad", count(idCliente) as "# Clientes" from cliente group by (date_format(current_date, "%Y") - date_format(fechaNac, "%Y"));

/*Consulta16*/
select delegacion, count(idCliente) as "TotalClientes", min(deuda) as "menor deuda", max(deuda) as "mayor deuda", avg(credito) as "promedio Credito", round(avg(date_format(current_date, "%Y") - date_format(fechaNac, "%Y")), 2) as "promedio Edad" from cliente group by delegacion;

/*Consulta17*/
select delegacion, date_format(current_date, "%Y") - date_format(fechaNac, "%Y") as "Edad", count(idCliente) as "# Clientes" from cliente group by date_format(current_date, "%Y") - date_format(fechaNac, "%Y");