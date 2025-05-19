var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/listarAvisos", function(req,res) {
    avisoController.listarAvisos(req, res);
});

module.exports = router;