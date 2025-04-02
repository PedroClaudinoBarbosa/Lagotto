('floresta verde ltda', 'contato@florestaverde.com', 'senha123', '12345678000195', '34567890', '11987654321', 'rua das árvores, 100'),
('reflorestamento brasil', 'admin@reflorbrasil.com', 'admin456', '98765432000132', '33445566', '11912345678', 'av. sustentável, 50'),
('eco árvores', 'suporte@ecoarvores.com', 'eco123', '55588877000122', '33221144', '11987651234', 'rua ecológica, 200'),
('ambiental forte', 'info@ambientalforte.com', 'forte2024', '77799966000155', '33447788', '11999887766', 'av. das florestas, 300');

insert into usuario (nome, pin, empresa_idempresa) values
('carlos silva', 1234, 1),
('ana souza', 5678, 2),
('marcos pereira', 4321, 1),
('juliana alves', 1111, 3),
('fernando costa', 2222, 4),
('patricia menezes', 3333, 2);

insert into hectare (qtarvores, usuario_idusuario) values
(100, 1),
(200, 2),
(150, 3),
(180, 4),
(220, 5),
(90, 6),
(300, 1),
(250, 2);

insert into arvore (umidade, data, hectare_idhectare, hectare_usuario_idusuario) values
('70%', '2024-03-01', 1, 1),
('65%', '2024-03-02', 2, 2),
('80%', '2024-03-03', 3, 3),
('75%', '2024-03-04', 1, 1),
('60%', '2024-03-05', 2, 2),
('55%', '2024-03-06', 4, 4),
('90%', '2024-03-07', 5, 5),
('45%', '2024-03-08', 6, 6),
('85%', '2024-03-09', 3, 3),
('68%', '2024-03-10', 4, 4),
('72%', '2024-03-11', 5, 5),
('50%', '2024-03-12', 6, 6),
('77%', '2024-03-13', 1, 1),
('62%', '2024-03-14', 2, 2),
('91%', '2024-03-15', 7, 1),
('58%', '2024-03-16', 8, 2),
('79%', '2024-03-17', 7, 1),
('83%', '2024-03-18', 8, 2),
('74%', '2024-03-19', 1, 1),
('66%', '2024-03-20', 2, 2);