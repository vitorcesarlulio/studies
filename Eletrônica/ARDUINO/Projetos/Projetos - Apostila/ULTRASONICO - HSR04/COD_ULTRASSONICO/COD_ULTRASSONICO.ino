/* !-- VARIAVEIS --! */ 
int buzzer = 3, ledVermelho = 6, ledAmarelo = 9, ledVerde = 10;

long leitorDistancia(int triggerPin, int echoPin){
    pinMode(triggerPin, OUTPUT);   // Declara o Pino Trigger como saída
    digitalWrite(triggerPin, LOW); // Desliga o Pino Trigger 
    delayMicroseconds(2);          // Intervalo de 2 Microssegundos
    
    // Configura o pino do acionador para o estado HIGH por 10 microssegundos
    digitalWrite(triggerPin, HIGH); // Liga o Pino Trigger
    delayMicroseconds(10);         // Intervalo de 10 Microssegundos
    digitalWrite(triggerPin, LOW); // Desliga o Pino Trigger
    pinMode(echoPin, INPUT);       // Liga o Pino Echo
    
    // Lê o pino de eco e retorna o tempo de viagem da onda sonora em microssegundos
    return pulseIn(echoPin, HIGH); // Recebe e retorna a leitura do pulso
}


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  Serial.begin(9600);
  pinMode(buzzer, OUTPUT); // Declaração Buzzer como saída
  pinMode(ledVermelho,OUTPUT); // Declaração Led Vermelho como Saída
  pinMode(ledAmarelo,OUTPUT); // Declaração Led Amarelo como Saída
  pinMode(ledVerde,OUTPUT); // Declaração Led Verde como Saída
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  int distancia; // Declaração da variavel Distância
  distancia = 0.01723 * leitorDistancia(4, 2); // Distância é igual a 0.01723 vezes valor adquirido pela função Leitor Distância 
  Serial.print("Distancia: "); // Imprimir na tela a Distância
  Serial.print(distancia); // Imprimir na tela a Distância
  Serial.println("cm"); // Imprimir na tela a Distância
  
  if(distancia > 100){
      verde(); // Se a Distância for maior que 100 centímetros liga o Led Verde
    }
  
  if(distancia > 70 && distancia < 100){
      amarelo(); // Se a Distância for maior que 70 centímetros e menor que 100 centímetros liga o Led Amarelo
    }
  
  if(distancia < 70){
      vermelho(); // Se a Distância for menor que 70 centímetros liga o Led Vermelho  
    }
  
} //FIM

/* METODO LIGAR LED VERMELHO */
int vermelho(){
  digitalWrite(ledVerde, LOW); // Led Verde desligado
  digitalWrite(ledAmarelo, LOW); // Led Amarelo desligado
  digitalWrite(ledVermelho, HIGH); // Led Vermelho ligado
    digitalWrite(buzzer, HIGH); // Buzzer ligado
    delay(100); // Intervalo de 100 segundos
}

/* METODO LIGAR LED VERDE */
int verde(){
  digitalWrite(ledVerde, HIGH); // Led Verde ligado 
  digitalWrite(ledAmarelo, LOW); // Led Amarelo desligado
  digitalWrite(ledVermelho, LOW); // Led Vermelho desligado
    digitalWrite(buzzer, LOW); // Buzzer desligado
    delay(100); // Intervalo de 100 segundos 
}

/* METODO LIGAR LED AMARELO */
int amarelo(){
  digitalWrite(ledVerde, LOW); // Led Verde desligado
  digitalWrite(ledAmarelo, HIGH); // Led Amarelo ligado
  digitalWrite(ledVermelho, LOW); // Led Vermelho desligado
    digitalWrite(buzzer, LOW); // Buzzer desligado
    delay(100); // Intervalo de 100 segundos
}
