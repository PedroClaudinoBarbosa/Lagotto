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

function exibirGraficoBarra(req, res){
    const idDadosSensor = req.params.idDadosSensor;
    console.log('id: ' + idDadosSensor);

    avisoModel.exibirGraficoBarra(idDadosSensor).then((resultado) =>{
        res.status(200).json(resultado)
        console.log(resultado)
        console.log(idDadosSensor)
    });

}

module.exports = {
    listarAvisos,
    buscarPlantios,
    buscarRegiao,
    exibirGraficoBarra
}