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
  
CREATE TABLE payments (
    idclient INT,
    idPayment INT,
    typePayment ENUM('Cartão', 'Boleto', 'Pix'),
    limitAvailable FLOAT,
    PRIMARY KEY (idClient , idPayment)
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
   
CREATE TABLE productSeller (
    idPseller INT,
    idProduct INT,
    prodQuantity INT NOT NULL DEFAULT 1,
    PRIMARY KEY (idPseller , idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller)
        REFERENCES seller (idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct)
        REFERENCES product (idProduct)
);
 
CREATE TABLE productOrder (
    idPOproduct INT,
    idOrder INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPOproduct , idPOrder),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPOproduct)
        REFERENCES seller (idProduct),
    CONSTRAINT fk_product_product FOREIGN KEY (idPOorder)
        REFERENCES product (idOrder)
);
 
CREATE TABLE storageLocation (
    idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct , idLstorage),
    CONSTRAINT fk_product_seller FOREIGN KEY (idLproduct)
        REFERENCES product (idProduct),
    CONSTRAINT fk_product_product FOREIGN KEY (idLstorage)
        REFERENCES orders (productSeller)
)