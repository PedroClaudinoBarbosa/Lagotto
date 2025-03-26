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
    
	foreign key (fk_cargo) references cargo(id)
);

create table estufa(
	id int primary key auto_increment,
    nome varchar(50)
);

create table arvore(
	id int primary key auto_increment,
    posicao varchar(10) not null, -- matriz [linha, coluna] A1, A2, A3, B1, B2, B3, ...
    fk_estufa int not null,
    
    foreign key (fk_estufa) references estufa(id)
);

create table umidade_arvore(
	id int primary key auto_increment,
    umidade decimal(5, 2) not null,
    fk_arvore int not null,
    
    foreign key (fk_arvore) references arvore(id)
);
create index idx_umidade on umidade_arvore (umidade);