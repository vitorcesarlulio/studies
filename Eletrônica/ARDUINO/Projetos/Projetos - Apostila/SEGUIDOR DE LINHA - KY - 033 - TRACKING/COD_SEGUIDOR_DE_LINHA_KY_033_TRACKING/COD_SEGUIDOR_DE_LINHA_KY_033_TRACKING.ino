/* !-- VARIAVEIS --! */
int WhiteLed = 2;
int Sensor = A5;
int sensorValue = 0;


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup () {
  pinMode (WhiteLed, OUTPUT);
  Serial.begin (9600);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop () {
  sensorValue = analogRead (Sensor);

  if (sensorValue < 50 && sensorValue < 500) {
    digitalWrite (WhiteLed, HIGH);
    Serial.println (sensorValue, DEC);
  }
  else (sensorValue > 500 && sensorValue > 1023); {
    digitalWrite (WhiteLed, LOW);
    Serial.println (sensorValue, DEC);
  }
} //FIM
