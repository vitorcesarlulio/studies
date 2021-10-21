int wvermelho = 13; // saidas do arduino
int wamarelo = 12;
int wverde = 11;

int yvermelho = 7; // saidas do arduino
int yamarelo = 6;
int yverde = 5;
int temp = 3000;

void setup()
{
  pinMode(wvermelho, OUTPUT); 
  pinMode(wamarelo, OUTPUT); 
  pinMode(wverde, OUTPUT); 

  pinMode(yvermelho, OUTPUT); 
  pinMode(yamarelo, OUTPUT); 
  pinMode(yverde, OUTPUT);
}

void loop()
{
  
  digitalWrite(wvermelho, HIGH);
  digitalWrite(wamarelo, LOW);
  digitalWrite(wverde, LOW);
  digitalWrite(yvermelho, LOW);
  digitalWrite(yamarelo, LOW);
  digitalWrite(yverde, HIGH);
  delay (temp);

  digitalWrite(wvermelho, HIGH);
  digitalWrite(wamarelo, LOW);
  digitalWrite(wverde, LOW);
  digitalWrite(yvermelho, LOW);
  digitalWrite(yamarelo, HIGH);
  digitalWrite(yverde, LOW);
  delay (temp); 

  digitalWrite(wvermelho, LOW);
  digitalWrite(wamarelo, LOW);
  digitalWrite(wverde, HIGH);
  digitalWrite(yvermelho, HIGH);
  digitalWrite(yamarelo, LOW);
  digitalWrite(yverde, LOW);
  delay (temp); 

  digitalWrite(wvermelho, LOW);
  digitalWrite(wamarelo, HIGH);
  digitalWrite(wverde, LOW);
  digitalWrite(yvermelho, HIGH);
  digitalWrite(yamarelo, LOW);
  digitalWrite(yverde, LOW);
  delay (temp); 

  digitalWrite(wvermelho, LOW);
  digitalWrite(wamarelo, LOW);
  digitalWrite(wverde, HIGH);
  digitalWrite(yvermelho, HIGH);
  digitalWrite(yamarelo, LOW);
  digitalWrite(yverde, LOW);
  delay (temp); 
   
  
}
