/* !-- VARIAVEIS --! */
int LED = 8;
int RESISTENCIA = A0;
int entrada = 0;

/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  pinMode(LED, OUTPUT);
  digitalWrite(LED, LOW);
  Serial.begin(9600);
}

/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  entrada = analogRead(RESISTENCIA); //0 - 1023
  Serial.println(entrada);

  entrada = (entrada * 255) / 1023;

  analogWrite(LED, entrada);

  delay(500);

} //FIM
