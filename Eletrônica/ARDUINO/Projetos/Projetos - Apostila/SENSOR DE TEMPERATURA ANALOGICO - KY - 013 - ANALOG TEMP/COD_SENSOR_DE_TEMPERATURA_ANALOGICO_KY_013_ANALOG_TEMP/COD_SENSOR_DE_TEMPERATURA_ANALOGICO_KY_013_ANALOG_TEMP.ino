/* !-- VARIAVEIS --! */
int ThermistorPin = A0;
int Vo;
float R1 = 10000;
float logR2, R2, T;
float c1 = 0.001129148, c2 = 0.000234125, c3 = 0.0000000876741; //coeficientes de steinhart-hart para termistor


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  Serial.begin(9600);
}

/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  Vo = analogRead(ThermistorPin);
  R2 = R1 * (1023.0 / (float)Vo - 1.0); //calcular resistência no termistor
  logR2 = log(R2);
  T = (1.0 / (c1 + c2 * logR2 + c3 * logR2 * logR2 * logR2)); // temperature em Kelvin
  T = T - 273.15; //converter Kelvin em Celsius
  // T = (T * 9.0)/ 5.0 + 32.0; //converter Celcius em Farenheit

  Serial.print("Temperature: ");
  Serial.print(T);
  Serial.println(" C");

  delay(500);
} //FIMS
