
const int pin3 = 3; //constante para os pinos, essas constantes n mudam
const int pin5 = 5;
const int pin6 = 6;
const int pin9 = 9;
const int pin10 = 10;
const int botao2 = 2; 

int tempo = 250; //variavel de tempo

int estado = 0; // variável para leitura do pushbutton
int ciclo = 0;

int potencia = 0;

void setup() {
  
pinMode(botao2,INPUT);  
pinMode(pin3,OUTPUT);
pinMode(pin5,OUTPUT);
pinMode(pin6,OUTPUT);
pinMode(pin9,OUTPUT);
pinMode(pin10,OUTPUT);

}

void loop() {

  // le o estado pushbutton: ligado (HIGH) ou desligado (LOW)
  estado = digitalRead(botao2);

  if (estado == HIGH) { //se o estado do botao que foi testado ali em cima for == ligado ne (1) entao ele pega a varivel potencia valendo 0 e soma mais quanto vc quiser)
      potencia = potencia + 50;
     if (potencia >= 250){ //verifica se a potencia chegou a 250, e se ela chegou a variavel potencia recebe 0 dnv pq se nao a luz nunca vai apagar
        potencia = 0;
        } 
  delay(tempo); //delay para voce ver o que esta caontecendo se nao o arduino fica louco e quando vc clica na hora ele ja muda
  }

  analogWrite(pin3,potencia);
  analogWrite(pin5,potencia);
  analogWrite(pin6,potencia);
  analogWrite(pin9,potencia);
  analogWrite(pin10,potencia);
  
}
