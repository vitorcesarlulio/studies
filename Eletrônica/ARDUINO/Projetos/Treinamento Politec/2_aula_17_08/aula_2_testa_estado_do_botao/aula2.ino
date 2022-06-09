// set pinos
const int buttonPin = 3; // número do pino pushbutton
const int ledPin = 4; // número do pino LED
 
// set variables
int estado = 0; // variável para leitura do pushbutton
int guarda_estado = LOW; // variável para armazenar valores do pushbutton
 
void setup() {
  // define o pino do Led como saída do Arduino
  pinMode(ledPin, OUTPUT);

  // define pino do pushbutton como entrada do Arduino:
  pinMode(buttonPin, INPUT);
}
 
void loop(){
  // le o estado pushbutton: ligado (HIGH) ou desligado (LOW)
  estado = digitalRead(buttonPin);
 
  // verifica se o botão (pushbutton) está pressionado  
  if (estado == HIGH) {
    // inverte valor da variável variable_buttonEstado
    guarda_estado = !guarda_estado;

    //esperera o tempo de 500ms para evitar 
    delay(500);
  }
 
  if (guarda_estado == HIGH) {
    // liga o led
    digitalWrite(ledPin, HIGH);
  }
  else {
    digitalWrite(ledPin, LOW);
  }
} 

