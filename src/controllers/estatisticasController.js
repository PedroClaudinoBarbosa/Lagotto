let estatisticasModel = require('../models/estatisticasModel');

function buscarPlantios(req, res) {
    let idEmpresa = req.params.idEmpresa;

    estatisticasModel.buscarPlantios(idEmpresa).then((resultado) => {
        res.status(200).json(resultado);
    });
}

function dadosSensorQtdDias(req, res) {
    let idPlantio = req.params.idPlantio;
    let idRegiao = req.params.idPlantio;
    let qtdDias = req.params.qtdDias;

    estatisticasModel.dadosSensorQtdDias(idPlantio, idRegiao, qtdDias).then((resultado) => {
        res.status(200).json(resultado);
    });
}

module.exports = {
    buscarPlantios,
    dadosSensorQtdDias
}