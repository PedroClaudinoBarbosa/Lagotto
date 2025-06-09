let database = require("../database/config");


function buscarTodosPlantios(idEmpresa) {
    let instrucaoSql = `
        SELECT 
            end.coordX, 
            end.coordY,
            end.logradouro,
            end.cidade, 
            end.estadoSigla, 
            end.cep
        FROM Plantio
        INNER JOIN Endereco end ON end.idEndereco = Plantio.fkEndereco
        WHERE Plantio.fkEmpresa = '${idEmpresa}';
    `

    return database.executar(instrucaoSql);
};



function exibirPlantio(cidade, idEmpresa) {
   
    let instrucaoSql = `
SELECT
    DadosSensor.idDadosSensor,
    DadosSensor.umidade,
    DadosSensor.data,
    Regiao.idRegiao,
    Regiao.descricao AS nomeRegiao,
    Plantio.idPlantio,
    Plantio.nome AS nomePlantio,
    Empresa.idEmpresa,
    Empresa.nome AS nomeEmpresa,
    Endereco.cep,
    Endereco.logradouro,
    Endereco.cidade,
    Endereco.estadoSigla
FROM DadosSensor
INNER JOIN Regiao ON Regiao.idRegiao = DadosSensor.fkRegiao
INNER JOIN Plantio ON Plantio.idPlantio = Regiao.fkPlantio
INNER JOIN Empresa ON Empresa.idEmpresa = Plantio.fkEmpresa
INNER JOIN Endereco ON Endereco.idEndereco = Empresa.fkEndereco
WHERE Endereco.cidade = '${cidade}'
AND Empresa.idEmpresa = ${idEmpresa}
ORDER BY Endereco.cep ASC;
    `; 
    return database.executar(instrucaoSql); 
}


module.exports = {
    buscarTodosPlantios,
    exibirPlantio
};