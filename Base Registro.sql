create database mykihack
go

use mykihack
go

create table Estudiantes
(
cod_estd char(5) primary key not null,
id_estd char(20),
user_nom varchar(50),
user_apell varchar(50),
user_direc varchar(50),
user_email varchar(50),
fecha_ingr date,
regis char(1),

)

go
--------- PARA LISTAR ---------

create proc pb_listas
as
select * from Estudiantes
go

--------- REGISTRAR DATOS ---------

create proc pb_nuevo
@id char (8),
@nombre varchar (50),
@apellido varchar(50),
@email varchar (50)
@fechaingr date,
@reg char (1)
as
declare @codigo_estd varchar(5)
set @codigo_estd= (select MAX (cod_estd) from Estudiantes)
set @codigo_estd= 'C' + RIGHT ('0000'+LTRIM (right(isnull(@codigo_estudiantes,'0000'),4)+1),4)
insert into Estudiantes values (@codigo_Estudiantes,@id,@nombre,@apellido,@direccion,@gmail,@fechaingr,@reg)
go 

---------ELIMINA REGISTRO-----------
create proc pb_eliminar
@codigo char (5)
as
delete from Estudiantes where cod_Estd=@codigo
go

---------PARA MODIFICAR DATOS---------
create proc pb_modificar
@codigo char (5),
@id char (8),
@nombre varchar(50),
@apellido varchar(50),
@ireccion varchar(50),
@email varchar(50),
@fechaingr date,
@reg char (1)
as
update Estudiantes set id_estd=@id,user_apell=@apellido,user_direc=@direccion,user_email=@email,fecha_ingr=@fechaingr
where cod_estd=@codigo
go


--------- DATOS ALUMNOS ---------
insert into Estudiantes values ('C0001','78656798','Marcos Jose','Veliz Moreira','Colectora','MJose15@gmail.com','2022-10-15',1)
insert into Estudiantes values ('C0002','71399105','Boris Milton','Mendoza Velez de villa','Moras','MendozaMilton3@gmail.com','2022-10-20',4)
insert into Estudiantes values ('C0003','6335780','Carlos','Suarez Dominguez','Colectora','Master25@gmail.com','2022-10-15',4)
insert into Estudiantes values ('C0004','76631822','Antonio Isa','Chavez Vega','Abtao','AIsaCV1@gmail.com','2022-10-25',6)
insert into Estudiantes values ('C0005','45739898','Manuel Teo','Quispe Mamani','Colectora','Tuleder@gmail.com','2022-10-22',3)
go
exec pb_listas
go