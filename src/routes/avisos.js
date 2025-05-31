var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/listarAvisos/:idEmpresa", function(req,res) {
    avisoController.listarAvisos(req, res);
});

module.exports = router;