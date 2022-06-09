byte ledPin[] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}; // cria um array para os pinos digitais dos LEDs
int ledDelay;
int direction;
int currentLED;
int ledDir;
int ledEsq;
int l;
int h;


int speakerPin = A0;
int volume = 0;


void setup() {
    for (int x=0; x<10; x++) { // define todos os pinos dos LEDs como saída
    pinMode(ledPin[x], OUTPUT); }
    pinMode (speakerPin, OUTPUT);
}


void loop() {
  
 buzina();
 
// EFEITO 1 - vai e volta
      currentLED = 0;
      direction = 1;
      for(int i = 0; i < 72; i++){ // efeito 1: vai e volta
            
        digitalWrite(ledPin[currentLED], HIGH); // acende o LED atual
        currentLED += direction; // incrementa de acordo com o valor de direction
        delay(60);
        for (int x=0; x<10; x++) { // apaga todos os LEDs
        digitalWrite(ledPin[x], LOW);
        }
        // altera a direção se tivermos atingido o fim
        if (currentLED == 9) {direction = -1;}
        if (currentLED == 0) {direction = 1;}
    }

  buzina();
 
// EFEITO 2 - girando
    currentLED = 0;
    direction = 1;
    for(int i = 0; i < 144; i++){ // efeito 2: girando
            
        digitalWrite(ledPin[currentLED], HIGH); // acende o LED atual
        if (currentLED>0){digitalWrite(ledPin[currentLED-1], LOW);} // acende o LED atual
        currentLED += direction; // incrementa de acordo com o valor de direction
        delay(35);
        if (currentLED == 10) {digitalWrite(ledPin[currentLED-1], LOW);currentLED = 0;}
        }

  buzina();
    
// EFEITO 3 - pares e ímpares    
    currentLED = 0;
    direction = 1;
    for(int i = 0; i < 80; i++){ // efeito 3: pares e ímpares

                 
        if (direction==1) {
        if ( currentLED % 2 == 0 ) {
        digitalWrite(ledPin[currentLED], HIGH); // acende o LED atual
        currentLED += direction; // incrementa de acordo com o valor de direction
        }
        else {
        digitalWrite(ledPin[currentLED], LOW); // apaga o LED atual
        currentLED += direction; // incrementa de acordo com o valor de direction
        }
        delay (65);
        }
        if (direction==-1){
        if ( currentLED % 2 == 0 ) {
        digitalWrite(ledPin[currentLED], LOW); // acende o LED atual
        currentLED += direction; // incrementa de acordo com o valor de direction
        }
        else {
        digitalWrite(ledPin[currentLED], HIGH); // apaga o LED atual
        currentLED += direction; // incrementa de acordo com o valor de direction
        }
        delay (65);
        }
        
        // altera a direção se tivermos atingido o fim
        if (currentLED == 10) {direction = -1;}
        if (currentLED == -1) {direction = 1;}
    }

  buzina();

//EFEITO 4 - pares e ímpares 2
   for(int i = 0; i < 15; i++){ // efeito 4: pares e ímpares
        

        for (int x=0; x<10; x++) { // ACENDE OS LEDs PARES
            if ( x % 2 == 0 ) {
            digitalWrite(ledPin[x], HIGH); // ACENDE o LED atual
            }
        }
       
        for (int x=0; x<10; x++) { // APAGA OS LEDs IMPARES
            if ( x % 2 != 0 ) {
            digitalWrite(ledPin[x], LOW); // apaga o LED atual
            }
        }
        delay(200);

        for (int x=0; x<10; x++) { // APAGA OS LEDs PARES
            if ( x % 2 == 0 ) {
            digitalWrite(ledPin[x], LOW); // apaga o LED par atual
            }
        }
        for (int x=0; x<10; x++) { // acende OS LEDs IMPARES
            if ( x % 2 != 0 ) {
            digitalWrite(ledPin[x], HIGH); // apaga o LED atual
            }
        }
        delay(200);
    }
       for (int x=0; x<10; x++) { // APAGA OS LEDs IMPARES
            if ( x % 2 != 0 ) {
            digitalWrite(ledPin[x], LOW); // apaga o LED atual
            }
        }
        delay(1000);
  buzina();
  
//EFEITO 5 - VU Meter
    currentLED = 0;
    direction = 1;
    for(int i = 0; i < 80; i++){ // efeito 5: Vu Meter
            
        if (direction==1) {
        digitalWrite(ledPin[currentLED], HIGH); // acende o LED atual
        currentLED += direction; // incrementa de acordo com o valor de direction
        delay(35);
        }
        if (direction==-1){
        digitalWrite(ledPin[currentLED], LOW); // acende o LED atual
        currentLED += direction; // incrementa de acordo com o valor de direction
        delay(35);
        }
        delay (200);
        // altera a direção se tivermos atingido o fim
        if (currentLED == 10) {direction = -1; currentLED=9;}
        if (currentLED == -1) {direction = 1; currentLED=0;}
    }
    
  buzina();

// EFEITO 6 - Giroflex
    for(int i = 0; i < 30; i++){
        digitalWrite(ledPin[0], HIGH);
        digitalWrite(ledPin[5], HIGH);
        delay(50);
        digitalWrite(ledPin[0], LOW);
        digitalWrite(ledPin[5], LOW);
        digitalWrite(ledPin[1], HIGH);
        digitalWrite(ledPin[6], HIGH);
        delay(50);
        digitalWrite(ledPin[1], LOW);
        digitalWrite(ledPin[6], LOW);
        digitalWrite(ledPin[2], HIGH);
        digitalWrite(ledPin[7], HIGH);
        delay(50);
        digitalWrite(ledPin[2], LOW);
        digitalWrite(ledPin[7], LOW);
        digitalWrite(ledPin[3], HIGH);
        digitalWrite(ledPin[8], HIGH);
        delay(50);
        digitalWrite(ledPin[3], LOW);
        digitalWrite(ledPin[8], LOW);
        digitalWrite(ledPin[4], HIGH);
        digitalWrite(ledPin[9], HIGH);
        delay(50);
        digitalWrite(ledPin[4], LOW);
        digitalWrite(ledPin[9], LOW);
    }

  buzina();
    
// EFEITO 7
    for(int i = 0; i < 12; i++){
        for (int x=0; x<10; x++) { // acente todos os LEDs
        digitalWrite(ledPin[x], HIGH);
        }
        delay(150);

        for (int x=0; x<10; x++) { // APAGA OS LEDs PARES
            if ( x % 2 == 0 ) {
            digitalWrite(ledPin[x], LOW); // apaga o LED par atual
            }
        }
        delay(350);

        for (int x=0; x<10; x++) { // ACENDE OS LEDs PARES
            if ( x % 2 == 0 ) {
            digitalWrite(ledPin[x], HIGH); // ACENDE o LED atual
            }
        }
        delay(150);

        for (int x=0; x<10; x++) { // APAGA OS LEDs IMPARES
            if ( x % 2 != 0 ) {
            digitalWrite(ledPin[x], LOW); // apaga o LED atual
            }
        }
        delay(350);

        for (int x=0; x<10; x++) { // APAGA OS PARES
            if ( x % 2 == 0 ) {
            digitalWrite(ledPin[x], LOW); // apaga o LED atual
            }
        }
        delay(150);
    }
        
  buzina();

// EFEITO 8 - Começa nos cantos
    ledDir = 0;
    ledEsq = 9;
    for(int i = 0; i < 4; i++){
        
        for(int i = 0; i < 5; i++){
            digitalWrite(ledPin[ledDir], HIGH); // acende o LED atual
            
            ledDir = ledDir +1;
            delay(182);
            
            digitalWrite(ledPin[ledEsq], HIGH); // acende o LED atual
            ledEsq = ledEsq -1;
            delay(182);
        }

         ledDir = 0;
         ledEsq = 9;   
         for(int i = 0; i < 5; i++){
            digitalWrite(ledPin[ledDir], LOW); // apaga o LED atual
            ledDir = ledDir +1;
            delay(182);
            
            digitalWrite(ledPin[ledEsq], LOW); // apaga o LED atual
            ledEsq = ledEsq -1;
            delay(182);
        }   
    }
    
  buzina();
  
// EFEITO 9 - zig e zag
        
    for(int i = 0; i < 7; i++){
        
        l = 1; // apaga
        h = 0; // acende

        for(int i = 0; i < 10; i++){
            
            digitalWrite(ledPin[l], LOW); // apaga o LED atual
            l = l - 1;
            digitalWrite(ledPin[h], HIGH); // acende o LED atual           
            h = h + 2;
            delay(90);
            
            digitalWrite(ledPin[l], LOW); // apaga o LED atual
            l = l + 2;
            digitalWrite(ledPin[h], HIGH); // acende o LED atual           
            h = h - 1;
            delay(90);
        }
    }
    
  buzina();

// EFEITO 10 - três em três
        
    for(int i = 0; i < 7; i++){
        
        l = 7; // apaga
        h = 0; // acende

        for(int i = 0; i < 10; i++){
            
            digitalWrite(ledPin[l], LOW); // apaga o LED atual
            l = l + 1;
            if (l>9) {l = 0;}
            digitalWrite(ledPin[h], HIGH); // acende o LED atual           
            h = h + 1;
            delay(103);         
        }
        l = 7;
        for(int i = 0; i < 3; i++){
        digitalWrite(ledPin[l], LOW); // apaga o LED atual
        l = l + 1;
        delay(103);
        }
    }

} // DO VOID LOOP


void buzina () {
  digitalWrite(ledPin[1],  HIGH);
  digitalWrite(ledPin[2],  HIGH); // NAO TA ACENDENDO
  digitalWrite(ledPin[3],  HIGH);
  digitalWrite(ledPin[4],  HIGH);
  digitalWrite(ledPin[5],  HIGH);
  digitalWrite(ledPin[6],  HIGH);
  digitalWrite(ledPin[7],  HIGH);
  digitalWrite(ledPin[8],  HIGH);
  digitalWrite(ledPin[9],  HIGH);
  digitalWrite(ledPin[10], HIGH);
  digitalWrite(ledPin[11], HIGH);
  digitalWrite(ledPin[12], HIGH);
  digitalWrite(ledPin[13], HIGH);
  
  for(volume; volume<255; volume++){
  analogWrite (speakerPin, volume);
  delay (30);
  }
  volume = 120;
   analogWrite (speakerPin, volume);
 
}
