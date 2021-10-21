/* !-- VARIAVEIS --! */
int led = 5;
int interruptor = 11;
int val;


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  pinMode (led, OUTPUT);
  pinMode (interruptor, INPUT);
}

/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  val = digitalRead(interruptor);

  if (val == HIGH) {
    digitalWrite (led, HIGH);
  }

  else
  {
    digitalWrite(led, LOW);
  }

} //FIM
