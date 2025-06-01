let database = require("../database/config");

function listarAvisos(idEmpresa) {
    let instrucaoSql = `
        SELECT  DadosSensor.data,
                DadosSensor.umidade,
                Regiao.descricao,
                Plantio.nome,
                Endereco.estadoSigla
        FROM DadosSensor 
        INNER JOIN Regiao ON DadosSensor.fkRegiao = Regiao.idRegiao
        INNER JOIN Plantio ON Regiao.fkPlantio = Plantio.idPlantio
        INNER JOIN Endereco ON Plantio.fkEndereco = Endereco.idEndereco
        WHERE Plantio.fkEmpresa = '${idEmpresa}';
    `;

    return database.executar(instrucaoSql);
}

function buscarPlantios(idEmpresa) {
    let instrucaoSql = `
        SELECT  Plantio.idPlantio,
                Plantio.nome,
                Endereco.estadoSigla
        FROM Plantio
        INNER JOIN Endereco ON Plantio.fkEndereco = Endereco.idEndereco
        WHERE Plantio.fkEmpresa = '${idEmpresa}';
    `;

    return database.executar(instrucaoSql);
}

function buscarRegiao(idPlantio, idRegiao) {
    let instrucaoSql = `
        SELECT  DadosSensor.idDadosSensor,
                Regiao.descricao,
                DadosSensor.data,
                DadosSensor.umidade
        FROM DadosSensor
        INNER JOIN Regiao ON DadosSensor.fkRegiao = Regiao.idRegiao AND DadosSensor.fkPlantio = Regiao.fkPlantio
        WHERE DadosSensor.fkPlantio = '${idPlantio}'
        AND DadosSensor.fkRegiao = '${idRegiao}'
        ORDER BY data DESC
        LIMIT 10;
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    listarAvisos,
    buscarPlantios,
    buscarRegiao
}