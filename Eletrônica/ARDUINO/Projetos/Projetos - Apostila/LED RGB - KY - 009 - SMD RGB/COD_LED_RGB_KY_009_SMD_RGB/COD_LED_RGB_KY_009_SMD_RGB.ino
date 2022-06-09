/* !-- VARIAVEIS --! */
int pinoBlue = 11; //PINO DIGITAL UTILIZADO PELO TERMINAL AZUL
int pinoRed = 10; //PINO DIGITAL UTILIZADO PELO TERMINAL VERMELHO
int pinoGreen = 9; //PINO DIGITAL UTILIZADO PELO TERMINAL VERDE

int val; //VARIÁVEL DO TIPO INTEIRA


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup() {
  pinMode(pinoRed, OUTPUT); //DEFINE O PINO COMO SAÍDA
  pinMode(pinoBlue, OUTPUT); //DEFINE O PINO COMO SAÍDA
  pinMode(pinoGreen, OUTPUT); //DEFINE O PINO COMO SAÍDA
}

/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop () {
  for (val = 255; val > 0; val --) { //PARA val IGUAL A 255, ENQUANTO val MAIOR QUE 0, DECREMENTA val
    analogWrite(pinoRed, val); //PINO RECEBE O VALOR
    analogWrite(pinoBlue, 255 - val); //PINO RECEBE O VALOR
    analogWrite(pinoGreen, 128 - val); //PINO RECEBE O VALOR
    delay (10); //INTERVALO DE 10 MILISSEGUNDOS
  }
  for (val = 0; val < 255; val ++) { //PARA val IGUAL A 0, ENQUANTO val MENOR QUE 255, INCREMENTA val
    analogWrite(pinoRed, val); //PINO RECEBE O VALOR
    analogWrite(pinoBlue, 255 - val); //PINO RECEBE O VALOR
    analogWrite(pinoGreen, 128 - val); //PINO RECEBE O VALOR
    delay (10); //INTERVALO DE 10 MILISSEGUNDOS
  }
} //FIM
