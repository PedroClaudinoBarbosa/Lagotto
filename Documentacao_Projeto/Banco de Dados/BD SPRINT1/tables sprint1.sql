create database lagotto;

use lagotto;

create table cargo(
	id int primary key auto_increment,
    nome varchar(20) unique,
    
    constraint chk_nome_cargo check(nome in ("adm", "analista"))
);

create table usuario(
	id int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(150) not null,
    senha varchar(50) not null,
    fk_cargo int,
    
	constraint fk_usuario_cargo foreign key (fk_cargo) references cargo(id)
);

create table plantio(
	id int primary key auto_increment,
    nome varchar(50)
);

create table arvore(
	id int primary key auto_increment,
    posicao varchar(10) not null, -- matriz [linha, coluna] A1, A2, A3, B1, B2, B3, ...
    fk_plantio int not null,
    
    constraint fk_arvore_plantio foreign key (fk_plantio) references plantio(id)
);

create table umidade_arvore(
	id int primary key auto_increment,
    umidade decimal(5, 2) not null,
    horario datetime default current_timestamp(),
    fk_arvore int not null,
    
    constraint fk_umidade_arvore foreign key (fk_arvore) references arvore(id)
);
create index idx_umidade on umidade_arvore (umidade);