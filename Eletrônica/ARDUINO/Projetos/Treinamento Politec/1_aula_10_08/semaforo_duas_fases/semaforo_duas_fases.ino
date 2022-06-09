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
  digitalWrite(wvermelho, HIGH);
  digitalWrite(wgreen, HIGH);
  delay(3000); // aguardando 3000 millisecond(s)
  digitalWrite(wgreen, LOW);
  
  digitalWrite(wvermelho, HIGH);
  digitalWrite(wyellow, HIGH);
  delay(2000); // aguardando 2000 millisecond(s)
  digitalWrite(wvermelho, LOW);
  digitalWrite(wyellow, LOW);
  
  digitalWrite(wverde, HIGH);
  digitalWrite(wred, HIGH);
  delay(3000); //aguardando 3000 millisecond(s)
  digitalWrite(wverde, LOW);

  digitalWrite(wred, HIGH);
  digitalWrite(wamarelo, HIGH);
  delay(2000); // aguardando 2000 millisecond(s)
  digitalWrite(wred, LOW);
  digitalWrite(wamarelo, LOW);
  
}
