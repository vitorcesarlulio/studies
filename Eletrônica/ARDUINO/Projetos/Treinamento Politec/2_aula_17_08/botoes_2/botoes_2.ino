#define PinBtn1 7
#define PinBtn2 3
#define Pinled1 4
#define Pinled2 13

int wPisca = 0; 
int cont = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode(Pinled1, OUTPUT);
  pinMode(PinBtn1, INPUT);
  
  pinMode(Pinled2, OUTPUT);
  pinMode(PinBtn2, INPUT);

  
  //inicializa o monitor para depurar valores
  Serial.begin(9600);
  Serial.println("Valores");
}

void loop() {
  // Mostra na tela os resultados para depuração:
  Serial.print("Valor Btn:");
  Serial.println(digitalRead(PinBtn1));
  Serial.println(digitalRead(cont));
     
  if (digitalRead(PinBtn1) == HIGH) 
  {
            cont = cont + 1;
              if (cont==0)
              {
           
                      digitalWrite(Pinled1,LOW);
                      digitalWrite(Pinled2, LOW);                
              }
              if (cont==1)
                    {
                          
                      digitalWrite(Pinled1, HIGH);
                      digitalWrite(Pinled2, LOW);
                      }
              if (cont==2)
                      {
                           
                        digitalWrite(Pinled1, LOW);
                        digitalWrite(Pinled2, HIGH);
                        }
               if (cont==3)
                      {
                             
                        digitalWrite(Pinled1, HIGH);
                        digitalWrite(Pinled2, HIGH);
                        }
               if (cont==4)
                       {
                      cont = 0;
                        digitalWrite(Pinled1, LOW);
                        digitalWrite(Pinled2, LOW);
                       }
    }


//------------------------------------------------------------------------------------------------
  if (digitalRead(PinBtn2) == HIGH) {
    
      if (wPisca==0){
        wPisca=2; 
      }
      else{
        wPisca=0;   
      }
    
    
  if (wPisca == 2){
     digitalWrite(Pinled1, HIGH);
     digitalWrite(Pinled2, HIGH);
  }
   else {
     digitalWrite(Pinled1, LOW);
     digitalWrite(Pinled2, LOW);
  }
  
  delay(300);
 }
   delay(300);
 }
 
