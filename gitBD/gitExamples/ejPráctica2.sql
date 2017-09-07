create database escuela;
use escuela;

create table empleados(
	nombre varchar(50),
	apPaterno varchar(50),
	apMaterno varchar(50),
	fechaNacimiento date,
	salario int
);

/*
	1. Da de alta al empleado Edgar Catalan Salgado, 
	que nacio el 17 de marzo de 1981, con un salario de 10000
*/

insert into empleados(Nombre, apPaterno, apMaterno, fechaNacimiento,salario)
	values('Edgar', 'Catalan', 'Salgado', '1981/03/17', 1000);

/*Otra forma sería:
	insert into empleados(Nombre, apPaterno, apMaterno, fechaNacimiento,salario)
	values	('Edgar', 'Catalan', 'Salgado', '1981/03/17', 1000)
			('Ricardo', 'Flores', 'Magón', '1900/03/17', 10);
*/


/*
	2. Modifica el salario de los empleados que se llaman Edgar para que ahora ganen 15000
*/

update empleados
	set salario= 15000
	where nombre='Edgar';

/*
	3 Borra a los empleados que se llaman Edgar
*/

delete from empleados where nombre='Edgar';