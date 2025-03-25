use lagotto;

-- Inserindo dados na tabela cultivo
insert into cultivo (area_cultivo) 
values
(1000),  -- 1 hectare
(1500),  -- 1.5 hectares
(2000);  -- 2 hectares

-- Inserindo 10 árvores nas áreas de cultivo

-- Árvores para a área de cultivo 1
insert into arvore (tipo_arvore, lat_arvore, long_arvore, umidade_arvore, fk_cultivo) 
values
('Carvalho', 123456, 654321, 75, 1),
('Carvalho', 123457, 654322, 78, 1),
('Carvalho', 123458, 654323, 80, 1),
('Carvalho', 123459, 654324, 72, 1),
('Carvalho', 123460, 654325, 74, 1);

-- Árvores para a área de cultivo 2
insert into arvore (tipo_arvore, lat_arvore, long_arvore, umidade_arvore, fk_cultivo) 
values
('Carvalho', 223456, 754321, 70, 2),
('Carvalho', 223457, 754322, 76, 2),
('Carvalho', 223458, 754323, 78, 2),
('Carvalho', 223459, 754324, 69, 2);

-- Árvores para a área de cultivo 3
insert into arvore (tipo_arvore, lat_arvore, long_arvore, umidade_arvore, fk_cultivo) 
values
('Carvalho', 323456, 854321, 73, 3),
('Carvalho', 323457, 854322, 75, 3);

-- Inserindo dados na tabela usuario
insert into usuario (nome_usuario, email_usuario, senha_usuario) 
values
('Carlos Pereira', 'carlos.pereira@example.com', 'senha123'),
('Ana Souza', 'ana.souza@example.com', 'senha456'),
('Felipe Oliveira', 'felipe.oliveira@example.com', 'senha789');
