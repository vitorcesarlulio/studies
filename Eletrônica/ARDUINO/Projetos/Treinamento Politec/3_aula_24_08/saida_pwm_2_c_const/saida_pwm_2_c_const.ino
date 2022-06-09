
const int pin3 = 3; //constante para os pinos, essas constantes n mudam
const int pin5 = 5;
const int pin6 = 6;
const int pin9 = 9;
const int pin10 = 10;

int tempo = 1000; //variavel de tempo

void setup() {
  
pinMode(pin3,OUTPUT);
pinMode(pin5,OUTPUT);
pinMode(pin6,OUTPUT);
pinMode(pin9,OUTPUT);
pinMode(pin10,OUTPUT);

}

void loop() {
  
  analogWrite(pin3,0); //primeiro o pino depois o valor
  analogWrite(pin5,0);
  analogWrite(pin6,0);
  analogWrite(pin9,0);
  analogWrite(pin10,0);
  delay(tempo);
  analogWrite(pin3,63.75);
  analogWrite(pin5,63.75);
  analogWrite(pin6,63.75);
  analogWrite(pin9,63.75);
  analogWrite(pin10,63.75);
  delay(tempo);
  analogWrite(pin3,127.5);
  analogWrite(pin5,127.5);
  analogWrite(pin6,127.5);
  analogWrite(pin9,127.5);
  analogWrite(pin10,127.5);
  delay(tempo);
  analogWrite(pin3,191.25);
  analogWrite(pin5,191.25);
  analogWrite(pin6,191.25);
  analogWrite(pin9,191.25);
  analogWrite(pin10,191.25);
  delay(tempo);
  analogWrite(pin3,255);
  analogWrite(pin5,255);
  analogWrite(pin6,255);
  analogWrite(pin9,255);
  analogWrite(pin10,255);

  delay(2000);
  
  analogWrite(pin3,255);
  analogWrite(pin5,255);
  analogWrite(pin6,255);
  analogWrite(pin9,255);
  analogWrite(pin10,255);
  delay(tempo);
  analogWrite(pin3,191.25);
  analogWrite(pin5,191.25);
  analogWrite(pin6,191.25);
  analogWrite(pin9,191.25);
  analogWrite(pin10,191.25);
  delay(tempo);
  analogWrite(pin3,127.5);
  analogWrite(pin5,127.5);
  analogWrite(pin6,127.5);
  analogWrite(pin9,127.5);
  analogWrite(pin10,127.5);
  delay(tempo);
  analogWrite(pin3,63.75);
  analogWrite(pin5,63.75);
  analogWrite(pin6,63.75);
  analogWrite(pin9,63.75);
  analogWrite(pin10,63.75);
  delay(tempo);
  analogWrite(pin3,0);
  analogWrite(pin5,0);
  analogWrite(pin6,0);
  analogWrite(pin9,0);
  analogWrite(pin10,0);
}
