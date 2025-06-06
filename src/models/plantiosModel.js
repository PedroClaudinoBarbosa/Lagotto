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


module.exports = {
    buscarTodosPlantios

};
