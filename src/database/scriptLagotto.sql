CREATE DATABASE Lagotto;

USE Lagotto;

CREATE TABLE Endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep VARCHAR(9) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero INT NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estadoSigla VARCHAR(2) NOT NULL,
    coordX INT,
    coordY INT
);

CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    ativo TINYINT,
    fkEndereco INT NOT NULL,
CONSTRAINT fkEnderecoEmpresa
	FOREIGN KEY(fkEndereco)
    REFERENCES Endereco(idEndereco)
);

CREATE TABLE Funcionario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    senha VARCHAR(200),
    email VARCHAR(200),
    fkEmpresa INT NOT NULL,
    ativo TINYINT NOT NULL,
    isAdmin TINYINT NOT NULL,
CONSTRAINT fkFuncionarioEmpresa
	FOREIGN KEY(fkEmpresa)
    REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Plantio (
	idPlantio INT PRIMARY KEY AUTO_INCREMENT,
	fkEmpresa INT NOT NULL,
    fkEndereco INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
CONSTRAINT fkPlantioEmpresa
	FOREIGN KEY(fkEmpresa)
    REFERENCES Empresa(idEmpresa),
CONSTRAINT fkPlantioEndereco
	FOREIGN KEY(fkEndereco)
    REFERENCES Endereco(idEndereco)
);

CREATE TABLE Regiao (
	fkPlantio INT NOT NULL,
    idRegiao INT NOT NULL,
    descricao VARCHAR(40),
    areaCapturaM2 INT,
CONSTRAINT fkRegiaoPlantio
	FOREIGN KEY(fkPlantio)
    REFERENCES Plantio(idPlantio),
PRIMARY KEY(fkPlantio, idRegiao)
);

CREATE TABLE DadosSensor (
	idDadosSensor INT PRIMARY KEY AUTO_INCREMENT,
    data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    umidade DECIMAL(4, 2) NOT NULL,
    fkPlantio INT NOT NULL,
    fkRegiao INT NOT NULL,
CONSTRAINT fkDadosRegiao
	FOREIGN KEY(fkPlantio, fkRegiao)
    REFERENCES Regiao(fkPlantio, idRegiao)
);

-- Inserindo endereços (8 no total: 2 empresas + 4 plantios + 2 funcionários fictícios se quiser depois)
INSERT INTO Endereco (cep, logradouro, numero, cidade, estadoSigla, coordX, coordY) VALUES
('12345-000', 'Rua das Trufas', 100, 'TrufaVille', 'SP', 250, 150),       -- id 1 - Empresa 1
('23456-000', 'Av. dos Fungos', 200, 'Belo Horizonte', 'SP', 260, 160),       -- id 2 - Empresa 2
('34567-000', 'Sítio das Árvores', 1, 'São Paulo', 'SP', 190, 90),       -- id 3 - Plantio 1 da Empresa 1
('45678-000', 'Fazenda do Carvalho', 2, 'Campestre', 'MG', 220, 180),     -- id 4 - Plantio 2 da Empresa 1
('56789-000', 'Trufalândia Norte', 3, 'Interiorzão', 'PR', 290, 190),     -- id 5 - Plantio 1 da Empresa 2
('67890-000', 'Trufalândia Sul', 4, 'Interiorzão', 'PR', 300, 200),       -- id 6 - Plantio 2 da Empresa 2
('01414-000', 'Haddock Lobo', 200, 'Av. Paulista', 'SP', 310, 210);       -- id 7 - Lagotto

SELECT * FROM Endereco;
-- Inserindo empresas
INSERT INTO Empresa (nome, cnpj, ativo, fkEndereco) VALUES
('Trufas Nobres LTDA', '12345678000199', 1, 1),
('Trufas do Sul SA', '98765432000188', 1, 2);

INSERT INTO Empresa (nome, cnpj, ativo, fkEndereco) VALUES
('Lagotto', '234567213413', 1, 7);

-- Inserindo usuários administradores
INSERT INTO Funcionario (nome, senha, email, fkEmpresa, ativo, isAdmin) VALUES
('Admin Trufas Nobres', 'senha123', 'admin1@gmail.com', 1, 1, 1),
('Admin Trufas do Sul', 'senha123', 'admin2@gmail.com', 2, 1, 1),
('Admin Lagotto', 'senha123', 'admin1@lagotto.com', 3, 1, 1);

-- Inserindo plantios
INSERT INTO Plantio (fkEmpresa, fkEndereco, nome) VALUES
(1, 3, 'Plantio Campestre A'), -- id 1
(1, 4, 'Plantio Campestre B'), -- id 2
(2, 5, 'Plantio Trufas Norte'),-- id 3
(2, 6, 'Plantio Trufas Sul');  -- id 4

-- Inserindo regiões (A a F para cada plantio)
-- Usaremos sempre área de captura = 50 m2
INSERT INTO Regiao (fkPlantio, idRegiao, descricao, areaCapturaM2) VALUES
(1, 1, 'Região A', 50),
(1, 2, 'Região B', 50),
(1, 3, 'Região C', 50),
(1, 4, 'Região D', 50),
(1, 5, 'Região E', 50),
(1, 6, 'Região F', 50),
(1, 7, 'Região G', 50),
(1, 8, 'Região H', 50),

(2, 1, 'Região A', 50),
(2, 2, 'Região B', 50),
(2, 3, 'Região C', 50),
(2, 4, 'Região D', 50),
(2, 5, 'Região E', 50),
(2, 6, 'Região F', 50),
(2, 7, 'Região G', 50),
(2, 8, 'Região H', 50),

(3, 1, 'Região A', 50),
(3, 2, 'Região B', 50),
(3, 3, 'Região C', 50),
(3, 4, 'Região D', 50),
(3, 5, 'Região E', 50),
(3, 6, 'Região F', 50),
(3, 7, 'Região G', 50),
(3, 8, 'Região H', 50),

(4, 1, 'Região A', 50),
(4, 2, 'Região B', 50),
(4, 3, 'Região C', 50),
(4, 4, 'Região D', 50),
(4, 5, 'Região E', 50),
(4, 6, 'Região F', 50),
(4, 7, 'Região G', 50),
(4, 8, 'Região H', 50);

INSERT INTO DadosSensor(umidade, fkPlantio, fkRegiao) VALUES
	(38, 1, 1),
    (42, 1, 2),
    (35, 1, 3),
    (44, 1, 4),
    (29, 1, 5),
    (32, 1, 6),
    (28, 1, 7),
    (32, 1, 8),

	(39, 2, 1),
    (35, 2, 2),
    (37, 2, 3),
    (41, 2, 4),
    (31, 2, 5),
    (28, 2, 6),
    (33, 1, 6),
    (44, 1, 6);
    
SELECT 
	end.coordX, 
	end.coordY,
	end.logradouro,
	end.cidade, 
	end.estadoSigla
FROM Plantio
INNER JOIN Endereco end ON end.idEndereco = Plantio.fkEndereco
WHERE Plantio.fkEmpresa = 1;

TRUNCATE TABLE DadosSensor;

SELECT COUNT(*) FROM DadosSensor;

SELECT * FROM DadosSensor
ORDER BY data DESC
LIMIT 10;

SELECT  DadosSensor.idDadosSensor,
		Regiao.descricao,
		DATE_FORMAT(DadosSensor.data, "%d/%m %H:%i:%S") as data,
		DadosSensor.umidade
FROM DadosSensor
INNER JOIN Regiao ON DadosSensor.fkRegiao = Regiao.idRegiao AND DadosSensor.fkPlantio = Regiao.fkPlantio
WHERE DadosSensor.fkPlantio = 1
	AND DadosSensor.fkRegiao = 1
ORDER BY data DESC
LIMIT 10;