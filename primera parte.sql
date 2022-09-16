-- Se elimina la base de datos distribuidora si existe --
drop database if exists distribuidora;
-- se crea la base de datos --
create database distribuidora;
-- se usa la base de datos --
use distribuidora;

create table Empleado (id_empleado varchar (10) primary key not null,
						nombre_empleado varchar (30) not null,
						apellido_empleado varchar (30) not null,
						telefono_empleado varchar (30) not null,
						edad_empleado varchar (14) not null,
						direccion_empleado varchar (150) not null,
						nacionalidad_empleado varchar (40) not null
						);
create table Proveedor (id_proveedor varchar (30) primary key not null,
						nombre_provedor varchar (30) not null,
						telefono varchar (30) not null,
						dirreccion_proveedor varchar (150) not null
						);
create table Categoria (id_categoria varchar (30) primary key not null,
						nombre varchar (30) not null,
						caracteristica varchar (30) not null
						);

create table cliente (id_cliente varchar (10) primary key not null,
					  nombre_cliente varchar (30) not null,
					  apellido_cliente varchar (30) not null,
					  telefono_cliente varchar (30) not null,
					  edad_cliente varchar (14) not null,
					  direccion_cliente varchar (150) not null,
					  nacionalidad_cliente varchar (40) not null
					  );

create table ventas (numero_venta varchar (30) primary key not null,
					fecha date not null,
					fk_empleado varchar (30) not null,
					fk_cliente varchar (10) not null,
					iva float null,
					sub_total float null,
					total float null,
					foreign key (fk_cliente) references cliente(id_cliente)
					);

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

create table producto (codigo_producto varchar (30) primary key not null,
						nombre_producto varchar (30) not null,
						valor float null,
						fk_categoria varchar (30) not null,
						foreign key (fk_categoria) references Categoria(id_categoria)
						);




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

create table ventas_producto (codigo_pr varchar (30) not null,
							  num_venta varchar (30) not null,
							  cantidad int not null,
							  valor_total float not null,
							  constraint fk3 foreign key (num_venta) references ventas (numero_venta),
							  constraint fk4 foreign key (codigo_pr) references producto (codigo_producto),
							  primary key (num_venta,codigo_pr)
							  );


--create database oli
use oli
drop database distribuidora
