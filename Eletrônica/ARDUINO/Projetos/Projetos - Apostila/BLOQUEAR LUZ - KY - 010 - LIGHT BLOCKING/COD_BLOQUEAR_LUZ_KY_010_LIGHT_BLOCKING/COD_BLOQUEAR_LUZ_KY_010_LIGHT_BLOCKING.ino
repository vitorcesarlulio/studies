/* !-- VARIAVEIS --! */
// constantes não mudam. Eles são usados aqui para definir números de pinos:
const int buttonPin = 2;     // o número do pino do sensor
const int ledPin =  13;      // o número do pino da LAMPADA

// variáveis mudarão:
int buttonState = 0;         // variável para ler o status do botão


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  pinMode(ledPin, OUTPUT); // inicialize o pino do LED como uma saída:
  pinMode(buttonPin, INPUT_PULLUP); // inicialize o pino do botão como uma entrada:
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  buttonState = digitalRead(buttonPin); // leia o estado do valor do botão de pressão:

  // verifique se o botão está pressionado. Se for, o buttonState é HIGH:
  if (buttonState == HIGH) {
    digitalWrite(ledPin, LOW); // acende o LED:
  } else {
    digitalWrite(ledPin, HIGH); // apague o LED:
  }
} //FIM
