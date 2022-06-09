#define PinBtn1 7
#define PinBtn2 3
#define Pinled1 4
#define Pinled2 13

int wPisca = 0; 

void setup() {
  // put your setup code here, to run once:
  pinMode(Pinled1, OUTPUT);
  pinMode(PinBtn1, INPUT);
  
  pinMode(Pinled2, OUTPUT);
  pinMode(PinBtn2, INPUT);

  Serial.begin(9600); // escreve na porta serial (monitor do sistema) ==> debug
  Serial.println("Valor do BTN");
}

void loop() {
  
  Serial.print("Valor Btn:");
  Serial.println(digitalRead(PinBtn1));
  Serial.print("Valor Btn:"); 
  Serial.println(digitalRead(PinBtn2));
    
  if (digitalRead(PinBtn1) != LOW) 
    {
    digitalWrite(Pinled1, HIGH);  
    }
  else 
    {
    digitalWrite(Pinled1, LOW);
    }

  if (digitalRead(PinBtn2) == HIGH) 
    {
      if (wPisca==0){
        wPisca=2; 
      }
      else{
        wPisca=0;   
      }
    }
    
  if (wPisca == 2){
     digitalWrite(Pinled2, !digitalRead(Pinled2));
  }
   else {
     digitalWrite(Pinled2, LOW);
  }
  
  delay(100);
 }
 
