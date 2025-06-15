let database = require('../database/config');

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

function dadosSensorQtdDias(idPlantio, idRegiao, qtdDias) {
    let instrucaoSql = `
        SELECT 
            DadosSensor.idDadosSensor,
            CONCAT(
                DATE_FORMAT(DadosSensor.data, '%d/%m/%Y - %H:%i:%s'),
                ' (',
                CASE DAYOFWEEK(DadosSensor.data)
                    WHEN 1 THEN 'Domingo'
                    WHEN 2 THEN 'Segunda'
                    WHEN 3 THEN 'Terça'
                    WHEN 4 THEN 'Quarta'
                    WHEN 5 THEN 'Quinta'
                    WHEN 6 THEN 'Sexta'
                    WHEN 7 THEN 'Sábado'
                END,
                ')'
            ) AS data,
            DadosSensor.umidade,
            DadosSensor.fkPlantio,
            DadosSensor.fkRegiao
        FROM 
            DadosSensor
        WHERE 
            DadosSensor.fkPlantio = 1
            AND DadosSensor.fkRegiao = 1
            AND DadosSensor.data >= NOW() - INTERVAL 1 DAY
            AND DadosSensor.data < NOW()
        ORDER BY 
            DadosSensor.data DESC;
    `;

    return database.executar(instrucaoSql)
}

module.exports = {
    buscarPlantios,
    dadosSensorQtdDias
}