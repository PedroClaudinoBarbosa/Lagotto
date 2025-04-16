function calcular() {
    precoTrufakg = parseFloat(document.getElementById("precoTrufakg").value);
    metroQuadrado = parseFloat(document.getElementById("metroQuadrado").value);

    hectar = metroQuadrado / 10000;

    kg_trufa = hectar * 1.8;

    precoTotal = precoTrufakg * kg_trufa;




    output.innerHTML = `Com o preço da trufa de ${precoTrufakg}  você teria um retorno com o nosso investimento no valor de ${precoTotal}`;

}

