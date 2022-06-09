/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  pinMode(11, OUTPUT); //Buzzer Pin
  pinMode(7, INPUT); // Sensor de luz
  delay(500);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  int i = 0;

  if (digitalRead(7) == HIGH)
  {
a:
    digitalWrite(11, HIGH);
    delay(100);
    digitalWrite(11, LOW);
    delay(100);
    i++;
    if (i < 50) {
      goto a;
    }
  }
} //FIM
