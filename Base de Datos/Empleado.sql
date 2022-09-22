go
drop database if exists distribuidora;
go

create database distribuidora;
go

use distribuidora;
go

create table Empleado (id_empleado varchar (10) primary key,
						nombre_empleado varchar (30),
						apellido_empleado varchar (30),
						telefono_empleado varchar (30),
						edad_empleado varchar (14),
						direccion_empleado varchar (150),
						nacionalidad_empleado varchar (40)
						);
go
create table Proveedor (id_proveedor varchar (30) primary key,
						nombre_provedor varchar (30),
						telefono varchar (30),
						dirreccion_proveedor varchar (150)
						);
go
create table Categoria (id_categoria varchar (30) primary key,
						nombre varchar (30),
						caracteristica varchar (30)
						);
go
create table cliente (id_cliente varchar (10) primary key,
					  nombre_cliente varchar (30),
					  apellido_cliente varchar (30),
					  telefono_cliente varchar (30),
					  edad_cliente varchar (14),
					  direccion_cliente varchar (150),
					  nacionalidad_cliente varchar (40)
					  );
go
create table ventas (numero_venta varchar (10) primary key,
					fecha date,
					fk_empleado varchar (10),
					fk_cliente varchar (10),
					iva float,
					sub_total float,
					total float,
					foreign key (fk_cliente) references cliente(id_cliente),
					foreign key (fk_empleado) references empleado(id_empleado)
					);

go
create table Compra (id_compra varchar (30) primary key,
					fk_empleado varchar (10),
					iva float,
					fk_proveedor varchar (30),
					total float,
					sub_total float,
					fecha date,
					foreign key (fk_empleado) references Empleado(id_empleado),
					foreign key (fk_proveedor) references proveedor(id_proveedor)
					);
go
create table producto (codigo_producto varchar (30) primary key,
						nombre_producto varchar (30),
						valor float null,
						fk_categoria varchar (30),
						foreign key (fk_categoria) references Categoria(id_categoria)
						);
go



create table Compra_Producto ( 
							   num_compra varchar (30),
							   codigo_pr varchar (30),
							   cantidad int null,
							   costo float null,
							   valor_total float null,
							   constraint fk1 foreign key (num_compra) references Compra (id_compra),
							   constraint fk2 foreign key (codigo_pr) references producto (codigo_producto),
							   primary key (num_compra,codigo_pr)
							  );
go
create table ventas_producto (codigo_pr varchar (30),
							  num_venta varchar(10),
							  cantidad int,
							  valor_total float,
							  constraint fk3 foreign key (num_venta) references ventas (numero_venta),
							  constraint fk4 foreign key (codigo_pr) references producto (codigo_producto),
							  primary key (num_venta,codigo_pr)
							  );
go


create database oli
use oli
drop database distribuidora



/*Creacion de procedimientos*/


/*Procedimiento Agregar Empleado*/
go 
create procedure USP_agregar_empleado
	@id varchar (10),
	@nombre varchar(30),
	@apellido varchar(30),					
	@telefono varchar(30),
	@edad varchar(14),
	@direccion varchar(150),
	@nacionalidad varchar(40)
as
begin 
	insert into Empleado values (@id,@nombre,@apellido,@telefono,@edad,@direccion,@nacionalidad)
end 
go
/*Procedimiento Actualizar Empleado*/
go
create procedure USP_Actualizar_Empleado
	@id varchar(10),
	@nombre varchar(30),
	@apellido varchar(30),
	@telefono varchar(30),
	@direccion varchar(150)
as
begin 
	update Empleado set nombre_empleado=@nombre,apellido_empleado=@apellido,telefono_empleado=@telefono,direccion_empleado=@direccion where id_empleado=@id
end
go

/*Procedimiento Borrar Empleado*/
go
create procedure USP_Borrar_Empleado
	@id varchar(10)
as
begin
	delete from Empleado where id_empleado=@id
end
go
/*Procedimiento Consultar Empleado*/
go
create procedure USP_Consultar_Empleado
	@id	varchar(10)
as
begin
	select * from Empleado where id_empleado=@id
end
go

go
create procedure USP_Listar_Empleado
	@id	varchar(10)
as
begin
	select * from Empleado
end
go

go
create procedure USP_ComboBox_Empleado
as
begin
        SELECT '0' as id, 'Seleccione el nombre del Empleado ' as Nombre
        union
        SELECT id_empleado, Nombre_empleado FROM empleado
end
go

/*Faltante ComboBox(NO SE COMO SE HACE ESA MONDA)*/

select * from Empleado

execute USP_ComboBox_Empleado
execute USP_Consultar_Empleado '1'
execute USP_Borrar_Empleado '1'
execute USP_Actualizar_Empleado '1','dx','da','123456789','das'
execute USP_agregar_empleado '1','xd','ad','123456789','15','asd','xd'


/*Procedimientos Ventas*/



/*Procedimientos Agregar Ventas*/
go
Create procedure USP_Agregar_Ventas
	@Numero varchar(10),
	@fecha date,
	@FkEmpleado Varchar(10),
	@FkCliente varchar (10),				
	@Iva float,
	@subTotal float,
	@Total float
as
begin
	insert into ventas values (@Numero,@fecha,@FkEmpleado,@FkCliente,@Iva,@subTotal,@Total)
end
go


/*Procedimientos Actualizar Ventas*/
go
Create procedure USP_Actualizar_Ventas
	@Numero varchar(10),
	@fecha date,
	@FkEmpleado Varchar(10),
	@FkCliente varchar (10),				
	@Iva float,
	@subTotal float,
	@Total float
as
begin
	update ventas set fecha=@fecha,fk_empleado=@FkEmpleado,fk_cliente=@FkCliente,iva=@Iva,sub_total=@subTotal,total=@Total where numero_venta=@Numero
end
go

/*Procedimiento Borrar Ventas*/
go
create procedure USP_Borrar_Ventas
	@Numero varchar(10)
as
begin
	delete from ventas where numero_venta=@Numero
end
go


/*Procedimientos Consultar Ventas*/
go
create procedure USP_Consultar_Ventas
	@Numero	varchar(10)
as
begin
	select * from  ventas where numero_venta=@Numero
end
go

/*Procedimientos Listar Ventas*/
go
create procedure USP_Listar_Ventas
	@Numero	varchar(10)
as
begin
	select * from  ventas
end
go


/*Procedimientos Agregar ProductosVentas*/
go
create procedure USP_agregar_ProductosVentas
	@Numero varchar(30),
	@Num_venta varchar(10),
	@cantidad int,
	@ValorTotal float
as
begin
	insert into ventas_producto values (@Numero,@Num_venta,@cantidad,@ValorTotal)
end
go

/*Procedimientos Actualizar ProductosVentas*/
go
create procedure USP_Actualizar_ProductosVentas
	@Numero varchar(30),
	@Num_venta varchar(10),
	@cantidad int,
	@ValorTotal float
as
begin
	update ventas_productos set cantida=@cantidad,valor_total=@ValorTotal where codigo_pr=@Numero and Num_venta=@Num_venta
end
go

/*Procedimiento Borrar ProductosVentas*/
go
create procedure USP_Borrar_ProductosVentas
	@Numero varchar(10),
	@Num_Pro varchar(30)
as
begin
	delete from ProductosVentas where Num_venta=@Numero and codigo_pr=@Num_Pro
end
go

/*Procedimientos Consultar ProductosVentas*/
go
create procedure USP_Consultar_ProductosVentas
	@Numero	varchar(10)
	@Numero_pro varchar(30)
as
begin
	select * from  ProductosVentas where Num_venta=@Numero and codigo_pr=@Numero_pro
end
go

/*Procedimientos Listar ProductosVentas*/
go
create procedure USP_Listar_ProductosVentas
as
begin
	select * from  ProductosVentas
end
go