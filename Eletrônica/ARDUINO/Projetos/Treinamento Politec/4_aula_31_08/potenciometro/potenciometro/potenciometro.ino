//  Daremos um nome ao pino que está conectado o LED

int led = 10;

unsigned int valorLido;
unsigned int pwm;
String spot= "valor pot:";
String spwm= "valor pwm:";

int xpwm = -1;

//  Esta função "setup" roda uma vez quando a placa e ligada ou resetada 
void setup() {
  Serial.begin(9600);
  pinMode(led, OUTPUT); // Configura o pino do led (digital) como saída
}

//  Função que se repete infinitamente quando a placa é ligada
void loop() {
  
int pot = analogRead(A0);


if(xpwm != pwm){
  Serial.println(spwm);
  Serial.println(pwm);
   Serial.println(spot);
  Serial.println(pot);
  xpwm = pwm;
}
delay(1);


valorLido = analogRead(A0); // valor entre 0 e 1023

pwm = map(valorLido, 0, 1023, 0, 255); // Mudança de escala analogWrite(led,pwm);//Escreve no led um sinal PWM proporcional ao valorLido
analogWrite(led,pwm);

}
