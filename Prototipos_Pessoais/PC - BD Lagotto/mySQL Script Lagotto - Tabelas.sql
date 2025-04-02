-- Criar o banco de dados
create database lagotto;
use lagotto;

-- Criar a tabela empresa
create table empresa (
    idempresa int auto_increment primary key,
    nome varchar(200) not null,
    email varchar(200) not null unique,
    senha varchar(100) not null,
    cnpj char(14) not null unique,
    telefone char(8),
    celular char(11),
    endereco varchar(100)
);

-- Criar a tabela usuario
create table usuario (
    idusuario int auto_increment primary key,
    nome varchar(40) not null,
    pin int not null,
    empresa_idempresa int not null,
    foreign key (empresa_idempresa) references empresa(idempresa) on delete cascade
);

-- Criar a tabela hectare
create table hectare (
    idhectare int auto_increment primary key,
    qtarvores int not null,
    usuario_idusuario int not null,
    foreign key (usuario_idusuario) references usuario(idusuario) on delete cascade
);

-- Criar a tabela arvore
create table arvore (
    idarvore int auto_increment primary key,
    umidade varchar(45),
    data varchar(45),
    hectare_idhectare int not null,
    hectare_usuario_idusuario int not null,
    foreign key (hectare_idhectare) references hectare(idhectare) on delete cascade,
    foreign key (hectare_usuario_idusuario) references usuario(idusuario) on delete cascade
);
