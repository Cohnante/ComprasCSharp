
use distribuidora;

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

/*Faltante ComboBox(NO SE COMO SE HACE ESA MONDA)*/ /* ya sabe como se hace esa MONDA */

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