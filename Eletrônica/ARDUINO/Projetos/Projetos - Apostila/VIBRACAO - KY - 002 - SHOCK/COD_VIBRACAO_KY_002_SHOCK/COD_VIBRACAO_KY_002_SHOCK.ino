/* !-- VARIAVEIS --! */
int led = 12;   // defina o pino do LED
int sensor = 4; // definir o pino do sensor (VIBRACAO - KY - 002 - SHOCK)
int var;        // definir uma variável numérica var


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup () {
  pinMode (led, OUTPUT);  // Pino do LED como saída
  pinMode (sensor, INPUT); // entrada do sensor VIBRACAO - KY - 002 - SHOCK
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop () {
  var = digitalRead (sensor); // leia o valor de KY-002
  if (var == HIGH ) {     // quando o sensor detecta choque, o LED pisca
    digitalWrite(led, LOW);
  } else {
    digitalWrite (led, HIGH);
  }
} //FIM
