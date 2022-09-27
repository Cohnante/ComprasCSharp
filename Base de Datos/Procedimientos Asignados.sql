use distribuidora


/* Producto */

go
create procedure USP_combo_producto
as
begin
	SELECT '0' as id, 'Seleccione un producto'  as producto
	union
	SELECT codigo_producto as id, nombre_producto as producto from Producto
end
go

go
CREATE PROCEDURE USP_insert_producto
		@id varchar(10),
		@nombre_producto varchar (30),
		@valor float,
		@fk_categoria varchar(10)
AS
begin
	INSERT into Producto VALUES (@id, @nombre_producto, @valor, @fk_categoria);
end
go 

--USP_insert_producto '123', 'arroz blanco', 3000.500, '123456';

go
CREATE PROCEDURE USP_select_producto_uno
		@codigo_producto varchar (10)
as
begin
	select * from Producto where codigo_producto=@codigo_producto;
end
go

--USP_select_producto_uno '123';

go 
CREATE PROCEDURE USP_select_productos_all
as
begin
	select * from Producto;
end
go 

--USP_select_productos_all;

go
CREATE PROCEDURE USP_update_producto
@codigo_producto varchar (10),
		@nombre_producto varchar (30),
		@valor float,
		@fk_categoria varchar(10)
as
begin
		update Producto set nombre_producto=@nombre_producto, valor=@valor, fk_categoria=@fk_categoria where codigo_producto=@codigo_producto;
end
go

--USP_update_producto '123', 'carne roja', 9500.300, '123456';

go
CREATE PROCEDURE USP_delete_producto
		@codigo_producto varchar (10)
as
begin
		delete from Producto where codigo_producto=@codigo_producto;
end
go

/* Ventas */
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


/* Detalles */
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

/* Combo box categoria */
go
create procedure USP_combo_categoria
as
begin
	SELECT '0' as id, 'Seleccione una categoria' as categoria
	union
	SELECT id_categoria as id, nombre as categoria from Categoria
end
go
