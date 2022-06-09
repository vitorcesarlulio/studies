
// set variables
int estado = 0;// variável para leitura do pushbutton
int guarda_estado = LOW; // variável para armazenar valores do pushbutton
int wPisca = 0; 

void setup() {
  // define o pino do Led como saída do Arduino
  pinMode(13, OUTPUT);
  pinMode(3, OUTPUT);


  // define pino do pushbutton como entrada do Arduino:
  pinMode(4, INPUT);



  Serial.begin(9600);
  Serial.println("Valor do BTN");
}
 
void loop(){
  
  Serial.print("Valor Btn:");
  Serial.println(digitalRead(4));
  
  // le o estado pushbutton: ligado (HIGH) ou desligado (LOW)
  estado = digitalRead(4);
 
  // verifica se o botão (pushbutton) está pressionado  
  if (estado == HIGH) {
    // inverte valor da variável variable_buttonEstado
    guarda_estado = !guarda_estado;

    //esperera o tempo de 500ms para evitar 
    delay(500);
  }
 
  if (guarda_estado == HIGH) {
    // liga o led
    digitalWrite(13, HIGH);
  }
  else {
    digitalWrite(13, LOW);
  }


//------------------------------------

  digitalWrite(3,HIGH);
if (digitalRead(3) == HIGH)
{{
      if (wPisca==0){
        wPisca=2; 
      }
      else{
        wPisca=0;   
      }
}
  if (wPisca == 2){
     digitalWrite(3, HIGH);
}
   else {
     digitalWrite(3, LOW);
     
    }
  
  delay(300);
}
  delay(300);
}

