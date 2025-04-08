select * from empresa;

select u.idusuario, u.nome, u.pin, e.nome as empresa
from usuario u
join empresa e on u.empresa_idempresa = e.idempresa;

select h.idhectare, h.qtarvores, u.nome as usuario
from hectare h
join usuario u on h.usuario_idusuario = u.idusuario;

select a.idarvore, a.umidade, a.data, u.nome as usuario
from arvore a
join hectare h on a.hectare_idhectare = h.idhectare
join usuario u on h.usuario_idusuario = u.idusuario;

select h.idhectare, count(a.idarvore) as total_arvores
from hectare h
left join arvore a on h.idhectare = a.hectare_idhectare
group by h.idhectare;

select * from arvore where umidade < '70%';