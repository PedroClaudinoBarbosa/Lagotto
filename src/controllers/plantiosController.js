let plantiosModel = require("../models/plantiosModel");


function buscarTodosPlantios(req, res) {
    let idEmpresa = req.params.idEmpresa;
    plantiosModel.buscarTodosPlantios(
        idEmpresa
    ).then((resultado) => {
        res.status(200).json(resultado);
    });

}

function exibirPlantio(req, res) {

    const estado = req.params.estado;
    const idEmpresa = req.params.idEmpresa;


    plantiosModel.exibirPlantio(estado, idEmpresa)
        .then((resultado) => {


            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(404).json({ mensagem: "Nenhum dado de sensor encontrado para o CEP fornecido." });
                
            }
        })
        .catch((erro) => {


            console.error(`Erro ao buscar dados do plantio para o estado ${estado}: ${erro.mensagem}`);

            res.status(500).json({ mensagem: "Erro interno do servidor ao buscar dados do plantio." });
        });
}



function exibirGraficoBarra(req, res){
    const sensorId = req.params.sensorId;
    plantiosModel.exibirGraficoBarra(sensorId)
    .then((resultado) => {
        if(resultado > 0){
            res.status(200).json(resultado);
        }else {
            res.status(404).json({mensagem: "Dados do sensor não encontrado"});
            console.log('Dados não encontrado',sensorId)
        }
    })
    .catch((erro)=>{
        console.error(`Erro ao buscar dados do sensor : ${erro.mensagem}`);
        res.status(500).json({mensagem:"Erro interno do servidor ao buscar dados do sensor"});
    })
}

module.exports = {
    buscarTodosPlantios,
    exibirPlantio,
    exibirGraficoBarra
}