var express = require("express");
var router = express.Router();

var plantiosController = require ('../controllers/plantiosController')


router.get("/buscarPlantios/:idEmpresa", function(req, res) {
    plantiosController.buscarTodosPlantios(req, res);
});


router.get('/:estado/:idEmpresa', function (req, res){
    const cep = req.params.cepPlantio;
     
    plantiosController.exibirPlantio(req, res);
});

module.exports = router;