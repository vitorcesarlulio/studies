/* !-- BIBLIOTECAS --! */
#include <IRremote.h>


/* !-- VARIAVEIS --! */
int RECV_PIN = 11;
IRrecv irrecv(11);
decode_results results;


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup()
{
  pinMode(13, OUTPUT);
  Serial.begin(9600);
  irrecv.enableIRIn(); //start the receiver
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop()
{
  if (irrecv.decode(&results))
  {
    Serial.println(results.value);
    irrecv.resume();
  }
  if (results.value == 16582903)
  {
    digitalWrite(13, HIGH);
  }
  if (results.value == 16593103)
  {
    digitalWrite(13, LOW);
  }

}//FIM DO LOOP
