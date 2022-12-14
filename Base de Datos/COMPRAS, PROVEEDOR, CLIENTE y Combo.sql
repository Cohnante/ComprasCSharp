use distribuidora


/* CRUD + Listar de Cliente */

go
create procedure USP_COMBO_CLIENTE
as
begin
	SELECT '0' as id, 'Seleccione un Cliente' as cliente
	union
	SELECT id_cliente as id, nombre_cliente as cliente from Cliente where estado = 1
end
go

go
create procedure USP_CREATE_CLIENTE
	@id_cliente varchar (10),
	@nombre_cliente varchar (30),
	@apellido_cliente varchar (30),
	@telefono_cliente varchar (30),
	@edad_cliente varchar (14),
	@direccion_cliente varchar (150),
	@nacionalidad_cliente varchar (40)
as
begin
	INSERT INTO Cliente(id_cliente, nombre_cliente, apellido_cliente, telefono_cliente, edad_cliente, direccion_cliente, nacionalidad_cliente) values (@id_cliente, @nombre_cliente, @apellido_cliente, @telefono_cliente, @edad_cliente,  @direccion_cliente, @nacionalidad_cliente);
end
go

execute USP_CREATE_CLIENTE '1234567891', 'Diana', 'Moya', '3053326008', '18', 'Direccion', 'Colombia' /* Work */

go
create procedure USP_READ_CLIENTE
	@id varchar(10)
as
begin
	SELECT * FROM Cliente where id_cliente = @id and estado = 1;
end
go

execute USP_READ_CLIENTE '1234567890' /* Work */

go
create procedure USP_UPDATE_CLIENTE
	@id_cliente varchar (10),
	@nombre_cliente varchar (30),
	@apellido_cliente varchar (30),
	@telefono_cliente varchar (30),
	@edad_cliente varchar (14),
	@direccion_cliente varchar (150),
	@nacionalidad_cliente varchar (40)
as
begin
	UPDATE Cliente set id_cliente = @id_cliente, nombre_cliente = @nacionalidad_cliente, apellido_cliente = @apellido_cliente, telefono_cliente = @telefono_cliente, edad_cliente = @edad_cliente, direccion_cliente = @direccion_cliente, nacionalidad_cliente = @nacionalidad_cliente
end
go

execute USP_UPDATE_CLIENTE '1234567890', 'Moises', 'Pineda', '3053326008', '17', 'Direccion 2', 'Colombia' /* Work */

go 
create procedure USP_DELETE_CLIENTE
	@id varchar(10)
as
begin
	update Cliente set estado = 0 where id_cliente = @id
end
go

execute USP_DELETE_CLIENTE '1234567890' /* Work */


go
create procedure USP_LIST_CLIENTE
as
begin
	SELECT * FROM CLIENTE where estado = 1
end
go


execute USP_LIST_CLIENTE /* Work */



/* CRUD + Listar de Proveedor */

go
create procedure USP_COMBO_PROVEEDOR
as
begin
	SELECT '0' as id, 'Seleccione un proveedor' as proveedor
	union
	SELECT id_proveedor as id, nombre_provedor as proveedor from Proveedor where estado = 1
end
go

go
create procedure USP_CREATE_PROVEEDOR
	@nombre_proveedor varchar (30),
	@telefono_proveedor varchar (30),
	@direccion_proveedor varchar (150)
as
begin
	INSERT INTO Proveedor values ( @nombre_proveedor, @telefono_proveedor,  @direccion_proveedor);
end
go

execute USP_CREATE_PROVEEDOR '1234567890', 'Proveedor 1', '5432154', 'Direccion Proveedor' /* Work */

go
create procedure USP_READ_PROVEEDOR
	@id varchar(10)
as
begin
	SELECT * FROM Proveedor where id_proveedor = @id and estado = 1
end
go

execute USP_READ_PROVEEDOR '1234567890' /* Work */

go
create procedure USP_UPDATE_PROVEEDOR
	@id_proveedor varchar (10),
	@nombre_proveedor varchar (30),
	@telefono_proveedor varchar (30),
	@direccion_proveedor varchar (150)
as
begin
	UPDATE Proveedor set id_proveedor = @id_proveedor, nombre_provedor = @nombre_proveedor, telefono = @telefono_proveedor, dirreccion_proveedor = @direccion_proveedor;
end
go

execute USP_UPDATE_PROVEEDOR '1234567890', 'Proveedor 1', '5432154', 'Direccion Proveedor 2' /* Work */

go 
create procedure USP_DELETE_PROVEEDOR
	@id varchar(10)
as
begin
	Update Proveedor set estado = 0 where id_proveedor = @id
end
go

execute USP_DELETE_PROVEEDOR '1234567890' /* Work */


go
create procedure USP_LIST_PROVEEDOR
as
begin
	SELECT * FROM Proveedor where estado = 0
end
go


execute USP_LIST_PROVEEDOR /* Work */



/* CRUD + Listar de Compras */

go
create procedure USP_CREATE_COMPRAS
	@nombre_proveedor varchar (30),
	@telefono_proveedor varchar (30),
	@direccion_proveedor varchar (150)
as
begin
	INSERT INTO Proveedor values (@nombre_proveedor, @telefono_proveedor,  @direccion_proveedor);
end
go

execute USP_CREATE_COMPRAS '1234567890', 'Proveedor 1', '5432154', 'Direccion Proveedor' /* Work */

go
create procedure USP_READ_COMPRAS
	@id varchar(10)
as
begin
	SELECT * FROM Proveedor where id_proveedor = @id
end
go

execute USP_READ_COMPRAS '1234567890' /* Work */

go
create procedure USP_UPDATE_COMPRAS
	@id_proveedor varchar (10),
	@nombre_proveedor varchar (30),
	@telefono_proveedor varchar (30),
	@direccion_proveedor varchar (150)
as
begin
	UPDATE Proveedor set id_proveedor = @id_proveedor, nombre_provedor = @nombre_proveedor, telefono = @telefono_proveedor, dirreccion_proveedor = @direccion_proveedor;
end
go

execute USP_UPDATE_COMPRAS '1234567890', 'Proveedor 1', '5432154', 'Direccion Proveedor 2' /* Work */


execute USP_DELETE_COMPRAS '1234567890' /* Work */


go
create procedure USP_LIST_COMPRAS
as
begin
	SELECT * FROM Proveedor
end
go


execute USP_LIST_COMPRAS /* Work */

