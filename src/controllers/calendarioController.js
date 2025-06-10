let calendarioModel = require("../models/calendarioModel");

function buscarDadosPorData(req, res) {
    const idEmpresa = req.params.idEmpresa;  // ID da empresa
    const dados = req.params.dados;          // Data fornecida (formato YYYY-MM-DD)

    calendarioModel.buscarDadosPorData(idEmpresa, dados)
        .then((resultado) => {
            // Caso encontre resultados
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                // Caso não encontre resultados
                res.status(404).json({ message: "Nenhum dado de sensor encontrado para a data fornecida." });
            }
        })
        .catch((erro) => {
            // Caso ocorra algum erro na consulta
            console.error("Erro ao buscar dados de sensor:", erro);
            res.status(500).json({ message: "Erro interno do servidor ao buscar dados." });
        });
}

function exibirSensores(req, res) {
    const dados = req.params.dados;    // Data fornecida pelo usuário
    const idEmpresa = req.params.idEmpresa;   // ID da empresa

    calendarioModel.exibirSensores(dados, idEmpresa)
        .then((resultado) => {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(404).json({ message: "Nenhum dado de sensor encontrado para a data fornecida." });
                console.log("Dados recebidos:", dados);
                console.log("ID da empresa:", idEmpresa);
            }
        })
        .catch((erro) => {
            console.error(`Erro ao buscar dados do plantio para o estado ${dados}: ${erro.message}`);
            res.status(500).json({ message: "Erro interno do servidor ao buscar dados do plantio." });
        });
}

module.exports = {
    buscarDadosPorData,
    exibirSensores
};
