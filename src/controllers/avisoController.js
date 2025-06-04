let avisoModel = require("../models/avisoModel");

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

module.exports = {
    listarAvisos,
    buscarPlantios,
    buscarRegiao
}