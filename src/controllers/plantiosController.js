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
    
    const cidade = req.params.cidade;
    const idEmpresa = req.params.idEmpresa;
  
    plantiosModel.exibirPlantio(cidade,idEmpresa)
        .then((resultado) => {
            
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                
                res.status(404).json({ message: "Nenhum dado de sensor encontrado para o CEP fornecido." });
            }
        })
        .catch((erro) => {
           
            console.error(`Erro ao buscar dados do plantio para o CEP ${cepPlantio}: ${erro.message}`);
            res.status(500).json({ message: "Erro interno do servidor ao buscar dados do plantio." });
        });
}

module.exports = {
    buscarTodosPlantios,
    exibirPlantio
}