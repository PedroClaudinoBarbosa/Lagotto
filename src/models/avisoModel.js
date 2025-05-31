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

module.exports = {
    listarAvisos
}