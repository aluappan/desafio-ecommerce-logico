create database ecommerce;
use ecommerce;

create table clients(
	idClient int auto_increment, primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30)
    constraint unique_cpf_client unique (CPF)
);

create table product(
	idProduct int auto_increment, primary key,
	Pname varchar(10) not null,
	classification_kidschar bool default false,
    category enum ('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliação float default 0,
    size varchar(10),
    constraint unique_cpf_client unique (CPF)
    );
  
create table payments (
    idclient int,
    idPayment int,
    typePayment enum('Cartão', 'Boleto', 'Pix'),
    limitAvailable float,
    primary key (idClient , idPayment)
);

create table orders(
	idOrder int auto_increment, primary key,
	idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em propcessamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
    );
    
create table productStorage(
	idProductStorage int auto_increment, primary key,
	storageLocation varchar(255),
    quantity int default 0,
    );
    
create table supplier(
	idSupplier int auto_increment, primary key,
    socialName varchar(255) not null,
	CNPJ char(15) not null,
    contact varchar(11) not null,
    constraint unique_supplier unique (CNPJ)
    );
    
create table seller(
    idSeller int auto_increment, primary key,
	socialName varchar(255) not null,
    absName varchar(255),
    CNPF char(15) not null,
    CPF char(9),
    location varchat(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
	constraint unique_cpf_seller unique (CPF)
    );
   
create table productSeller (
    idPseller int,
    idProduct int,
    prodQuantity int not null default 1,
    primary key (idPseller , idProduct),
    constraint fk_product_seller foreign key (idPseller)
        references seller (idSeller),
    constraint fk_product_product foreign key (idProduct)
        references product (idProduct)
);
 
create table productOrder (
    idPOproduct int,
    idOrder int,
    prodQuantity int default 1,
    primary key (idPOproduct , idPOrder),
    constraint fk_product_seller foreign key (idPOproduct)
        references seller (idProduct),
    constraint fk_product_product foreign key (idPOorder)
        references product (idOrder)
);
 
create table storageLocation (
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct , idLstorage),
    constraint fk_product_seller foreign key (idLproduct)
        references product (idProduct),
    constraint fk_product_product foreign key (idLstorage)
        references orders (productSeller)
);
