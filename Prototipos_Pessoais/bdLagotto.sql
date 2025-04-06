create database lagotto;
use lagotto;

-- tabela empresa
create table empresa (
    id_empresa int auto_increment primary key,
    nome varchar(100) not null,
    cnpj varchar(20) unique
);

-- tabela representante
create table representante (
    id_representante int auto_increment primary key,
    nome varchar(100) not null,
    telefone varchar(20),
    email varchar(100),
    id_empresa int,
    foreign key (id_empresa) references empresa(id_empresa)
);

-- tabela hectare
create table hectare (
    id_hectare int auto_increment primary key,
    codigo varchar(50) not null,
    localizacao text,
    id_empresa int,
    foreign key (id_empresa) references empresa(id_empresa)
);

-- tabela arvore
create table arvore (
    id_arvore int auto_increment primary key,
    localizacaoArvore varchar(30),
    id_hectare int,
    foreign key (id_hectare) references hectare(id_hectare)
);

-- tabela sensor
create table sensor (
    id_sensor int auto_increment primary key,
    localizacaoSensor varchar(30),
    id_arvore int,
    foreign key (id_arvore) references arvore(id_arvore)
);

-- tabela dadossensor
create table dadosSensor (
    id_dado int auto_increment primary key,
    id_sensor int,
    data_hora datetime,
    valor float,
    foreign key (id_sensor) references sensor(id_sensor),
    foreign key (id_empresa) references empresa(id_empresa)
);
