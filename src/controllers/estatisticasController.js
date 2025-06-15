let estatisticasModel = require('../models/estatisticasModel');

function buscarFazendas(req, res) {
    let idEmpresa = req.params.idEmpresa;

    estatisticasModel.buscarFazendas(idEmpresa).then((resultado) => {
        res.status(200).json(resultado);
    });
}

function dadosSensorQtdDias(req, res) {
    let idPlantio = req.params.idPlantio;
    let idRegiao = req.params.idRegiao;
    let qtdDias = req.params.qtdDias;

    estatisticasModel.dadosSensorQtdDias(idPlantio, idRegiao, qtdDias).then((resultado) => {
        res.status(200).json(resultado);
    });
}

module.exports = {
    buscarFazendas,
    dadosSensorQtdDias
}