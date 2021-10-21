/*
  semaforo  aula 1 - Professor Claudio / Mariano Politec

 Objedivo: conhecimento de saidas digtais no arduino UNO.

 Material:
 
 3 resistores de 220ohm
 3 leds (vermelho, amarelo e verde)
 1 arduino uno
 
 */
int wvermelho = 13;
int wamarelo = 12;
int wverde = 11;
int wred = 10;
int wyellow = 9;
int wgreen = 7;

void setup()
{
  pinMode(wvermelho, OUTPUT); // led vermelho
  pinMode(wamarelo, OUTPUT); //led amarelo
  pinMode(wverde, OUTPUT); //led verde
  pinMode(wred, OUTPUT); //led red
  pinMode(wyellow, OUTPUT); //led yellow
  pinMode(wgreen, OUTPUT); //led green
}

void loop()
{
  digitalWrite(wvermelho, 1);
  digitalWrite(wamarelo, 1);
  digitalWrite(wverde, 1);
  delay(500); // aguardando 500 millisecond(s)
  digitalWrite(wvermelho, 0);
  digitalWrite(wamarelo, 0);
  digitalWrite(wverde, 0);
  
  digitalWrite(wred, 1);
  digitalWrite(wyellow, 1);
  digitalWrite(wgreen, 1);
  delay(500); // aguardando 500 millisecond(s)
  digitalWrite(wred, 0);
  digitalWrite(wyellow, 0);
  digitalWrite(wgreen, 0);
  
  }
