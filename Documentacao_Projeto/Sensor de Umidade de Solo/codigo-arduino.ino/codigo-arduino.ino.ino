const int PINO_SENSOR_UMIDADE_SOLO = A0; // defino a porta analogica que será utilizada

void setup() { // funcao que sera executada uma vez
  Serial.begin(9600); // inicia a comunicação serial em 9600 baunds
  pinMode(PINO_SENSOR_UMIDADE_SOLO, INPUT); // defino que aquele pino sera utilizado para entrada de dados
}

void loop() { // funcao que sera executada em loop
  int leituraSensor = analogRead(PINO_SENSOR_UMIDADE_SOLO); // leitura analogica da porta A0
  int maximo = 40;
  int minimo = 30;
  float porcentagemUmidade = ((1 - (leituraSensor / 1023.0)) * 100) - 20; 
   // faz o calculo para converter a unidade de medida padrao para porcentagem de umidade do solo

  
  Serial.println(porcentagemUmidade);


  delay(1000); // tempo de 1 segundo para realizar a proxima leitura
}
