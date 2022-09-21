
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
create table ventas (numero_venta int identity primary key,
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
							  num_venta int,
							  cantidad int,
							  valor_total float,
							  constraint fk3 foreign key (num_venta) references ventas (numero_venta),
							  constraint fk4 foreign key (codigo_pr) references producto (codigo_producto),
							  primary key (num_venta,codigo_pr)
							  );
go

--create database oli
use oli
drop database distribuidora
