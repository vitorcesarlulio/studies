/*
  Botão e Servo

  Este programa transformará um servo motor em um
  ângulo pré-definido quando o botão é pressionado.
  Quando não pressionado, retorna ao original
  posição.
  
*/


/* !-- BIBLIOTECAS --! */ 
#include <Servo.h>


/* !-- VARIAVEIS --! */ 
int buttonstate = 0;

Servo servo_7;


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup()
{
  pinMode(2, INPUT);
  servo_7.attach(7);

}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop()
{
  buttonstate = digitalRead(2);
  if (buttonstate == HIGH) {
    servo_7.write(90);
    delay(1000); // Aguarde 1000 milissegundos
  } else {
    servo_7.write(0);
    delay(1000); // Aguarde 1000 milissegundos
  }
}
