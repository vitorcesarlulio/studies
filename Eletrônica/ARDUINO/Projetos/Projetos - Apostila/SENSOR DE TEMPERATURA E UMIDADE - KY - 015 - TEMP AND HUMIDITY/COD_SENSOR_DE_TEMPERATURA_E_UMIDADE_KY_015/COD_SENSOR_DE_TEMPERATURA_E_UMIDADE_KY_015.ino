/* !-- BIBLIOTECAS --! */
#include <DHT.h>

/* !-- VARIAVEIS --! */
int SENSOR = 2;
int temp, humedad ;
DHT dht (SENSOR, DHT11);


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  Serial.begin(9600);
  dht.begin();
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {

  humedad = dht.readHumidity();
  temp = dht.readTemperature();

  Serial.print("Temperatura:");
  Serial.print("temp");
  Serial.print(" Humedad:");
  Serial.print( " humedad " + "%");
  delay(10000);
} //FIM
