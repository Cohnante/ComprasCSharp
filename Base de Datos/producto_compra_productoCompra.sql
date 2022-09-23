use distribuidora

go
create procedure USP_combo_categoria
as
begin
	SELECT '0' as id, 'Seleccione una categoria' as categoria
	union
	SELECT id_categoria as id, nombre as categoria from Categoria
end
go

go 
create procedure USP_insert_categoria
	@id varchar(10),
	@nombre varchar(30),
	@caracteristica varchar(30)
as
begin 
 insert into Categoria (id_categoria, nombre, caracteristica) values (@id, @nombre, @caracteristica);
end
go 

--USP_insert_categoria '123456', 'comida', 'roja';

go 
create procedure USP_select_categoria_uno
	@id varchar(10)
as
begin
	select * from Categoria where id_categoria=@id;
end
go

--USP_select_categoria_uno '123456';

go
create procedure USP_update_categoria
	@id varchar(10),
	@nombre varchar(30),
	@caracteristica varchar(30)
as
begin
	update Categoria set nombre=@nombre, caracteristica=@caracteristica where id_categoria=@id;
end
go

--USP_update_categoria '123456', 'arroz', 'blanco';

go 
CREATE PROCEDURE USP_delete_categoria
  @id varchar(10)
as
begin
	 DELETE from Categoria where id_categoria = @id;
end
go

--USP_delete_categoria '123456';

go 
CREATE PROCEDURE USP_select_categoria_all
as
begin
	SELECT * from Categoria
end
go

--USP_select_categoria_all

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
		@codigo_producto varchar (10),
		@nombre_producto varchar (30),
		@valor float,
		@fk_categoria varchar(10)
AS
begin
	INSERT into Producto (codigo_producto, nombre_producto, valor, fk_categoria) VALUES (@codigo_producto, @nombre_producto, @valor, @fk_categoria);
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

USP_delete_producto '123';

go
CREATE PROCEDURE USP_insert_compraProducto
		@num_compra varchar (10),
		@codigo_pr varchar (10),
		@cantidad int,
		@costo float,
		@valor_total float
AS
begin 
	insert into Compra_Producto (fk_num_compra, fk_codigo_pr, cantidad, costo, valor_total) values (@num_compra, @codigo_pr, @cantidad, @costo, @valor_total);
end
go

--USP_insert_compraProducto '12345', '123', 50, 9000.300, 457000.300;

go
CREATE PROCEDURE USP_select_compraProducto_uno
		@fk_num_compra varchar (10),
		@codigo_pr varchar (10)
AS
begin
		select * from Compra_Producto where fk_num_compra=@fk_num_compra and fk_codigo_pr=@codigo_pr;
end
go 

--USP_select_compraProducto_uno '12345', '123';

go
CREATE PROCEDURE USP_select_compraProducto_all
AS
begin 
		select * from Compra_Producto;
end
go 

--USP_select_compraProducto_all;

go
CREATE PROCEDURE USP_update_compraProducto
		@fk_num_compra varchar (10),
		@codigo_pr varchar (30),
		@cantidad int,
		@costo float,
		@valor_total float
AS
begin
		update Compra_Producto set cantidad=@cantidad, costo=@costo, valor_total=@valor_total where fk_num_compra=@fk_num_compra and fk_codigo_pr=@codigo_pr;
end
go

--USP_update_compraProducto '12345', '123456', 30, 7500.00, 225000.00;

go
CREATE PROCEDURE USP_delete_compraProducto
		@fk_num_compra varchar (10),
		@codigo_pr varchar (30)
as
begin
		delete from Compra_Producto where fk_num_compra=@fk_num_compra and fk_codigo_pr=@codigo_pr;
end
go

--USP_delete_compraProducto '12345', '123456';