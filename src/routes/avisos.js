var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/listarDiaSemana/:idEmpresa", function(req,res) {
    avisoController.listarDiaSemana(req, res);
});

router.get("/listarAvisos/:idEmpresa", function(req,res) {
    avisoController.listarAvisos(req, res);
});

router.get("/buscarPlantios/:idEmpresa", function(req, res) {
    avisoController.buscarPlantios(req, res);
});

router.post("/buscarRegiao", function(req, res) {
    avisoController.buscarRegiao(req, res);
});
router.get("/listarAlertasPorEmpresa/:idEmpresa", function(req, res){
    avisoController.listarAlertasPorEmpresa(req, res);
});

module.exports = router;