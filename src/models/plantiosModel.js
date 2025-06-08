let database = require("../database/config");


function buscarTodosPlantios(idEmpresa) {
    let instrucaoSql = `
        SELECT 
            end.coordX, 
            end.coordY,
            end.logradouro,
            end.cidade, 
            end.estadoSigla
        FROM Plantio
        INNER JOIN Endereco end ON end.idEndereco = Plantio.fkEndereco
        WHERE Plantio.fkEmpresa = '${idEmpresa}';
    `

    return database.executar(instrucaoSql);
};



// vou buscar no banco somente os cep correspondentes

function exibirPlantio(cepPlantio) {
    let instrucaoSql = `
    SELECT 
    Regiao.idRegiao, 
    DadosSensor.idDadosSensor,
    DadosSensor.umidade,
    Plantio.nome
FROM DadosSensor
INNER JOIN Regiao ON Regiao.idRegiao = DadosSensor.fkRegiao AND Regiao.fkPlantio = DadosSensor.fkPlantio
INNER JOIN Plantio ON Regiao.fkPlantio = Plantio.idPlantio
INNER JOIN Empresa ON Empresa.idEmpresa = Plantio.fkEmpresa
INNER JOIN Endereco ON Endereco.idEndereco = Empresa.fkEndereco
WHERE Endereco.cep = '${cepPlantio}'
;`
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarTodosPlantios,
    exibirPlantio
};