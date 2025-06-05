let database = require("../database/config");


function buscarTodosPlantios(
    idEmpresa,
    nome,
    coordX,
    coordY,
    logradouro,
    cidade,
    estadoSigla
) {

    let instrucaoSql = `
        select 
    e.idEmpresa, 
    e.nome,  
    end.coordX, 
    end.coordY,
    end.logradouro,
    end.cidade, 
    end.estadoSigla
from (
    select * 
    from Empresa 
    where idEmpresa = ${idEmpresa}
) as e
inner join  Endereco as end
    on end.idEndereco = e.fkEndereco
inner join Plantio as p
    on p.fkEmpresa = e.idEmpresa
    group by idEmpresa;
`;

    return database.executar(instrucaoSql);
};


module.exports = {
    buscarTodosPlantios

};
