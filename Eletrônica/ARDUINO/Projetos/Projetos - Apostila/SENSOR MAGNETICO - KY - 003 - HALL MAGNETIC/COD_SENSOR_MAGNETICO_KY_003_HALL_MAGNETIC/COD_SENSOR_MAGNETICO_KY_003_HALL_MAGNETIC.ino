/* !-- VARIAVEIS --! */
int LED = 12;
int SENSOR = 4;


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void setup() {
  pinMode(LED, OUTPUT);
  pinMode(SENSOR, INPUT);
  digitalWrite(LED, LOW);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  while (digitalRead(SENSOR) == HIGH);
  digitalWrite(LED, HIGH);
  while (digitalRead(SENSOR) == LOW);
  digitalWrite(LED, LOW);

  //digitalWrite(LED, !digitalRead(SENSOR));

  /*if(digitalRead(SENSOR)==HIGH){
    digitalWrite(LED, LOW);
    }else{
    digitalWrite(LED, HIGH);
    }*/
} //FIM
