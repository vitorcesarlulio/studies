/* !-- VARIAVEIS --! */
int redpin = 9;    // selecione o pino para o LED vermelho
int bluepin = 11;  // selecione o pino para o LED azul
int greenpin = 10; // selecione o pino para o LED verde
int val = 0;       // para festa em loop
int interrupt = 0; // conectado no pino 2
int k = 0;         // trabalho ou festa

unsigned long button_time = 0;       // botão de tempo está definido.
unsigned long last_button_time = 0;


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup () {
  pinMode (redpin, OUTPUT);
  pinMode (bluepin, OUTPUT);
  pinMode (greenpin, OUTPUT);

  pinMode(2, INPUT);      // interromper
  digitalWrite(2, HIGH);  // ativar o resistor pull up
  attachInterrupt(interrupt, button, FALLING);

  Serial.begin (9600);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop () {
  if (k == 0) {

    traficLight();
  } else if (k == 1) {
    party();
  }
}

/* METODO TRAFICLIGHT */
void traficLight() {
  red();
  delay(3000);
  clean();
  delay(1);
  orange();
  delay(1500);
  clean();
  delay(1);
  green();
  delay(3000);
  clean();
  delay(1);
}

/* METODO RED */
void red() {
  analogWrite(11, 255);
}

/* METODO GREEN */
void green() {
  analogWrite(9, 255);
}

/* METODO LARANJA */
void orange()
{
  analogWrite(11, 102);
  analogWrite(10, 0);
  analogWrite( 9, 51);
}

/* METODO CLEAN */
void clean() {
  analogWrite(11, 0);
  analogWrite(10, 0);
  analogWrite( 9, 0);
}

void button() {
  button_time = millis();
  Serial.println("interrupted");

  if (button_time - last_button_time > 1000)
  {
    if (k == 1) { // vamos festejar
      Serial.println("Party is over. Go back to work");
      k = 0;
      Serial.println(k);
      delay(10);
    }
    else if (k == 0) {
      k = 1; // para a festa
      Serial.print("Party time!!!");
      Serial.println(k);
    }
    last_button_time = button_time;
  }
}

/* METODO PARTY */
void party() {
  while (k == 1) {
    for (val = 255; val > 0; val--)
    {
      analogWrite (11, val);
      analogWrite (10, 255 - val);
      analogWrite (9, 128 - val);
      delay (1);
    }
    for (val = 0; val < 255; val++)
    {
      analogWrite (11, val);
      analogWrite (10, 255 - val);
      analogWrite (9, 128 - val);
      delay (1);
    }

    clean();
    delay(1);
  }
}
