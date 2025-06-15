let express = require("express");
let router = express.Router();

let estatisticasController = require("../controllers/estatisticasController");

router.get("/buscarFazendas/:idEmpresa", function(req, res)  {
    estatisticasController.buscarFazendas(req, res);
});

router.get("/dadosSensorQtdDias/:idPlantio/:idRegiao/:qtdDias", function(req, res) {
    estatisticasController.dadosSensorQtdDias(req, res);
});

module.exports = router;
