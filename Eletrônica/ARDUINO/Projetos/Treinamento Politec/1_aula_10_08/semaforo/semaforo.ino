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

void setup()
{
  pinMode(wvermelho, OUTPUT); // led vermelho
  pinMode(wamarelo, OUTPUT); //led amarelo
  pinMode(wverde, OUTPUT); //led verde
}

void loop()
{
  digitalWrite(wvermelho, HIGH);
  digitalWrite(wverde, HIGH);
  delay(100); // aguardando 1000 millisecond(s)
  digitalWrite(wvermelho, LOW);
  
  digitalWrite(wverde, HIGH);
digitalWrite(wamarelo, HIGH);
  delay(100); // aguardando 1000 millisecond(s)
  digitalWrite(wverde, LOW);
  
  digitalWrite(wamarelo, HIGH);
  digitalWrite(wvermelho, HIGH);
  delay(100); //aguardando 1000 millisecond(s)
  digitalWrite(wamarelo, LOW);
  
}
