var express = require("express");
var router = express.Router();

var plantiosController = require('../controllers/plantiosController')

router.get("/buscarPlantios/:idEmpresa", function(req, res) {
    plantiosController.buscarTodosPlantios(req, res);
});

router.get('/exibirGraficoBarra/:idDadosSensor', function(req, res) {
    plantiosController.exibirGraficoBarra(req, res);
});

router.get('/exibirPlantio/:estado/:idEmpresa', function (req, res){
    const cep = req.params.cepPlantio;
     
    plantiosController.exibirPlantio(req, res);
});

router.get(`/exibirGraficoLinha/:idDadosSensor`, function(req, res){
    plantiosController.exibirGraficoLinha(req, res);
});





module.exports = router;