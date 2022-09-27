

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
	insert into Empleado(id_empleado, nombre_empleado, apellido_empleado, telefono_empleado, edad_empleado, direccion_empleado, nacionalidad_empleado) 
	values (@id,@nombre,@apellido,@telefono,@edad,@direccion,@nacionalidad)
end 
go

USP_agregar_empleado '12346', 'Julio', 'Apellido', '5321', '14', 'direccion', 'colombiano'

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
	select MAX(numero_venta) as id from ventas where fk_empleado = @FkEmpleado and fk_cliente = @FkCLiente
end
go

USP_Agregar_Ventas '2000-02-15', '12346', '1234567891', 1500.2,2000.5, 2500.7

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
as
begin
	select numero_venta as 'Numero de Venta', fecha as 'Fecha', nombre_empleado, nombre_cliente, iva as 'IVA', sub_total as 'Sub Total' , total as 'Total' from  Ventas, Empleado, Cliente  where fk_empleado = id_empleado and fk_cliente = id_cliente
end
go

USP_Listar_Ventas

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