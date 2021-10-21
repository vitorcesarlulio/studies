/*
  semaforo  aula 1 - Professor Claudio / Mariano Politec

 Objedivo: conhecimento de saidas digtais no arduino UNO.

 Material:
 
 3 resistores de 220ohm
 3 leds (vermelho, amarelo e verde)
 1 arduino uno
 
 */
/* declaração dos bjetos, que aqui sao so as variaveis */

int wvermelho = 13; // saidas do arduino
int wamarelo = 12;
int wverde = 11;

void setup()
{
  pinMode(wvermelho, OUTPUT); // led vermelho //output saidas digitais //entrada seria input
  pinMode(wamarelo, OUTPUT); //led amarelo
  pinMode(wverde, OUTPUT); //led verde
}

void loop()
{
  digitalWrite(wvermelho, HIGH); //nivel logico alto ou baixo (HIG / LOW)
  delay(50); // aguardando 1000 millisecond(s)
  digitalWrite(wvermelho, LOW);
  
  digitalWrite(wverde, HIGH);
  delay(50); // aguardando 1000 millisecond(s)
  digitalWrite(wverde, LOW);
  
  digitalWrite(wamarelo, HIGH);
  delay(50); //aguardando 1000 millisecond(s) (1 segundo)
  digitalWrite(wamarelo, LOW);
}
