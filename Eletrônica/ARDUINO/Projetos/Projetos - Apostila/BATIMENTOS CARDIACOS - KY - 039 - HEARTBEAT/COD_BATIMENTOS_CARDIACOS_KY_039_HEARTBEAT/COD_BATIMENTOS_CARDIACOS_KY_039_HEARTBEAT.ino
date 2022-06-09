/* !-- VARIAVEIS --! */
/* !-- BIBLIOTECAS --! */
#include <Wire.h>
#include <LiquidCrystal.h>
// # include <LiquidCrystal_I2C.h> descomente ao usar um I2C

/* LiquidCrystal_I2C lcd (0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVO); Descomente ao usar um I2C
  certifique-se de definir o endereço certo. aqui estão os mais comuns.
  PCF8574 = 0x20, PCF8574A = 0x38, PCF8574AT = 0x3F. */

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
double alpha = 0.75;
int period = 20;
double refresh = 0.0;

/* !-- INICIO DO SETUP (SO PASSA AQUI 1 VEZ) --! */
void setup(void)
{
  pinMode(A0, INPUT);
  lcd.begin(16, 2);
  //lcd.backlight(); Descomente ao usar um I2C
  lcd.clear();
  lcd.setCursor(0, 0);
}

/* !-- INICIO DO LOOP (REPETIÇÃO) --! */
void loop(void)
{
  static double oldValue = 0;
  static double oldrefresh = 0;

  int beat = analogRead(A0);

  double value = alpha * oldValue + (0 - alpha) * beat;
  refresh = value - oldValue;


  lcd.setCursor(0, 0);
  lcd.print(" Heart Monitor ");
  lcd.setCursor(0, 1);
  lcd.print("          ");
  lcd.setCursor(0, 1);
  lcd.print(beat / 10);
  oldValue = value;
  oldrefresh = refresh;
  delay(period * 10);
} //FIM
