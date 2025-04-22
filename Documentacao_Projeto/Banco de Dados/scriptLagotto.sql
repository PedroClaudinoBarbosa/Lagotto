CREATE DATABASE Lagotto;

USE Lagotto;

CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    CNPJ VARCHAR(20),
    situacao VARCHAR(8),
CONSTRAINT chkSituacaoEmpresa
	CHECK(situacao IN('Ativo', 'Inativo')));
    
CREATE TABLE Funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60),
    email VARCHAR(100),
    senha VARCHAR(200),
    situacao VARCHAR(15),
    isAdmin BOOL,
    fkEmpresa INT,
CONSTRAINT chkSituacaoFuncionario
	CHECK(situacao IN('Ativo', 'Inativo')),
CONSTRAINT fkFuncionarioEmpresa
	FOREIGN KEY(fkEmpresa) REFERENCES Empresa(idEmpresa));
    
CREATE TABLE Telefone (
	fkFuncionario INT,
    idTelefone INT,
    numeroTelefone VARCHAR(18),
    tipoTelefone VARCHAR(15),
CONSTRAINT chk_tipoTelefone
	CHECK(tipoTelefone IN('Móvel', 'Fixo')),
CONSTRAINT fkFuncionarioTelefone
	FOREIGN KEY(fkFuncionario) REFERENCES Funcionario(idFuncionario),
PRIMARY KEY(fkFuncionario, idTelefone));

CREATE TABLE Plantio (
	idPlantio INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(200),
    fkEmpresa INT,
CONSTRAINT fkEmpresaPlantio
	FOREIGN KEY(fkEmpresa) REFERENCES Empresa(idEmpresa));

CREATE TABLE Sensor (
	fkPlantio INT,
    idSensor INT,
	localizacao VARCHAR(100),
    areaCapturaM2 INT,
CONSTRAINT fkPlantioSensor
	FOREIGN KEY(fkPlantio) REFERENCES Plantio(idPlantio),
PRIMARY KEY(fkPlantio, idSensor));

CREATE TABLE DadosSensor (
	idDadosSensor INT PRIMARY KEY AUTO_INCREMENT,
    data DATETIME DEFAULT CURRENT_TIMESTAMP(),
    umidade DECIMAL(4,2),
    fkPlantio INT,
    fkSensor INT,
CONSTRAINT fkSensorDados
	FOREIGN KEY(fkPlantio, fkSensor) 
    REFERENCES Sensor(fkPlantio, idSensor));
    
INSERT INTO Empresa (nome, CNPJ, situacao) VALUES
('Trufas da Serra', '12.345.678/0001-90', 'Ativo'),
('Raízes Nobres', '98.765.432/0001-12', 'Ativo');

-- Empresa 1
INSERT INTO Funcionario (nome, email, senha, situacao, isAdmin, fkEmpresa) VALUES
('Ana Oliveira', 'ana@trufas.com', 'senha123', 'Ativo', TRUE, 1),
('Carlos Souza', 'carlos@trufas.com', 'senha456', 'Ativo', FALSE, 1),
('Júlia Ribeiro', 'julia@trufas.com', 'senha789', 'Ativo', FALSE, 1);

-- Empresa 2
INSERT INTO Funcionario (nome, email, senha, situacao, isAdmin, fkEmpresa) VALUES
('Fernanda Lima', 'fernanda@raizes.com', 'senha321', 'Ativo', TRUE, 2),
('Ricardo Martins', 'ricardo@raizes.com', 'senha654', 'Ativo', FALSE, 2),
('Beatriz Campos', 'beatriz@raizes.com', 'senha987', 'Ativo', FALSE, 2);

-- Ana (2 telefones)
INSERT INTO Telefone (fkFuncionario, idTelefone, numeroTelefone, tipoTelefone) VALUES
(1, 1, '(11) 91234-5678', 'Móvel'),
(1, 2, '(11) 3344-5566', 'Fixo');

-- Carlos
INSERT INTO Telefone (fkFuncionario, idTelefone, numeroTelefone, tipoTelefone) VALUES
(2, 1, '(11) 99887-7766', 'Móvel');

-- Júlia
INSERT INTO Telefone (fkFuncionario, idTelefone, numeroTelefone, tipoTelefone) VALUES
(3, 1, '(11) 93322-1144', 'Móvel');

-- Fernanda (2 telefones)
INSERT INTO Telefone (fkFuncionario, idTelefone, numeroTelefone, tipoTelefone) VALUES
(4, 1, '(21) 97766-5544', 'Móvel'),
(4, 2, '(21) 2222-3344', 'Fixo');

-- Ricardo
INSERT INTO Telefone (fkFuncionario, idTelefone, numeroTelefone, tipoTelefone) VALUES
(5, 1, '(21) 98888-1122', 'Móvel');

-- Beatriz
INSERT INTO Telefone (fkFuncionario, idTelefone, numeroTelefone, tipoTelefone) VALUES
(6, 1, '(21) 96666-7788', 'Móvel');

-- Empresa 1
INSERT INTO Plantio (endereco, fkEmpresa) VALUES
('Estrada da Serra, Km 12 - São Bento do Sul', 1),
('Fazenda do Cedro - Interior de Joinville', 1);

-- Empresa 2
INSERT INTO Plantio (endereco, fkEmpresa) VALUES
('Sítio Boa Esperança - Canela', 2),
('Chácara Estrela - Gramado', 2);

-- Plantio 1
INSERT INTO Sensor (fkPlantio, idSensor, localizacao, areaCapturaM2) VALUES
(1, 1, 'Região Norte', 25),
(1, 2, 'Região Sul', 20);

-- Plantio 2
INSERT INTO Sensor (fkPlantio, idSensor, localizacao, areaCapturaM2) VALUES
(2, 1, 'Região Central', 30),
(2, 2, 'Região Leste', 18);

-- Plantio 3
INSERT INTO Sensor (fkPlantio, idSensor, localizacao, areaCapturaM2) VALUES
(3, 1, 'Setor 1', 22),
(3, 2, 'Setor 2', 20);

-- Plantio 4
INSERT INTO Sensor (fkPlantio, idSensor, localizacao, areaCapturaM2) VALUES
(4, 1, 'Área A', 35),
(4, 2, 'Área B', 15);

-- Plantio 1
INSERT INTO DadosSensor (umidade, fkPlantio, fkSensor) VALUES
(35.2, 1, 1),
(36.1, 1, 1),
(38.0, 1, 2),
(37.5, 1, 2);

-- Plantio 2
INSERT INTO DadosSensor (umidade, fkPlantio, fkSensor) VALUES
(34.5, 2, 1),
(33.7, 2, 1),
(32.2, 2, 2);

-- Plantio 3
INSERT INTO DadosSensor (umidade, fkPlantio, fkSensor) VALUES
(31.0, 3, 1),
(30.5, 3, 2),
(29.9, 3, 2);

-- Plantio 4
INSERT INTO DadosSensor (umidade, fkPlantio, fkSensor) VALUES
(27.3, 4, 1),
(28.4, 4, 1),
(26.9, 4, 2);

SELECT * FROM Empresa;