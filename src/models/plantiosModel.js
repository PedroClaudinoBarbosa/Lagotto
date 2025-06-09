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



function exibirPlantio(estado, idEmpresa) {
   
    let instrucaoSql = `
SELECT 
    Plantio.idPlantio,
    Plantio.nome AS nomePlantio,
    Endereco.logradouro,
    Endereco.estadoSigla,
    AVG(DadosSensor.umidade) AS mediaUmidade
FROM 
    Plantio
INNER JOIN Endereco 
    ON Endereco.idEndereco = Plantio.fkEndereco
INNER JOIN Empresa 
    ON Empresa.idEmpresa = Plantio.fkEmpresa
inner JOIN Regiao 
    ON Regiao.fkPlantio = Plantio.idPlantio
inner JOIN DadosSensor 
    ON DadosSensor.fkRegiao = Regiao.idRegiao
WHERE 
    Empresa.idEmpresa = '${idEmpresa}' 
    AND Endereco.estadoSigla = '${estado}'
GROUP BY 
    Plantio.idPlantio, 
    Plantio.nome, 
    Endereco.logradouro, 
    Endereco.estadoSigla;

    `; 
    return database.executar(instrucaoSql); 
}


module.exports = {
    buscarTodosPlantios,
    exibirPlantio
};