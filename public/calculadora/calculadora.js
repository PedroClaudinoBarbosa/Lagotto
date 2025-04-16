function calcular() {
    preçoTrufakg;
    metroQuadrado;
    hectar = metroQuadrado / 10000;
    
    kg_trufa = hectar * 1.5;

    precoTotal = kg_trufa * precoTrufakg;
    


    output.innerHTML += `Com o preço da trufa de ${precoTrufakg}  você teria um retorno com o nosso investimento no valor de ${precoTotal}`
    modal.style.display = 'block';
    
}
    window.onclick = function (event) {
        if (event.target === modal) {
            modal.style.display = 'none';
    }
}
