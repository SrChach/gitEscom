/*

Ejercicio1

create database experimental;
use experimental;

create table Alumnos(
	IdAlumno int, 
	Nombre varchar(50), 
	ApPaterno varchar(50), 
	ApMaterno varchar(50), 
	Promedio int, 
	FechaIngreso date	
);

*/

insert into Alumnos (IdAlumno, Nombre, ApPaterno, ApMaterno, Promedio, FechaIngreso) 
	values 	(1, 'Blanca Jenipher', 'Garcia', 'Montez', 10, '2010/02/02'),
			(2, 'Brandon', 'Garcia', 'Ruiz', 9, '2011/08/05'),
			(3, 'Brenda', 'Alcántara', null, null, '2017/01/05');

update Alumnos 
	set Promedio= 9 where nombre= 'Brenda';

update Alumnos 
	set Promedio= 6 where nombre= 'Brandon';

update Alumnos 
	set FechaIngreso='2017/02/04' where nombre='Blanca Jenipher';

update Alumnos
	set FechaIngreso='2005/05/05' where nombre='Brenda';

delete from Alumnos
	where nombre= 'Brenda';


/*

Ejercicio2

create table auto (
	modelo varchar(50),
	marca varchar(50),
	color varchar(30),
	placas varchar(30)
);

*/

insert into auto (modelo, marca , color, placas) 
	values 	('Golf GL', 'Volkswagen', 'Verde', 'HTOS43'),
			('Civic','Honda','Gris','278CEK'),
			('Cam-b','Mazda','Amarillo','235HKE'),
			('Wrangler','Jeep','Blanco','481LK0');

/*
también se pueden introducir así:

	insert into auto
	values 	('Golf GL', 'Volkswagen', 'Verde', 'HTOS43'),
			('Civic','Honda','Gris','278CEK'),
			('Cam-b','Mazda','Amarillo','235HKE'),
			('Wrangler','Jeep','Blanco','481LK0');

*/

update auto
	set color='Verde oscuro' where placas='481LK0';

delete from auto
	where placas='481LK0';

delete from auto
	where placas='235HKE';

/*
Ejercicio3

create table Materia(
	IdMateria int,
	Nombre varchar(50),
	Nivel int,
	créditos int
);

*/

insert into Materia
	values	(1, 'COE', 1, 3),
			(2,'IES', 1, 3),
			(3, 'Vectorial', 1, 5);

delete from Materia
	where IdMateria=2;

delete from Materia
	where IdMateria=3;