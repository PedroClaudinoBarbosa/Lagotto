var express = require("express");
var router = express.Router();

var calendarioController = require ('../controllers/calendarioController')

router.get("/buscarDadosPorData/:idEmpresa", function(req, res) {
    calendarioController.fetchDadosPorData(req, res);
});


router.get('/:dados/:idEmpresa', function (req, res){
    calendarioController.exibirSensores(req, res);
});

module.exports = router;