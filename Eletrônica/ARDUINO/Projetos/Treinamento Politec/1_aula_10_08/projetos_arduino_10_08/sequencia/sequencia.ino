int wvermelho = 13; // saidas do arduino
int wamarelo = 12;
int wverde = 11;

int yvermelho = 7; // saidas do arduino
int yamarelo = 6;
int yverde = 5;
int temp = 50;

void setup()
{
  pinMode(wvermelho, OUTPUT); 
  pinMode(wamarelo, OUTPUT); 
  pinMode(wverde, OUTPUT); 

  pinMode(yvermelho, OUTPUT); 
  pinMode(yamarelo, OUTPUT); 
  pinMode(yverde, OUTPUT);
}

void loop() //vai e volta e ele vai ficando mais lento
{
         /* IDA */
         /* 1 */
  digitalWrite(wvermelho, HIGH);
  delay (temp);
  digitalWrite(wvermelho, LOW);

  digitalWrite(wamarelo, HIGH);
  delay (temp);
  digitalWrite(wamarelo, LOW);

  digitalWrite(wverde, HIGH);
  delay (temp);
  digitalWrite(wverde, LOW);

        /* 2 */
  digitalWrite(yvermelho, HIGH);
  delay (temp);
  digitalWrite(yvermelho, LOW);

  digitalWrite(yamarelo, HIGH);
  delay (temp);
  digitalWrite(yamarelo, LOW);

  digitalWrite(yverde, HIGH);
  delay (temp);
  digitalWrite(yverde, LOW);

        /* VOLTA */
        /* 1 */
  digitalWrite(yverde, HIGH);
  delay (temp);
  digitalWrite(yverde, LOW);

  digitalWrite(yamarelo, HIGH);
  delay (temp);
  digitalWrite(yamarelo, LOW);

  digitalWrite(yvermelho, HIGH);
  delay (temp);
  digitalWrite(yvermelho, LOW);

        /* 2 */
  digitalWrite(wverde, HIGH);
  delay (temp);
  digitalWrite(wverde, LOW);

  digitalWrite(wamarelo, HIGH);
  delay (temp);
  digitalWrite(wamarelo, LOW);

  digitalWrite(wvermelho, HIGH);
  delay (temp);
  digitalWrite(wvermelho, LOW);

   //delay (temp + 50); //===============================

  delay (temp = temp + 50);
}
