var database = require("../database/config");

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha);

    var instrucaoSql = `
        SELECT * FROM Funcionario WHERE email = '${email}' AND senha = '${senha}';
    `;

    console.log("Executando a instrução SQL: \n " + instrucaoSql);
    return database.executar(instrucaoSql);
}
function cadastrar(nome, senha, email, fkEmpresa, ativo, isAdmin) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, senha, email, fkEmpresa, ativo, isAdmin);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO Funcionario (nome, senha, email, fkEmpresa, ativo, isAdmin) VALUES ('${nome}', '${senha}', '${email}','${fkEmpresa}', '${ativo}', '${isAdmin}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar
}