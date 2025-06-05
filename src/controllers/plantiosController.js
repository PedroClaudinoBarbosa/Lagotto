let plantiosModel = require("../models/plantiosModel");


function buscarTodosPlantios(req, res) {
    let idEmpresa = req.params.idEmpresa;
    let nome = req.body.nomeEmpresa;
    let coordX = req.body.latitude;
    let coordY = req.body.longitude;
    let logradouro = req.body.logradouro
    let cidade = req.body.cidade;
    let estadoSigla = req.body.estadoSigla;


    plantiosModel.buscarTodosPlantios(
        idEmpresa,
        nome,
        coordX,
        coordY,
        logradouro,
        cidade,
        estadoSigla

    ).then((resultado) => {
        res.status(200).json(resultado);

        console.log(idEmpresa)
        console.log(nome)
        console.log(coordX)
        console.log(coordY)
        console.log(logradouro)
        console.log(cidade)
        console.log(estadoSigla)

    });

}
module.exports = {
    buscarTodosPlantios
}