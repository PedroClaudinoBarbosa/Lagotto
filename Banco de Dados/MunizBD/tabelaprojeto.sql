create database sprint;
use sprint;

-- criando tabela login para salvar os dados de cadastro do usuário
create table login (
idUsuario int primary key auto_increment,
nomeusuario varchar(50),
email varchar(100),
senha char(8)
);

-- inserindo dados na tabela usuário
insert into login ( nomeusuario, email, senha) values
('Muniz', 'gustavomunizoliveira@gmail.com', 87654321),
('Arthur', 'arthur.ferreira@gmail.com', 12345678),
('Bianca', 'biagreggio@gmail.com', 24681012),
('Thiago', 'thiagoakihito@gmail.com',13579111);

desc login;
-- criando tabela para armazenar os dados do sensor
create table sensor (
    idSensor int primary key auto_increment,
    porcentagem int,
    umidade varchar(50)
);

-- inserindo valores do sensor
insert into sensor (porcentagem, umidade) values
(80, 'alta'),
(50, 'baixa'),
(60, 'baixa'),
(70, 'ideal');

-- criando tabela para armazenar os dados de cada cliente
create table cliente (
    idCliente int primary key auto_increment,
    nome varchar(100),
    localizacao varchar(200),
    dtInstalacao date,
    idSensor int,
    foreign key (idSensor) references sensor(idSensor)
    );
    
-- inserindo dados na tabela dos clientes
insert into cliente (nome, localizacao, dtInstalacao) values
('Muniz', 'Guilhermina', 2025-03-10),
('Thiago', 'Santo André', 2025-01-15),
('Arthur', 'Patriarca', 2025-02-05);


create table plantacao(
idPlant int primary key auto_increment,
hectar int not null,
qtdArvore int not null
);