/* !-- VARIAVEIS --! */
/*  AÇÕES  */
int press1 = 0;
int press2 = 0;

/* LEDS */
int led1 = 8;
int led2 = 11;

/* BOTÃO */
int btn1 = 2;
int btn2 = 6;

/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {

  pinMode(8, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(2, INPUT);
  pinMode(6, INPUT);

}

/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {

  press1 = digitalRead(btn1);
  press2 = digitalRead(btn2);


  if (press1 == HIGH) {
    digitalWrite(led1, HIGH);
  } else {
    digitalWrite(led1, LOW);
  }

  if (press2 == HIGH) {
    digitalWrite(led2, HIGH);
  } else {
    digitalWrite(led2, LOW);
  }


} //FIM DO LOOP
