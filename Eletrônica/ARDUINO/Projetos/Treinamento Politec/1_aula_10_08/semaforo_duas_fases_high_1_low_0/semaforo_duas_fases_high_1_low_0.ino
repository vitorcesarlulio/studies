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
  digitalWrite(wgreen, 1);
  delay(3000); // aguardando 3000 millisecond(s)
  digitalWrite(wgreen, 0);
  
  digitalWrite(wvermelho, 1);
  delay(3000); // aguardando 3000 millisecond(s)
  digitalWrite(wyellow, 1);
  delay(2000); // aguardando 2000 millisecond(s)
  digitalWrite(wyellow, 0);
  delay(1000); // aguardando 1000 millisecond(s)
  digitalWrite(wvermelho, 0);
 
  
  digitalWrite(wverde, 1);
  digitalWrite(wred, 1);
  delay(3000); //aguardando 3000 millisecond(s)
  digitalWrite(wverde, 0);

  digitalWrite(wred, 1);
  digitalWrite(wamarelo, 1);
  delay(2000); // aguardando 2000 millisecond(s)
  digitalWrite(wamarelo, 0);
  delay(1000); // aguardando 2000 millisecond(s)
  digitalWrite(wred, 0);
  
  
}
