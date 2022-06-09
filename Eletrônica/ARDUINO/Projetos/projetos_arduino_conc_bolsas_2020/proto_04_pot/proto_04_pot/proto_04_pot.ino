int led1 = 3;
int led2 = 5;
int led3 = 6;
int led4 = 9;
int led5 = 10;
int led6 = 11;

int pinopot = A1;   //Pino ligado ao pino central do potenciometro
int valorpot = 0;  //Armazena valor lido do potenciometro, entre 0 e 1023
 
float luminosidade = 0; //Valor de luminosidade do led
 
void setup()
{
   Serial.begin(9600);        //Inicializa a serial
   pinMode(pinopot, INPUT);   //Define o pino do potenciometro como entrada
   pinMode(led1, OUTPUT);  //Define o pino do led como saída
   pinMode(led2, OUTPUT);
   pinMode(led3, OUTPUT);
   pinMode(led4, OUTPUT);
   pinMode(led5, OUTPUT);
   pinMode(led6, OUTPUT);
   
}
 
void loop()
{
  // Le o valor - analogico - do pino do potenciometro
  valorpot = analogRead(pinopot);
 
  //Converte e atribui para a variavel "luminosidade" o
  // valor lido do potenciometro
  luminosidade = map(valorpot, 0, 1023, 0, 255);  
 
  Serial.print("Valor lido do potenciometro : "); 
 
  //Mostra o valor lido do potenciometro no monitor serial
  Serial.print(valorpot);   
  Serial.print(" = Luminosidade : ");
 
  //Mostra o valor da luminosidade no monitor serial
  Serial.println(luminosidade);  
 
  //Envia sinal analogico para a saída do led, com luminosidade variavel
  analogWrite(led1, luminosidade);
  analogWrite(led2, luminosidade);
  analogWrite(led3, luminosidade);
  analogWrite(led4, luminosidade);
  analogWrite(led5, luminosidade);
  analogWrite(led6, luminosidade);
    
}
