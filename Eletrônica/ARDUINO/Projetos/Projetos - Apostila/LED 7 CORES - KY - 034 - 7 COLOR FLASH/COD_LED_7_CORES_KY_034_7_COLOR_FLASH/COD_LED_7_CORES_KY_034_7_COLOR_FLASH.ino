/* !-- VARIAVEIS --! */
int inPin = 2;   // o número do pino de entrada
int outPin = 13; // o número do pino de saída

int state = LOW;     // o estado atual do pino de saída
int reading;         // a leitura atual do pino de entrada
int previous = HIGH; // a leitura anterior do pino de entrada

/* as seguintes variáveis ​​são longas porque o tempo, medido em milissegundos,
  se tornará rapidamente um número maior do que pode ser armazenado em um int */
long time = 0;       // a última vez que o pino de saída foi alternado
long debounce = 200; // o tempo de debounce, aumenta se a saída piscar


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup()
{
  pinMode(inPin, INPUT_PULLUP);
  pinMode(outPin, OUTPUT);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop()
{
  reading = digitalRead(inPin);

  /* se a entrada passou de LOW e HIGH e esperamos o tempo suficiente
       ignorar qualquer ruído no circuito, alterne o pino de saída e lembre-se
       A Hora */

  if (reading == HIGH && previous == LOW && millis() - time > debounce) {
    if (state == HIGH)
      state = LOW;
    else
      state = HIGH;

    time = millis();
  }

  digitalWrite(outPin, state);

  previous = reading;
} //FIM
