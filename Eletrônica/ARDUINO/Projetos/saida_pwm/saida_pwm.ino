void setup() {
  
pinMode(3,OUTPUT);
pinMode(5,OUTPUT);
pinMode(6,OUTPUT);
pinMode(9,OUTPUT);
pinMode(10,OUTPUT);
}

void loop() {
  
  analogWrite(3,0);
  analogWrite(5,0);
  analogWrite(6,0);
  analogWrite(9,0);
  analogWrite(10,0);
  delay(1000);
  analogWrite(3,63.75);
  analogWrite(5,63.75);
  analogWrite(6,63.75);
  analogWrite(9,63.75);
  analogWrite(10,63.75);
  delay(1000);
  analogWrite(3,127.5);
  analogWrite(5,127.5);
  analogWrite(6,127.5);
  analogWrite(9,127.5);
  analogWrite(10,127.5);
  delay(1000);
  analogWrite(3,191.25);
  analogWrite(5,191.25);
  analogWrite(6,191.25);
  analogWrite(9,191.25);
  analogWrite(10,191.25);
  delay(1000);
  analogWrite(3,255);
  analogWrite(5,255);
  analogWrite(6,255);
  analogWrite(9,255);
  analogWrite(10,255);

}
