#include <Servo.h>
#include <PS2X_lib.h>  //for v1.6

PS2X ps2x; // create PS2 Controller Class
Servo Base; 
Servo Elbow;  
Servo Shoulder;  
Servo Claw;
/****************************************************************************/
/*                  VARIAVEIS DE MANIPULAÇÃO GLOBAL                         */
/****************************************************************************/

int  error = 0; 
byte type = 0;
byte vibrate = 0;
byte select = 0;

/*------ ALTURA ------*/
int Angle_max_shoulder = 150; 
int Angle_min_shoulder = 105; //ACERTAR

/*------ FRENTE E TRAS ------*/
int Angle_max_elbow = 60; 
int Angle_min_elbow = 0;

/*------ BASE ------*/
int Angle_max_base = 170;
int Angle_min_base = 17;

/*------ GARRA ------*/
int Angle_claw_open = 30;
int Angle_claw_close = 130;

/*------ EM QUANTO COMEÇA ------*/
int Angle_start = 30;
/*
int Angle_start_shoulder = 130;
int Angle_start_elbow = 45;
int Angle_start_base = 110;
*/


int base_position = Angle_start;
int shoulder_position = Angle_start;
int elbow_position = Angle_start;
/*
int base_position = Angle_start_base;
int shoulder_position = Angle_start_shoulder;
int elbow_position = Angle_start_elbow;
*/

/****************************************************************************/

/****************************************************************************/
/*                       SEPUT DOS PERIFERICOS                              */
/****************************************************************************/
  
void setup(){

Serial.begin(9600);

Base.attach(9);
Elbow.attach(8);
Shoulder.attach(7);
Claw.attach(6);

Base.write(Angle_start);
Elbow.write(Angle_start);
Shoulder.write(Angle_start);
Claw.write(Angle_claw_open);
/*
Base.write(Angle_start_base);
Elbow.write(Angle_start_elbow);
Shoulder.write(Angle_start_shoulder);
Claw.write(Angle_claw_open);
*/

error = ps2x.config_gamepad(13,11,10,12, true, true);

 if(error == 0)
  {
  Serial.println("Seu controle foi conectado e configurado com sucesso");
  Serial.println("Bem vindo a movimentacao do seu ARTICULADOR ROBOTICO");
  }
 else if(error == 1) Serial.println("Nao foi identificado nenhum controle conectado, revise as conexoes"); 
 else if(error == 2) Serial.println("Controle encontrado, porem nao e possivel ler os comandos, revise as conexoes"); 

}

/****************************   FIM DO SETUP  *******************************/

/*------ FUNÇÃO ------*/ 
void Refresh_Position()
  {
  Base.write(base_position);
  Elbow.write(elbow_position);
  Shoulder.write(shoulder_position);
  }


/****************************************************************************/
/*                            INICIO DO LOOP                                */
/****************************************************************************/
   
void loop(){ 
  
Serial.println("ALTURA: ");
Serial.println(shoulder_position);

 if(error == 1) 
  return;  

  else { 

     Refresh_Position();
     ps2x.read_gamepad(false, vibrate);          //leia o controlador e configure o motor grande para girar na velocidade de 'vibração'
    
     if(ps2x.ButtonPressed(PSB_START)) {         //será TRUE enquanto o botão for pressionado
       vibrate = !vibrate;
       if(vibrate == 0)
       Serial.println("VIBRA DESLIGADO");
       else 
       Serial.println("VIBRA LIGADO");
       delay(1000); 
     }
       
     
     if(ps2x.ButtonPressed(PSB_SELECT)){
       select = !select;
       if(select == 0)
       Serial.println("JOYSTICK LIGADO");
       else {
       Serial.println("CONTROLE LIGADO");
       delay(1000);}        
     }


/****************************************************************************/
/*                       MOVIMENTAÇÃO POR BOTÃO                             */
/****************************************************************************/

        /*------ BASE: BOTOES DA DIREITA DIREITA(BOLINHA) E ESQUERDA(QUADRADO) ------*/
        else if(ps2x.Button(PSB_RED) && base_position < Angle_max_base){
             base_position++;        
             }            
        else if(ps2x.Button(PSB_PINK) && base_position > Angle_min_base){  
             base_position--;
             }

             
                  /*------ BOTOES DA ESQUERDA CIMA E BAIXO ------*/
        else if(ps2x.Button(PSB_PAD_UP) && shoulder_position < Angle_max_shoulder){
             shoulder_position++;                
             }          
        else if(ps2x.Button(PSB_PAD_DOWN) && shoulder_position > Angle_min_shoulder){
             shoulder_position--;          
             }
               
             
        /*------ BOTOES DA DIREITA CIMA(TRIANGULO) E BAIXO(X) ------*/
        if(ps2x.Button(PSB_BLUE) && elbow_position < Angle_max_elbow){
            elbow_position++;
            }            
        else if(ps2x.Button(PSB_GREEN) && elbow_position > Angle_min_elbow){ 
             elbow_position--;        
             } 
             
                   
                /*------ BOTOES DA ESQUERDA DIREITA E ESQUERDA ------*/
        /*
        else if(ps2x.Button(PSB_PAD_RIGHT) && && base_position > Angle_min_base){  
             base_position--;
             }
        else if(ps2x.Button(PSB_PAD_LEFT) && base_position < Angle_max_base){
             base_position++;        
             }
        */         
             
             /*------ GARRA ------*/
        else if(ps2x.Button(PSB_R1)){
             Claw.write(Angle_claw_open);  
             }

        else if(ps2x.Button(PSB_R2)){
             Claw.write(Angle_claw_close);
             }       
  }
 

/****************************************************************************/
/*                      MOVIMENTAÇÃO POR JOYSTICK                           */
/****************************************************************************/       

       if(select == 1) // print stick values if either is TRUE
      
      {
                /*------ JOY DA  ------*/
        if((ps2x.Analog(PSS_LY)  == 0)  && elbow_position < Angle_max_elbow){     //FUNFANDFO ELBOW FRENTE E TRAS
            elbow_position++;}
        else if((ps2x.Analog(PSS_LY) == 150)  && elbow_position > Angle_min_elbow){        
             elbow_position--;
             } 


               /*------ BASE: JOY DA  ------*/
        else if((ps2x.Analog(PSS_LX) == 0) && base_position < Angle_max_base ){  //FUNFANDO      
             base_position++;
             }             
        else if((ps2x.Analog(PSS_LX) == 150) && base_position > Angle_min_base){       
             base_position--;
             } 
        
              
               /*------ JOY DA  ------*/             
        else if((ps2x.Analog(PSS_RX) == 0) && shoulder_position < Angle_max_shoulder){    //FUNFANFO //SHOUDER //ALTURA       
             shoulder_position++;
             }
        else if((ps2x.Analog(PSS_RX) == 150)&& shoulder_position > Angle_min_shoulder){               
             shoulder_position--;
             } 

                           
             /*------ GARRA: JOY DA  ------*/
        else if(ps2x.Analog(PSS_RY) == 0){ 
             Claw.write(Angle_claw_close);
             }
        else if(ps2x.Analog(PSS_RY) == 150){   
             Claw.write(Angle_claw_open);
             }    
 }
       
        } // FIM DE CODIGO
  
