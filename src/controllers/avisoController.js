let avisoModel = require("../models/avisoModel");

function listarDiaSemana(req, res) {
    let idEmpresa = req.params.idEmpresa;
    console.log("ID da empresa recebido:", idEmpresa);

    avisoModel.listarDiaSemana(idEmpresa)
        .then(resultado => {
            console.log("Resultado da model:", resultado);
            res.json(resultado);
        })
        .catch(erro => {
            console.error("Erro ao buscar dia mais comprometido:", erro);
            res.status(500).json({ erro: "Erro ao buscar dia mais comprometido" });
        });
}
async function listarAlertasPorEmpresa(req, res) {
    const idEmpresa = req.params.idEmpresa;

    try {
        const resultados = await alertaModel.obterAlertasPorEmpresa(idEmpresa);

        const dataPlantiosRiscos = resultados.filter(r => r.situacao === 'Em risco');
        const dataPlantiosAlertas = resultados.filter(r => r.situacao === 'Estado de Alerta');
        const dataPlantiosEstaveis = resultados.filter(r => r.situacao === 'Estável');

        res.json({
            dataPlantiosRiscos,
            dataPlantiosAlertas,
            dataPlantiosEstaveis,
            dataPlantios: resultados
        });
    } catch (erro) {
        console.error("Erro ao buscar alertas:", erro.sqlMessage);
        res.status(500).json({ erro: erro.sqlMessage });
    }
}


function listarAvisos(req, res) {
    let idEmpresa = req.params.idEmpresa;

    avisoModel.listarAvisos(idEmpresa).then((resultado) => {
        res.status(200).json(resultado);
    });
}

function buscarPlantios(req, res) {
    let idEmpresa = req.params.idEmpresa;

    avisoModel.buscarPlantios(idEmpresa).then((resultado) => {
        res.status(200).json(resultado);
    });
}

function buscarRegiao(req, res) {
    let idPlantio = req.body.idPlantioServer;
    let idRegiao = req.body.idRegiaoServer;

    avisoModel.buscarRegiao(idPlantio, idRegiao).then((resultado) => {
        res.status(200).json(resultado);
    });
}

function exibirGraficoBarra(req, res) {
    const idDadosSensor = req.params.idDadosSensor;
    console.log('id: ' + idDadosSensor);

    avisoModel.exibirGraficoBarra(idDadosSensor).then((resultado) => {
        res.status(200).json(resultado)
        console.log(resultado)
        console.log(idDadosSensor)
    });

}

module.exports = {
    listarDiaSemana,
    listarAvisos,
    buscarPlantios,
    buscarRegiao,
    exibirGraficoBarra,
    listarAlertasPorEmpresa
}