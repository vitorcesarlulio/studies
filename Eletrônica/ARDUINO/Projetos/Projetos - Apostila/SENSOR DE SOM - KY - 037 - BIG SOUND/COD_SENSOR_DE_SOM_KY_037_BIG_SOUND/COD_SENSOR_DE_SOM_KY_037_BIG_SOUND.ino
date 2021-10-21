/* !-- VARIAVEIS --! */
#define pinoled 7
#define pinosom 4

bool led;

/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  pinMode(pinoled, OUTPUT);
  pinMode(pinosom, INPUT);
  led = false;
  digitalWrite(pinoled, led);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  if (digitalRead(pinosom) == HIGH) {
    led = !led;
  }
  digitalWrite(pinoled, led);
}
