create database escuela;
use escuela;
create table profesor(
	nombre varchar(50),
	fechaNacimiento date,
	fechaIngreso date,
	salario int
);

create table salon(
	codigo int,
	ubicacion varchar(50)
);

--segunda base de datos

create database taller;
use taller;
create table mecanico(
	nombre varchar(50),
	fechaIngreso date
);

create table refacciones(
	nombrePieza varchar(50),
	fechaLlegada date,
	int garantia
);

