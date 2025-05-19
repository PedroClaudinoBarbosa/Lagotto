let avisoModel = require("../models/avisoModel");

function listarAvisos(req, res) {
    avisoModel.listarAvisos().then((resultado) => {
        res.status(200).json(resultado);
    });
}

module.exports = {
    listarAvisos
}