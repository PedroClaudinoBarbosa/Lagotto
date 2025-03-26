create database trufas;

use trufas;

create table usuario
(id		int primary key auto_increment,
nome varchar (60),
email varchar(60),
senha varchar(50));

INSERT INTO usuario (nome, email, senha) VALUES
('Carlos Silva', 'carlos.silva@example.com', 'senha123'),
('Ana Costa', 'ana.costa@example.com', 'minhasenha2025'),
('Pedro Almeida', 'pedro.almeida@example.com', 'pedro2025@123'),
('Mariana Santos', 'mariana.santos@example.com', 'marianasenha22'),
('João Oliveira', 'joao.oliveira@example.com', 'joaoseguro2025'),
('Fernanda Lima', 'fernanda.lima@example.com', 'fernanda321'),
('Lucas Pereira', 'lucas.pereira@example.com', 'lucaspereira2025'),
('Juliana Rocha', 'juliana.rocha@example.com', 'juliana@1234');

select *from usuario where nome like '%a%';

select senha, nome from usuario where nome like '%a';

select *from usuario;

select *from usuario where id = '1';

create table plantio
(
id int primary key auto_increment,
hectare numeric,
qtdArvores numeric,
sensores numeric);

alter table plantio add column fkfazenda int;
alter table plantio add foreign key (fkfazenda) references trufas (idFazenda);

INSERT INTO plantio (hectare, qtdArvores, sensores)
VALUES (2, 729, 729),
(4, 1200, 1200),
(7,1824, 1824),
(8,5302,5302),
(5,1320, 1320),
(1,800, 800);

select *from plantio order by hectare;

select qtdArvores, hectare from plantio;

select *from plantio order by id;

select *from plantio where id = 4;




create table trufas
(idFazenda int primary key auto_increment,
crescimento varchar(20),
 constraint chkcrescimento check (crescimento in('ruim', 'medio', 'otimo')),
kg numeric,
tempo numeric);

INSERT INTO trufas (crescimento, kg, tempo) VALUES
('ruim', 150, 2),
('medio', 320, 3),
('otimo', 500, 1),
('medio', 250, 2),
('ruim', 100, 4),
('otimo', 600, 1),
('medio', 180, 3),
('otimo', 450, 1);

select crescimento, tempo from trufas order by crescimento;

select kg from trufas order by kg;

select *from trufas order by tempo;



create table monitoramento
(id int primary key auto_increment,
umidadeMedia  numeric,
fkfazenda int,
foreign key (fkfazenda) references trufas(idFazenda));

INSERT INTO monitoramento (umidadeMedia, fkfazenda) VALUES
(75, 1),
(60, 2),
(80, 3),
(65, 1),
(72, 2),
(78, 3),
(69, 1),
(77, 2);

select *from monitoramento where id = '4';

select umidadeMedia, id from monitoramento order by umidadeMedia;

select *from monitoramento where umidadeMedia between 60 and 75;
