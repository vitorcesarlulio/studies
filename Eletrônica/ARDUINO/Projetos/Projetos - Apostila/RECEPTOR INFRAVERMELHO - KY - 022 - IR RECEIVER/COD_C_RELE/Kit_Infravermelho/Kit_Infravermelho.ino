// INCLUSÃO DE BIBLIOTECA
#include <IRremote.h>
#include <PiscaLed.h>

// DEFINIÇÃO PINOS
#define pinLedE   6
#define pinLedD   12
#define pinRele   7
#define pinSensor 11

// INSTANCIANDO OBJETOS

IRrecv sensorIR (pinSensor);
decode_results   comando;

PiscaLed ledDireito  (pinLedD, 300);
PiscaLed ledEsquerdo (pinLedE, 300);

// DECLARAÇÃO DAS VARIÁVEIS GLOBAIS
bool piscaLedDireito = false;
bool piscaLedEsquerdo = false;
bool piscandoDireito = false;
bool piscandoEsquerdo = false;
bool manual = true;
unsigned long tempoRele = 0;


void setup() {

  Serial.begin(9600);

  // HABILITANDO SENSOR IR
  sensorIR.enableIRIn();
  Serial.println("Sensor IR Habilitado");

  pinMode(pinRele, OUTPUT);
}

void loop() {
  ledDireito.loop(); ledEsquerdo.loop();

  // QUANDO RECEBER UM COMANDO DO CONTROLE INICIA O BLOCO
  if (sensorIR.decode(&comando)) {
    Serial.println(comando.value, HEX);

    switch (comando.value) {
      case (0xFF02FD): {
          digitalWrite(pinRele, !digitalRead(pinRele));
          manual = true;
          break;
      }  
      case (0xFFC23D): {
          piscaLedDireito = !piscaLedDireito;
          break;
      }  
      case (0xFF22DD): {
          piscaLedEsquerdo = !piscaLedEsquerdo;
          break;
      }  
      case (0xFF6897): {
          tempoRele = millis() + 1000;
          manual = false;
          break;
      } 
      case (0xFF9867): {
          tempoRele = millis() + 2000;
          manual = false;
          break;
      }  
      case (0xFFB04F): {
          tempoRele = millis() + 3000;
          manual = false;
          break;
      }  
      case (0xFF30CF): {
          tempoRele = millis() + 4000;
          manual = false;
          break;
      }  
      case (0xFF18E7): {
          tempoRele = millis() + 5000;
          manual = false;
          break;
      }  
      case (0xFF7A85): {
          tempoRele = millis() + 6000;
          manual = false;
          break;
      }  
      case (0xFF10EF): {
          tempoRele = millis() + 7000;
          manual = false;
          break;
      }  
      case (0xFF38C7): {
          tempoRele = millis() + 8000;
          manual = false;
          break;
      }  
      case (0xFF5AA5): {
          tempoRele = millis() + 9000;
          manual = false;
          break;
      }  
      case (0xFF4AB5): {
          tempoRele = millis() + 10000;
          manual = false;
          break;
      }
    }    

    sensorIR.resume();// ENCERRA PARA AGUARDAR NOVO COMANDO
  }
  
  //BLOCO DE CONTROLE DO RELE
  if (!manual) {
    if (tempoRele < millis()) {
      digitalWrite(pinRele, HIGH);
    } else {
      digitalWrite(pinRele, LOW);
    }
  }

  // BLOCO PARA CONTROLE DOS LEDS
  if (piscaLedDireito == true && piscandoDireito == false ) {
     ledDireito.play();
     piscandoDireito = true;
  } else if (piscaLedDireito == false && piscandoDireito == true) {
     ledDireito.stop();
     piscandoDireito = false;
  }
  if (piscaLedEsquerdo == true && piscandoEsquerdo == false) {
     ledEsquerdo.play();
     piscandoEsquerdo = true;
  } else if (piscaLedEsquerdo == false && piscandoEsquerdo == true) {
     ledEsquerdo.stop();
     piscandoEsquerdo = false;
  }

  delay(10);  
}
