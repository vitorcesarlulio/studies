/* !-- VARIAVEIS --! */
const int  buttonPin = 4;    // o pino ao qual o botão está conectado
const int ledPin = 12;       // o pino ao qual o LED está conectado

int buttonPushCounter = 0;   // contador para o número de pressionamentos de botão
int buttonState = 0;         // estado atual do botão
int lastButtonState = 0;     // estado anterior do botão


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  pinMode(buttonPin, INPUT); //inicialize o pino do botão como uma entrada
  pinMode(ledPin, OUTPUT); // inicialize o pino do botão como uma entrada
  Serial.begin(9600);   // inicialize a comunicação serial
}



/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop() {
  // leia o pino de entrada do botão:
  buttonState = digitalRead(buttonPin);

  // compare o buttonState com o estado anterior
  if (buttonState != lastButtonState) {
    // se o estado mudou, aumente o contador
    if (buttonState == HIGH) { // se o estado atual for ALTO, o botão, passou de desativado para ativado:
      buttonPushCounter++;
      Serial.println("on");
      Serial.print("number of button pushes:  ");
      Serial.println(buttonPushCounter);
    }
    else {
      Serial.println("off"); //se o estado atual for BAIXO, o botão passou de ligado para desligado
    }
  }

  /*salva o estado atual como o último estado,
      para a próxima vez no loop*/
  lastButtonState = buttonState;


  /* acende o LED a cada quatro botões pressionados checando
    o módulo do botão de pressão.
       a função modulo fornece o restante de a divisão de dois números:*/
  if (buttonPushCounter % 4 == 0) {
    digitalWrite(ledPin, HIGH);
  } else {
    digitalWrite(ledPin, LOW);
  }

} //FIM DO LOOP
