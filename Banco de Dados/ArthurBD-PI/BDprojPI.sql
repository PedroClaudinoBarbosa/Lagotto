-- criando database
create database lagotto;

use lagotto;  

  
-- criando as tabelas
create table login(  

idCliente int primary key auto_increment,  

nome varchar(50),  

email varchar(50),  

senha varchar(50));  

  

   

create table umidadeSolo( 

idSolo int primary key auto_increment, 

umidade varchar(50), 

qualidade varchar(50), 

alerta varchar(50) 

);  

create table terreno(
idTerreno int primary key auto_increment, 

Hectares varchar(50), 

QtdArvore varchar(50), 
);

  
-- inserindo os dados nas tabelas
insert into login(nome,email,senha)  

values('Josué','josueandrade@gmail.com','Josue123'),  

  

('Roberta','robertaventurini@gmail.com','Rob2208'),  

  

('Henrique','henriquefurlan@gmail.com','Furlan1269'),  

  

('Kaique','kaiquebibi@gmail.com','Cake18007'),  

  

('Carlos','carlossapopemba@gmail.com','Carl05'),  

  

('Gustavo','gustavomuniz@gmail.com','Gustamnz7');  

  

  

insert into umidadeSolo(umidade,qualidade,alerta) 

values('57%','Abaixo do necessário','sim'), 

('69%','Dentro do necessário','não'), 

('78%','Dentro do necessário','não'), 

('88%','Acima do necessário','sim'), 

('53%','Abaixo do necessário','sim'), 

('33%','Abaixo do necessário','sim'); 

  insert into terreno(hectares,QtdArvore)
  values('3','2460'),
  ('1','733'),
  ('3','2077'),
  ('2','1502'),
  ('5','4812'),
  ('1','932');

--  

select*from login; 

select*from login where nome like '_o%';


-- 

select*from umidadeSolo; 
select*from terreno where alerta = 'sim';

-- 
select*from terreno;
select*from terreno where hectares = 3;