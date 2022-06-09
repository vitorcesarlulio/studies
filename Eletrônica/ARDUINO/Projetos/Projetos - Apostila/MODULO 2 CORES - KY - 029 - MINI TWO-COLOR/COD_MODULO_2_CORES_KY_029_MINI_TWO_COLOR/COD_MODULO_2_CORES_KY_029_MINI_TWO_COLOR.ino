/* !-- VARIAVEIS --! */
int redpin = 11; // selecione o pino para o LED vermelho
int bluepin = 10; // selecione o pino para o blueLED
int val;


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup () {
  pinMode (redpin, OUTPUT);
  pinMode (bluepin, OUTPUT);
  Serial.begin (9600);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop () {
  for (val = 255; val > 0; val--) {
    analogWrite (11, val);
    analogWrite (10, 255 - val);
    delay(5);
  }
  for (val = 255; val < 255; val++) {
    analogWrite (11, val);
    analogWrite (10, 255 - val);
    delay(5);
  }
} //FIM
