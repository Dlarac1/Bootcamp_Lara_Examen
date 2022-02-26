drop schema if exists ejercicio1;
create schema ejercicio1;

create table ejercicio1.Clientes(
	ID_CLiente int primary key auto_increment,
	Apellidos varchar(45) not null,
	Nombre varchar(45) not null,
	Dirección varchar(45),
	Ciudad varchar(45),
	País varchar(30),
	Celular char(9) not null,
	Fax varchar(50),
	Fecha_ingreso date,
	Ind_Vigente varchar(45)
);

create table ejercicio1.Artículo(
	Id_articulo int primary key auto_increment,
	Descripción varchar(45),
	precio_unitario float,
	Stock int
);

create table ejercicio1.Vendedor(
	Id_vendedor int primary key auto_increment,
	Nombre varchar(45)
);

create table ejercicio1.pedido(
	ID_pedido int primary key auto_increment,
	Fecha_pedido date not null,
	Subtotal float,
	Total float not null,
	Estado varchar(20),
	ID_Cliente int,
	foreign key (ID_Cliente) references ejercicio1.Clientes(ID_Cliente), 
	Id_vendedor int,
	foreign key (Id_vendedor) references ejercicio1.Vendedor(Id_vendedor)
);

create table ejercicio1.Pedido_has_Artículo(
	Cantidad int not null,
	Precio float not null,
	Subtotal float not null,
    Pedido_ID_Pedido int not null,
    Artículo_Id_Artículo int not null,
	primary key(Pedido_ID_Pedido, Artículo_Id_Artículo),
	foreign key(Pedido_ID_Pedido) references ejercicio1.pedido(ID_pedido),
	foreign key(Artículo_Id_Artículo) references ejercicio1.artículo(Id_articulo)
);