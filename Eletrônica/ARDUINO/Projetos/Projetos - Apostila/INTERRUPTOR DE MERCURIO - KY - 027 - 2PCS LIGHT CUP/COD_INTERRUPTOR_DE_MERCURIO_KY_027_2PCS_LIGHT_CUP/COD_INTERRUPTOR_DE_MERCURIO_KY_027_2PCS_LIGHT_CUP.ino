/* !-- VARIAVEIS --! */
const int INTERRUPTOR1 = 2;
const int LED1 = 3;

const int INTERRUPTOR2 = 4;
const int LED2 = 13;


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  pinMode(INTERRUPTOR1, INPUT);
  pinMode(INTERRUPTOR2, INPUT);

  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  digitalWrite(LED1, digitalRead(INTERRUPTOR1));
  digitalWrite(LED2, digitalRead(INTERRUPTOR2));
} //FIM
