let database = require("../database/config");

function listarDiaSemana(idEmpresa) {
    let instrucaoSql = `
    SELECT 
        date_format(DadosSensor.data, '%a') AS Dia_Semana,
        COUNT(*) AS total
    FROM Empresa
    INNER JOIN Plantio ON Empresa.idEmpresa = Plantio.fkEmpresa
    INNER JOIN Regiao ON Plantio.idPlantio = Regiao.fkPlantio
    INNER JOIN DadosSensor ON Regiao.idRegiao = DadosSensor.fkRegiao
    WHERE Empresa.idEmpresa = '${idEmpresa}' AND (umidade < 30 OR umidade > 40)
    GROUP BY Dia_Semana
    ORDER BY total DESC
    LIMIT 1;
    `;

    return database.executar(instrucaoSql);

}
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
                Endereco.estadoSigla,
                COUNT(fkPlantio) as qtdRegioes
        FROM Plantio
        INNER JOIN Endereco ON Plantio.fkEndereco = Endereco.idEndereco
        INNER JOIN Regiao ON Plantio.idPlantio = Regiao.fkPlantio
        WHERE Plantio.fkEmpresa = '${idEmpresa}'
        GROUP BY Plantio.idPlantio, Plantio.nome, Endereco.estadoSigla;
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
    listarDiaSemana,
    listarAvisos,
    buscarPlantios,
    buscarRegiao
}