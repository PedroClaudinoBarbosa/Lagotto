use lagotto;

-- inseririndo cargos
insert into cargo (nome) values
("adm"),
("analista");

-- inserindo usuários (administradores e analistas)
insert into usuario (nome, email, senha, fk_cargo) values
("João Silva", "joao@email.com", "senha123", 1),
("Maria Souza", "maria@email.com", "senha123", 2),
("Carlos Mendes", "carlos@email.com", "senha123", 2),
("Ana Lima", "ana@email.com", "senha456", 2),
("Pedro Rocha", "pedro@email.com", "senha789", 2),
("Juliana Alves", "juliana@email.com", "senha321", 2),
("Marcos Vieira", "marcos@email.com", "senha654", 1);

-- inserindo estufas
insert into estufa (nome) values
("Estufa Norte"),
("Estufa Sul"),
("Estufa Leste"),
("Estufa Oeste"),
("Estufa Central");

-- inserindo árvores (com diferentes posições e estufas) modelo -> matriz
insert into arvore (posicao, fk_estufa) values
("A1", 1), ("A2", 1), ("A3", 1), 
("A1", 2), ("A2", 2), ("B1", 2), ("B2", 2), 
("A1", 3), ("B1", 3), ("C1", 3), ("E1", 3), 
("A1", 4), ("A2", 4), ("B1", 4), ("C1", 4), ("C2", 4),
("E1", 5), ("E2", 5), ("E3", 5), ("E4", 5), ("E5", 5);

-- inserindo dados de umidade para as árvores
insert into umidade_arvore (umidade, fk_arvore) values 
(65.4, 1), (72.1, 1), (68.3, 1),
(58.2, 2), (74.5, 2), (79.1, 3), -- 58.2 está inadequada
(80.5, 4), (62.7, 5), (77.3, 6), 
(81.2, 7), (60.1, 8), (70.5, 9), -- 81.2 está inadequada
(75.3, 10), (68.9, 11), (72.6, 12), 
(85.0, 13), (67.4, 14), (74.8, 15), -- 85.0 está inadequada
(59.5, 16), (78.3, 17), (65.8, 18), -- 59.5 está inadequada
(66.2, 19), (71.4, 20), (76.9, 21), 
(55.2, 3), (83.1, 5), (64.7, 7), -- 55.2 e 83.1 estão inadequadas
(69.0, 9), (73.6, 11), (78.4, 13), 
(88.0, 15), (61.3, 17), (79.9, 19), -- 88.0 está inadequada
(77.5, 21), (63.2, 2), (74.1, 4), 
(67.9, 6), (70.2, 8), (80.3, 10);