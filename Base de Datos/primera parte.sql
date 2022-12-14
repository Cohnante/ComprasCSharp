
drop database if exists distribuidora;
go

create database distribuidora;
go

use distribuidora;
go

create table Empleado (id_empleado varchar (10) primary key,
						nombre_empleado varchar (30) not null,
						apellido_empleado varchar (30) not null,
						telefono_empleado varchar (30) not null,
						edad_empleado varchar (14) not null,
						direccion_empleado varchar (150) not null,
						nacionalidad_empleado varchar (40) not null,
						estado bit default 1
						);

						INSERT EMPLEADO(id_empleado, nombre_empleado, apellido_empleado, telefono_empleado, edad_empleado, direccion_empleado, nacionalidad_empleado) VALUES 
						('1023523155', 'Moises', 'Pineda', '3053326008', '18', 'Armenia, Quindio', 'Colombia')

go
create table Proveedor (id_proveedor varchar(30) primary key ,
						nombre_provedor varchar (30) not null,
						telefono varchar (30) not null,
						dirreccion_proveedor varchar (150) not null,
						estado bit default 1
						);
go
create table Categoria (id_categoria varchar(10) primary key ,
						nombre varchar (30) not null,
						caracteristica varchar (30)not null
						);

go
create table Cliente (id_cliente varchar (10) primary key,
					  nombre_cliente varchar (30) not null,
					  apellido_cliente varchar (30) not null,
					  telefono_cliente varchar (30) not null,
					  edad_cliente varchar (14) not null,
					  direccion_cliente varchar (150) not null,
					  nacionalidad_cliente varchar (40) not null,
					  estado bit default 1
					  );

					  INSERT Cliente(id_cliente, nombre_cliente, apellido_cliente, telefono_cliente, edad_cliente, direccion_cliente, nacionalidad_cliente) VALUES
					  ('123456789', 'Juan Carlos', 'Perez', '3051112203', '20', 'Armenia, Quindio', 'Colombia'),
					  ('123456781', 'Sara', 'Campos', '3051112213', '17', 'Armenia, Quindio', 'Colombia'),
					  ('123456782', 'Nicole', 'Bola?o', '3021112213', '19', 'Armenia, Quindio', 'Colombia')


go
create table Ventas (numero_venta int identity(100,1) primary key,
					fecha date not null,
					fk_empleado varchar (10) not null,
					fk_cliente varchar (10) not null,
					iva float not null,
					sub_total float not null,
					total float not null,
					foreign key (fk_cliente) references cliente(id_cliente),
					foreign key (fk_empleado) references empleado(id_empleado)
					);
go
create table Compra (id_compra varchar (10) primary key,
					fk_empleado varchar (10) not null,
					iva float not null,
					fk_proveedor varchar(30) not null,
					total float not null,
					sub_total float not null,
					fecha date not null,
					foreign key (fk_empleado) references Empleado(id_empleado),
					foreign key (fk_proveedor) references proveedor(id_proveedor)
					);
go
create table Producto (codigo_producto varchar (10) primary key,
						nombre_producto varchar (30) not null,
						valor float not null,
						fk_categoria varchar(10) not null,
						foreign key (fk_categoria) references Categoria(id_categoria)
						);
go



create table Compra_Producto ( 
							   fk_num_compra varchar(10) not null,
							   fk_codigo_pr varchar(10) not null,
							   cantidad int not null,
							   costo float not null,
							   valor_total float null,
							   constraint fk1 foreign key (fk_num_compra) references Compra (id_compra),
							   constraint fk2 foreign key (fk_codigo_pr) references producto (codigo_producto),
							   primary key (fk_num_compra,fk_codigo_pr) 
							  );
go
create table Ventas_producto (fk_codigo_pr varchar(10) not null,
							  fk_num_venta int not null,
							  cantidad int not null,
							  valor_total float not null,
							  constraint fk3 foreign key (fk_num_venta) references ventas (numero_venta),
							  constraint fk4 foreign key (fk_codigo_pr) references producto (codigo_producto),
							  primary key (fk_num_venta,fk_codigo_pr)
							  );
go

