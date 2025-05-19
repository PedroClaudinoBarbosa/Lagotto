let database = require("../database/config");

function listarAvisos() {
    let instrucaoSql = `
        SELECT DadosSensor.data, DadosSensor.umidade, Plantio.Endereco, Sensor.localizacao 
        FROM DadosSensor 
        INNER JOIN Plantio ON DadosSensor.fkPlantio = Plantio.idPlantio 
        INNER JOIN Sensor ON DadosSensor.fkSensor = Sensor.idSensor LIMIT 10;
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    listarAvisos
}