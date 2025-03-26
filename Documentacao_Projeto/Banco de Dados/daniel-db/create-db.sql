-- Criando o banco de dados (Lagotto)
create database lagotto;
-- Usando o banco de dados (Lagotto)
use lagotto;

-- Criando tabela (cultivo)
create table cultivo(
	id_cultivo 	int not null auto_increment,
	area_cultivo	int not null,
	primary key(id_cultivo)
);

-- Criando tabela (arvore)
create table arvore(
	id_arvore 		int not null auto_increment,
	tipo_arvore 	varchar(50) not null,
    lat_arvore		int,
    long_arvore 	int,
    umidade_arvore	int not null default 0,
    fk_cultivo 		int not null,
	primary key(id_arvore),
	constraint fk_arvore_cultivo foreign key(fk_cultivo) references cultivo(id_cultivo)
);

-- Criando tabela (usuario)
create table usuario(
	id_usuario			int not null auto_increment,
    nome_usuario		varchar(50) not null,
    email_usuario		varchar(80) not null,
    senha_usuario		varchar(80) not null,
    criado_em 			datetime default current_timestamp,
	primary key(id_usuario)
);