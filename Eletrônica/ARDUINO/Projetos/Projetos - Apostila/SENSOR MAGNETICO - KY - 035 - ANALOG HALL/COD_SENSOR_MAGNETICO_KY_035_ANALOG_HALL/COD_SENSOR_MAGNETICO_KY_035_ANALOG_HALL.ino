/* !-- VARIAVEIS --! */
int Buzzer = 4;
int sensorPin = A0;
int GreenLed = 2;
int BlueLed = 3;
int sensorValue = 0;


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup () {
  pinMode (BlueLed, OUTPUT);
  pinMode (GreenLed, OUTPUT);
  pinMode (Buzzer, OUTPUT);
  Serial.begin (9600);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop () {
  sensorValue = analogRead (sensorPin);

  if (analogRead(1) > 575 && analogRead(1) < 700)
    // Você pode jogar com esses valores, abrir serial monitora para ver as leituras de valor.
  {
    digitalWrite (BlueLed, HIGH);
    digitalWrite (Buzzer, HIGH);
    delay(1000);
    digitalWrite (BlueLed, LOW);
    digitalWrite (Buzzer, LOW);
    delay(100);
    Serial.println(sensorValue, DEC);
  }
  else
  {
    digitalWrite (BlueLed, LOW);
    digitalWrite (GreenLed, HIGH);
    delay(1000);
    digitalWrite (GreenLed, LOW);
    digitalWrite (Buzzer, LOW);
    delay(100);
    Serial.println(sensorValue, DEC);
  }
} //FIM
