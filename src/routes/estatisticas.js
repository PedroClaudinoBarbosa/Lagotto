let express = require("express");
let router = express.Router();

let estatisticasController = require("../controllers/estatisticasController");

router.get("/buscarFazendas/:idEmpresa", function(req, res)  {
    estatisticasController.buscarFazendas(req, res);
});

router.get("/dadosSensorQtdDias/:idPlantio/:idRegiao/:qtdDias", function(req, res) {
    estatisticasController.dadosSensorQtdDias(req, res);
});

router.get("/umidadesDiaSemanaPassados/:idPlantio/:idRegiao/:diaSemana", function(req, res) {
    estatisticasController.umidadesDiaSemanaPassados(req, res);
});

module.exports = router;
