let plantiosModel = require("../models/plantiosModel");


function buscarTodosPlantios(req, res) {
    let idEmpresa = req.params.idEmpresa;

    plantiosModel.buscarTodosPlantios(
        idEmpresa
    ).then((resultado) => {
        res.status(200).json(resultado);
    });

}
module.exports = {
    buscarTodosPlantios
}