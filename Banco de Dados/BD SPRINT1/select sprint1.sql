use lagotto;

-- obtendo todos usuarios
select * from usuario;

-- obtendo todos os cargos
select * from cargo;

-- obtendo todas as estufas
select * from plantio;

-- obtendo todas as arvores
select * from arvore;

-- obtendo todas as medicoes de umidade
select * from umidade_arvore;

-- obtendo todos usuarios que o sobrenome começa com S
select * from usuario
where nome like '% S%';

-- obtendo todos as arvores da Estufa Oeste
select * from arvore
where fk_plantio = 4;

-- obtendo todas as medicoes da arvore de id 13
select * from umidade_arvore
where fk_arvore = 13;

-- obtendo todas medicoes que estao acima de 80% de umidade
select * from umidade_arvore
where umidade > 80;

-- obtendo todas medicoes que estao abaixo de 60% de umidade
select * from umidade_arvore
where umidade < 60;

-- obtendo todas as medicoes que estao fora do intervalo ideal (60% - 80%)
select * from umidade_arvore
where umidade not between 60 and 80;

-- obtendo todas as medicoes que estao fora do intervalo ideal (60% - 80%) (com feedback)
select
	fk_arvore as 'ID da árvore',
	umidade as 'Umidade do solo',
    case
		when umidade > 80 then 'Alta'
        when umidade < 60 then 'Baixa'
	end as 'Feedback de umidade'
from umidade_arvore
where umidade not between 60 and 80;

-- obtendo todas as medicoes que estao no intervalo ideal (60% - 80%)
select * from umidade_arvore
where umidade between 60 and 80;

-- obtendo todas as medicoes da arvore de id 10 que nao estavam no intervalo ideal (60% - 80%)
select umidade as 'Umidade do solo',
	   fk_arvore as 'ID da árvore'
from umidade_arvore
where fk_arvore = 10 and umidade not between 60 and 80;