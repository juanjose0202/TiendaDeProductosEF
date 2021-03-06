create database Tienda2
go
use Tienda2
go

create table Producto
(
	Id int identity (1,1) primary key,
	Nombre nvarchar (100),
	Descripcion nvarchar (100),
	Marca nvarchar (100),
	Precio float,
	Stock int
)
go

insert into Producto
values
	('Gaseosa','3 litros','marcacola',7.5,24),
	('Chocolate','Tableta 100 gramos','iberica',12.5,36);



---CREACION DE PROCEDIMIENTOS ALMACENADOS
create procedure MostrarProductos
as
	select *from Producto
go

create procedure InsetarProductos
	@nombre nvarchar (100),
	@descrip nvarchar (100),
	@marca nvarchar (100),
	@precio float,
	@stock int
as
	insert into Producto values (@nombre,@descrip,@marca,@precio,@stock)
go

create procedure EliminarProductos
@idpro int
as
	delete from Producto where Id=@idpro
go

create procedure EditarProductos
	@nombre nvarchar (100),
	@descrip nvarchar (100),
	@marca nvarchar (100),
	@precio float,
	@stock int,
	@id int
as
update Producto set
	Nombre=@nombre,
	Descripcion=@descrip,
	Marca=@marca,
	Precio=@precio,
	Stock=@stock
where Id=@id
go