/* !-- VARIAVEIS --! */
int led = 13; // pino LED
int reelSwitch = 2; // sentido magnético rpin
int switchState; // variável para armazenar o valor da chave de bobina


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup()
{
  pinMode (led, OUTPUT);
  pinMode (reelSwitch, INPUT);
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop()
{
  switchState = digitalRead(reelSwitch); // leia o valor da interface digital 2 e atribua-o a switchState

  if (switchState == HIGH) // quando o sensor magnético detecta um sinal, o LED está piscando
  {
    digitalWrite(led, HIGH);
  }
  else
  {
    digitalWrite(led, LOW);
  }
}
