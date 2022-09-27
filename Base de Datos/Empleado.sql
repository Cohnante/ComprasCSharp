

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
	update Empleado set estado = 0 where id_empleado =  @id
end
go
/*Procedimiento Consultar Empleado*/
go
create procedure USP_Consultar_Empleado
	@id	varchar(10)
as
begin
	select * from Empleado where id_empleado=@id and estado = 1
end
go

go
create procedure USP_Listar_Empleado
	@id	varchar(10)
as
begin
	select * from Empleado where estado = 1
end
go

go
create procedure USP_ComboBox_Empleado
as
begin
        SELECT '0' as id, 'Seleccione el nombre del Empleado ' as Nombre
        union
        SELECT id_empleado, Nombre_empleado FROM empleado where estado = 1
end
go

/*Faltante ComboBox(NO SE COMO SE HACE ESA MONDA)*/ /* ya sabe como se hace esa MONDA */



/*Procedimientos Ventas*/



/*Procedimientos Agregar Ventas*/
go
Create procedure USP_Agregar_Ventas
	@fecha date,
	@FkEmpleado Varchar(10),
	@FkCliente varchar (10),				
	@Iva float,
	@subTotal float,
	@Total float
as
begin
	insert into ventas values (@fecha,@FkEmpleado,@FkCliente,@Iva,@subTotal,@Total)
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
	select * from  Ventas
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
	insert into Ventas_producto values (@Numero,@Num_venta,@cantidad,@ValorTotal)
end
go



/*Procedimientos Consultar ProductosVentas*/
go
create procedure USP_Consultar_ProductosVentas
	@Numero	varchar(10),
	@Numero_pro varchar(30)
as
begin
	select * from  Ventas_producto where fk_num_venta=@Numero and fk_codigo_pr=@Numero_pro
end
go

/*Procedimientos Listar ProductosVentas*/
go
create procedure USP_Listar_ProductosVentas
as
begin
	select * from  Ventas_producto
end
go