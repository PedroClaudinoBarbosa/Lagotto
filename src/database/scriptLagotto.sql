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

CREATE TABLE Fazenda (
	idFazenda INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
	fkEmpresa INT NOT NULL,
    fkEndereco INT NOT NULL,
CONSTRAINT fkEmpresaFazenda
	FOREIGN KEY(fkEmpresa)
    REFERENCES Empresa(idEmpresa),
CONSTRAINt fkEnderecoFazenda
	FOREIGN KEY(fkEndereco)
	REFERENCES Endereco(idEndereco)
);

CREATE TABLE Plantio (
	idPlantio INT PRIMARY KEY AUTO_INCREMENT,
	fkFazenda INT NOT NULL,
CONSTRAINT fkPlantioFazenda
	FOREIGN KEY(fkFazenda)
    REFERENCES Fazenda(idFazenda)
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
('23456-000', 'Av. dos Fungos', 200, 'Belo Horizonte', 'MG', 260, 160),   -- id 2 - Fazenda 1 da Empresa 1
('34567-000', 'Sítio das Árvores', 1, 'São Paulo', 'SP', 190, 90),        -- id 3 - Fazenda 2 da Empresa 1
('45678-000', 'Fazenda do Carvalho', 2, 'Campestre', 'MG', 220, 180),     -- id 4 - Fazenda 3 da Empresa 1
('01414-000', 'Haddock Lobo', 200, 'Av. Paulista', 'SP', 310, 210);       -- id 5 - Lagotto

SELECT * FROM Endereco;
-- Inserindo empresas
INSERT INTO Empresa (nome, cnpj, ativo, fkEndereco) VALUES
('Trufas Nobres LTDA', '12345678000199', 1, 1);

INSERT INTO Empresa (nome, cnpj, ativo, fkEndereco) VALUES
('Lagotto', '234567213413', 1, 5);

-- Inserindo usuários administradores
INSERT INTO Funcionario (nome, senha, email, fkEmpresa, ativo, isAdmin) VALUES
('Admin Trufas Nobres', 'senha123', 'admin1@gmail.com', 1, 1, 1),
('Admin Lagotto', 'senha123', 'admin1@lagotto.com', 2, 1, 1);

-- Inserindo fazendas
INSERT INTO Fazenda (fkEmpresa, fkEndereco, nome) VALUES
(1, 2, 'Fazenda Campestre A'), -- id 2
(1, 3, 'Fazenda Campestre B'),	-- id 3
(1, 4, 'Fazenda Trufas Negras'); -- id 4

-- Inserindo plantios
INSERT INTO Plantio (fkFazenda) VALUES
	(1), (1), (1), (2), (2), (2), (3), (3);

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
(4, 8, 'Região H', 50),

(5, 1, 'Região A', 50),
(5, 2, 'Região B', 50),
(5, 3, 'Região C', 50),
(5, 4, 'Região D', 50),
(5, 5, 'Região E', 50),
(5, 6, 'Região F', 50),
(5, 7, 'Região G', 50),
(5, 8, 'Região H', 50),

(6, 1, 'Região A', 50),
(6, 2, 'Região B', 50),
(6, 3, 'Região C', 50),
(6, 4, 'Região D', 50),
(6, 5, 'Região E', 50),
(6, 6, 'Região F', 50),
(6, 7, 'Região G', 50),
(6, 8, 'Região H', 50),

(7, 1, 'Região A', 50),
(7, 2, 'Região B', 50),
(7, 3, 'Região C', 50),
(7, 4, 'Região D', 50),
(7, 5, 'Região E', 50),
(7, 6, 'Região F', 50),
(7, 7, 'Região G', 50),
(7, 8, 'Região H', 50),

(8, 1, 'Região A', 50),
(8, 2, 'Região B', 50),
(8, 3, 'Região C', 50),
(8, 4, 'Região D', 50),
(8, 5, 'Região E', 50),
(8, 6, 'Região F', 50),
(8, 7, 'Região G', 50),
(8, 8, 'Região H', 50);

DELIMITER $$

DROP PROCEDURE IF EXISTS gerar_dados_sensor $$
CREATE PROCEDURE gerar_dados_sensor()
BEGIN
    DECLARE data_atual DATETIME;
    DECLARE id_plantio INT;
    DECLARE id_regiao INT;
    DECLARE i_dia INT;
    DECLARE i_hora INT;
    DECLARE umidade DECIMAL(4,2);
    DECLARE done INT DEFAULT 0;
    
    -- Cursor para regiões
    DECLARE cur CURSOR FOR 
        SELECT fkPlantio, idRegiao FROM Regiao 
        WHERE fkPlantio BETWEEN 1 AND 8;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    SET i_dia = 0;

    WHILE i_dia < 30 DO
        SET i_hora = 0;

        WHILE i_hora < 24 DO
            SET data_atual = DATE_SUB(DATE('2025-06-17'), INTERVAL i_dia DAY) + INTERVAL i_hora HOUR;

            -- Abre o cursor para as regiões
            OPEN cur;
            
            read_loop: LOOP
                FETCH cur INTO id_plantio, id_regiao;
                IF done THEN
                    LEAVE read_loop;
                END IF;

                -- Gera umidade aleatória entre 29.8 e 40.3
                SET umidade = ROUND(29.8 + (RAND() * 10.5), 2);

                -- Insere o dado
                INSERT INTO DadosSensor (data, umidade, fkPlantio, fkRegiao)
                VALUES (data_atual, umidade, id_plantio, id_regiao);
            END LOOP;

            CLOSE cur;

            -- Reset done para o próximo cursor
            SET done = 0;

            SET i_hora = i_hora + 1;
        END WHILE;

        SET i_dia = i_dia + 1;
    END WHILE;
END $$
DELIMITER ;

TRUNCATE TABLE DadosSensor;
ALTER TABLE DadosSensor AUTO_INCREMENT = 1;

-- Executa o procedimento
CALL gerar_dados_sensor();

SELECT  
	(SELECT COUNT(*)
    FROM Fazenda
    WHERE fkEmpresa = 1) AS qtdFazendas,
	Fazenda.nome,
	Plantio.idPlantio,
	Endereco.estadoSigla,
	COUNT(fkPlantio) as qtdRegioes
FROM Fazenda
INNER JOIN Plantio ON Fazenda.idFazenda = Plantio.fkFazenda
INNER JOIN Endereco ON Fazenda.fkEndereco = Endereco.idEndereco
INNER JOIN Regiao ON Plantio.idPlantio = Regiao.fkPlantio
WHERE Fazenda.fkEmpresa = 1
	GROUP BY Fazenda.nome, Plantio.idPlantio, Endereco.estadoSigla;
    
SELECT * FROM DadosSensor;

SELECT 
            DadosSensor.idDadosSensor,
            CONCAT(
                DATE_FORMAT(DadosSensor.data, '%d/%m/%Y - %H:%i:%s'),
                ' (',
                CASE DAYOFWEEK(DadosSensor.data)
                    WHEN 1 THEN 'Domingo'
                    WHEN 2 THEN 'Segunda'
                    WHEN 3 THEN 'Terça'
                    WHEN 4 THEN 'Quarta'
                    WHEN 5 THEN 'Quinta'
                    WHEN 6 THEN 'Sexta'
                    WHEN 7 THEN 'Sábado'
                END,
                ')'
            ) AS data,
            DadosSensor.umidade,
            DadosSensor.fkPlantio,
            DadosSensor.fkRegiao
        FROM 
            DadosSensor
        WHERE 
            DadosSensor.fkPlantio = 1
            AND DadosSensor.fkRegiao = 4
            AND DadosSensor.data >= NOW() - INTERVAL 1 DAY
            AND DadosSensor.data < NOW()
        ORDER BY 
            DadosSensor.data DESC;