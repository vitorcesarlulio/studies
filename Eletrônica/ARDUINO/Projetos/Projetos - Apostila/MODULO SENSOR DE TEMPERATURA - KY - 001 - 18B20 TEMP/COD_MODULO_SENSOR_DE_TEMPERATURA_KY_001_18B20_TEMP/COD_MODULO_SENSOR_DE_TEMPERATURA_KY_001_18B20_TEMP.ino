/* !-- BIBLIOTECAS --! */
#include <OneWire.h>
#include <DallasTemperature.h>

// O fio de dados está conectado ao pino 2 no Arduino
#define ONE_WIRE_BUS 2


/* !-- VARIAVEIS --! */
// Configure uma instância do oneWire para se comunicar com todos os dispositivos OneWire (não apenas os ICs de temperatura Maxim / Dallas)
OneWire oneWire(ONE_WIRE_BUS);
// Passe nossa referência oneWire à temperatura de Dallas.
DallasTemperature sensors(&oneWire);


/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup(void)
{
  // inicia porta serial
  Serial.begin(9600);
  Serial.println("Demonstração da Biblioteca de controle de temperatura IC de Dallas");
  // Inicie a biblioteca
  sensors.begin(); // IC padrão 9 bits. Se você tiver problemas, considere aumentá-lo 12. Aumenta o atraso, dando ao IC mais tempo para processar a medição de temperatura
}


/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop(void)
{
  // chame sensores.requestTemperatures () para emitir uma temperatura global
    // solicitação para todos os dispositivos no barramento
  Serial.print("Solicitando temperaturas ...");
  sensors.requestTemperatures(); // Envie o comando para obter temperaturas
  Serial.println("DONE");

  Serial.print("A temperatura para o dispositivo 1 é:");
  Serial.print(sensors.getTempCByIndex(0)); // Por que "byIndex"? Você pode ter mais de um IC no mesmo barramento. 0 refere-se ao primeiro IC no fio
}
