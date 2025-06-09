let database = require("../database/config");

function buscarDadosPorData(idEmpresa, dados) {
    console.log(dados, idEmpresa)
        const query = `
            SELECT ds.idDadosSensor, ds.data, ds.umidade, p.nome AS nome_plantio, r.descricao AS descricao_regiao
            FROM DadosSensor ds
            JOIN Regiao r ON ds.fkRegiao = r.idRegiao
            JOIN Plantio p ON ds.fkPlantio = p.idPlantio
            WHERE p.fkEmpresa = ${idEmpresa} AND DATE(ds.data) = '${dados}'
        `;
        
        return database.executar(query);
}

function exibirSensores(dados, idEmpresa) {
    console.log(dados, idEmpresa)
        const query = `
            SELECT ds.idDadosSensor, ds.data, ds.umidade, p.nome AS nome_plantio, r.descricao AS descricao_regiao
            FROM DadosSensor ds
            JOIN Regiao r ON ds.fkRegiao = r.idRegiao
            JOIN Plantio p ON ds.fkPlantio = p.idPlantio
            WHERE p.fkEmpresa = ${idEmpresa} AND DATE(ds.data) = '${dados}'
        `;
    return database.executar(query);
}

module.exports = {
    buscarDadosPorData,
    exibirSensores
};
