let avisoModel = require("../models/avisoModel");

function listarAvisos(req, res) {
    let idEmpresa = req.params.idEmpresa;

    avisoModel.listarAvisos(idEmpresa).then((resultado) => {
        res.status(200).json(resultado);
    });
}

module.exports = {
    listarAvisos
}