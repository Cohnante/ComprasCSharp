-- Se elimina la base de datos distribuidora si existe --
drop database if exists distribuidora;
go
-- se crea la base de datos --
create database distribuidora;
go
-- se usa la base de datos --
use distribuidora;
go

create table Empleado (id_empleado varchar (10) primary key not null,
						nombre_empleado varchar (30) not null,
						apellido_empleado varchar (30) not null,
						telefono_empleado varchar (30) not null,
						edad_empleado varchar (14) not null,
						direccion_empleado varchar (150) not null,
						nacionalidad_empleado varchar (40) not null

						);
go
create table Proveedor (id_proveedor varchar (30) primary key not null,
						nombre_provedor varchar (30) not null,
						telefono varchar (30) not null,
						dirreccion_proveedor varchar (150) not null
						);
go
create table Categoria (id_categoria varchar (30) primary key not null,
						nombre varchar (30) not null,
						caracteristica varchar (30) not null
						);
go
create table cliente (id_cliente varchar (10) primary key not null,
					  nombre_cliente varchar (30) not null,
					  apellido_cliente varchar (30) not null,
					  telefono_cliente varchar (30) not null,
					  edad_cliente varchar (14) not null,
					  direccion_cliente varchar (150) not null,
					  nacionalidad_cliente varchar (40) not null
					  );
go
create table ventas (numero_venta int identity primary key not null,
					fecha date not null,
					fk_empleado varchar (10) not null,
					fk_cliente varchar (10) not null,
					iva float null,
					sub_total float null,
					total float null,
					foreign key (fk_cliente) references cliente(id_cliente),
					foreign key (fk_empleado) references empleado(id_empleado)
					);
go
create table Compra (id_compra varchar (30) primary key not null,
					fk_empleado varchar (10) not null,
					iva float null,
					fk_proveedor varchar (30) not null,
					total float null,
					sub_total float null,
					fecha date,
					foreign key (fk_empleado) references Empleado(id_empleado),
					foreign key (fk_proveedor) references proveedor(id_proveedor)
					);
go
create table producto (codigo_producto varchar (30) primary key not null,
						nombre_producto varchar (30) not null,
						valor float null,
						fk_categoria varchar (30) not null,
						foreign key (fk_categoria) references Categoria(id_categoria)
						);
go



create table Compra_Producto ( 
							   num_compra varchar (30) not null,
							   codigo_pr varchar (30) not null,
							   cantidad int null,
							   costo float null,
							   valor_total float null,
							   constraint fk1 foreign key (num_compra) references Compra (id_compra),
							   constraint fk2 foreign key (codigo_pr) references producto (codigo_producto),
							   primary key (num_compra,codigo_pr)
							  );
go
create table ventas_producto (codigo_pr varchar (30) not null,
							  num_venta int not null,
							  cantidad int not null,
							  valor_total float not null,
							  constraint fk3 foreign key (num_venta) references ventas (numero_venta),
							  constraint fk4 foreign key (codigo_pr) references producto (codigo_producto),
							  primary key (num_venta,codigo_pr)
							  );
go

--create database oli
use oli
drop database distribuidora


go 
create procedure USP_insert_categoria
	@id varchar(30),
	@nombre varchar(30),
	@caracteristica varchar(30)
as
begin 
 insert into Categoria (id_categoria, nombre, caracteristica) values (@id, @nombre, @caracteristica);
end
go 

USP_insert_categoria '123456', 'comida', 'roja';

go 
create procedure USP_select_categoria_uno
	@id varchar(30)
as
begin
	select * from Categoria where id_categoria=@id;
end
go

USP_select_categoria_uno '123456';

go
create procedure USP_update_categoria
	@id varchar(30),
	@nombre varchar(30),
	@caracteristica varchar(30)
as
begin
	update Categoria set nombre=@nombre, caracteristica=@caracteristica where id_categoria=@id;
end
go

USP_update_categoria '123456', 'arroz', 'blanco';

go 
CREATE PROCEDURE USP_delete_categoria
  @id
AS
begin
	 DELETE * from Categoria where id_categoria = @id;
end
go

USP_delete_categoria '123456';


go
CREATE PROCEDURE USP_insert_producto
		@codigo_producto varchar (30),
		@nombre_producto varchar (30),
		@valor float,
		@fk_categoria varchar(30)
AS
begin
	INSERT into producto (codigo_producto, nombre_producto, valor, fk_categoria) VALUES (@codigo_producto, @nombre_producto, @valor, @fk_categoria);
end
go 

USP_insert_producto '123', 'arroz blanco', 3000.500, '123456';

go
CREATE PROCEDURE USP_select_producto_uno
		@codigo_producto varchar (30)
as
begin
	select * from producto where codigo_producto=@codigo_producto;
end
go

USP_select_producto_uno '123';

go 
CREATE PROCEDURE USP_select_productos_all
		@codigo_producto varchar (30),
		
AS
begin
	select * from producto;
end
go   

USP_select_productos_all

go
CREATE PROCEDURE USP_update_producto
@codigo_producto varchar (30),
		@nombre_producto varchar (30),
		@valor float,
		@fk_categoria varchar(30)
as
begin
		update producto set nombre_producto=@nombre_producto, valor=@valor, fk_categoria=@fk_categoria where codigo_producto=@codigo_producto;
end
go

USP_update_producto '123', 'carne roja', 9500.300, '123456';

go
CREATE PROCEDURE USP_delete_producto
		@codigo_producto varchar (30),
		@nombre_producto varchar (30),
		@valor float,
		@fk_categoria varchar(30)
AS
begin
		delete * from producto where codigo_producto=@codigo_producto;
end
go

USP_delete_producto '123';