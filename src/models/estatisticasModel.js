let database = require('../database/config');

function buscarFazendas(idEmpresa) {
    let instrucaoSql = `    
        SELECT  
            (SELECT COUNT(*)
            FROM Fazenda
            WHERE fkEmpresa = '${idEmpresa}') AS qtdFazendas,
            Fazenda.nome,
            Plantio.idPlantio,
            Endereco.cidade,
            Endereco.estadoSigla,
            COUNT(fkPlantio) as qtdRegioes
        FROM Fazenda
        INNER JOIN Plantio ON Fazenda.idFazenda = Plantio.fkFazenda
        INNER JOIN Endereco ON Fazenda.fkEndereco = Endereco.idEndereco
        INNER JOIN Regiao ON Plantio.idPlantio = Regiao.fkPlantio
        WHERE Fazenda.fkEmpresa = '${idEmpresa}'
            GROUP BY Fazenda.nome, Plantio.idPlantio, Endereco.estadoSigla;
    `;

    return database.executar(instrucaoSql);
}

function dadosSensorQtdDias(idPlantio, idRegiao, qtdDias) {
    let instrucaoSql = `
        SELECT 
            DadosSensor.idDadosSensor,
            CONCAT(
                DATE_FORMAT(DadosSensor.data, '%d/%m/%Y - %H:%i:%s'),
                '#(',
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
            DadosSensor.fkRegiao,
            Regiao.descricao
        FROM 
            DadosSensor
        INNER JOIN Regiao 
            ON DadosSensor.fkRegiao = Regiao.idRegiao
            AND DadosSensor.fkPlantio = Regiao.fkPlantio
        WHERE 
            DadosSensor.fkPlantio = '${idPlantio}'
            AND DadosSensor.fkRegiao = '${idRegiao}'
            AND DadosSensor.data >= NOW() - INTERVAL '${qtdDias}' DAY
            AND DadosSensor.data < NOW()
        ORDER BY 
            DadosSensor.data;
    `;

    return database.executar(instrucaoSql)
}

function umidadesDiaSemanaPassados(idPlantio, idRegiao, diaSemana) {
    let instrucaoSql = `
        SELECT 
            Regiao.descricao,
            DadosSensor.fkPlantio,
            DadosSensor.fkRegiao,
            MAX(umidade) AS maiorUmidade,
            MIN(umidade) AS menorUmidade,
            DATE(data) AS data,
            CASE DAYOFWEEK(DadosSensor.data)
                WHEN 1 THEN 'Domingos'
                WHEN 2 THEN 'Segundas-Feiras'
                WHEN 3 THEN 'Terças-Feiras'
                WHEN 4 THEN 'Quarta-Feiras'
                WHEN 5 THEN 'Quinta-Feiras'
                WHEN 6 THEN 'Sexta-Feiras'
                WHEN 7 THEN 'Sábados'
            END AS diaSemana
        FROM DadosSensor
        INNER JOIN Regiao ON DadosSensor.fkRegiao = Regiao.idRegiao
            AND Regiao.fkPlantio = DadosSensor.fkPlantio
        WHERE 
            DAYOFWEEK(data) = '${diaSemana}'
            AND DadosSensor.fkPlantio = '${idPlantio}'
            AND DadosSensor.fkRegiao = '${idRegiao}'
            AND data < NOW()
        GROUP BY 
            DadosSensor.fkPlantio, 
            DadosSensor.fkRegiao, 
            DATE(data),
            diaSemana
        ORDER BY 
            DATE(data);
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    buscarFazendas,
    dadosSensorQtdDias,
    umidadesDiaSemanaPassados
}