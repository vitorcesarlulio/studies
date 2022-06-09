//  Daremos um nome ao pino que está conectado o LED

int led = 10;

unsigned int valorLido;
unsigned int pwm;



//  Esta função "setup" roda uma vez quando a placa e ligada ou resetada 
void setup() {
  Serial.begin(9600);
  pinMode(led, OUTPUT); // Configura o pino do led (digital) como saída
}

//  Função que se repete infinitamente quando a placa é ligada
void loop() {

Serial.println(pwm);
delay(1);

valorLido = analogRead(A0); // valor entre 0 e 1023

pwm = map(valorLido, 0, 1023, 0, 255); // Mudança de escala analogWrite(led,pwm);//Escreve no led um sinal PWM proporcional ao valorLido
analogWrite(led,pwm);

}
