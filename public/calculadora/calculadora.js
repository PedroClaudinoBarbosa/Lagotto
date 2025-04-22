function calcular() {
    precoTrufaKg = parseFloat(document.getElementById("precoTrufakg").value);
    metroQuadrado = parseFloat(document.getElementById("metroQuadrado").value);

    hectar = metroQuadrado / 10000;

    kgTrufa = hectar * 1.8;

    precoTotal = precoTrufaKg * kgTrufa;




    output.innerHTML = `Com o preço da trufa de ${precoTrufaKg}  você teria um retorno com o nosso investimento no valor de ${precoTotal}`;
}

