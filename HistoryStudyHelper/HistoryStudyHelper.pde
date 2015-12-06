String years[]={};
String events[]={};
int dotsX[] = {};
int eventIndexes[] ={};
int phase = 0;
int randomIndex;
String eventsCopy[] = {};
boolean open=true;
PImage correct;
  
int amountDone = 0;
// 0 = creating events
// 1 = scrambling
import javax.swing.*;
void setup(){
 fullScreen() ;
 background(200,200,255);
 
 strokeWeight(6);
 fill(200,90,90);
 textSize(30);
 textAlign(CENTER,CENTER);
 text("Click a point on the timeline to add an event",width/2,height/4); 
 stroke(60,150,60);
 line(40,displayHeight/2,displayWidth-40,displayHeight/2);

}
void draw(){
  if(phase==0) {
  stroke(200,90,90);
  fill(200,90, 90);
  rect(1200,800,200,70);
  fill(200,200,255);
  textSize(60);
  text("TEST" ,1300,830);
  textSize(30);
  fill(200,90,90);
  text("When you are ready click test", width / 2, height / 1.2);
    for(int i = 0; i < dotsX.length;i++){
          strokeWeight(15);
  point(dotsX[i],displayHeight/2);
  fill(23, 170, 227);
  textSize(30);
  text(years[i], dotsX[i],(displayHeight/2)+60);
    text(events[i],dotsX[i],(displayHeight/2)-60);
    }
  }
  if(phase==1) {
    if(open==true){
  if(amountDone < events.length) {
    randomIndex = (int)random(events.length);
    while(eventsCopy[randomIndex] == null) {
      
      randomIndex = (int)random(events.length);
    }
    fill(23, 170, 227);
    text(eventsCopy[randomIndex], width / 2, (height / 4));
    open=false;
  } else {
    
    //saveFrame("data/
    correct = loadImage("Correct.jpg");
    fill(200,90,90);
    text("Compare your test results to the correct answer:", width / 2, 100);
      imageMode(CENTER);
      image(correct, width / 2, height / 1.1, width / 2, height / 2);
      text("Correct Answer:", width / 2, height / 1.4);
  }
  
    
          
  }
  
    /* int randomIndex = (int)random(events.length);
    boolean used=true;
  //  for(int j=0;j<eventIndexes.length; j++){
  //  if(eventIndexes[j]==randomIndex){
  //  used=true;
  //  }
  //  }
    while (used==true){
    randomIndex=(int)random(events.length);
    used=false;
    textSize(60);
    text(events[randomIndex], width / 2, displayHeight / 5);
    for(int j=0;j<eventIndexes.length; j++){
    if(eventIndexes[j]==randomIndex){
    used=true;
    }
    }
    
    eventIndexes = (int[])append(eventIndexes, randomIndex);
    
    boolean open = true;
    while(open == false) {
      for(int k = 0; k < dotsX.length; k++) {
        if(mousePressed && dist(mouseX, mouseY, dotsX[k], displayHeight / 2) < 10) {
          fill(23, 170, 227);
          text(events[k], dotsX[k], (displayHeight / 2) - 60);
          fill(200,200,255);
          rect(0, 0, width, displayHeight / 4);
          open = true;
        }
      }
    }
  }
  */
  }
}
void mouseClicked(){
  if(phase==0){
  if(mouseY>(displayHeight/2)-40 && mouseY<(displayHeight/2)+40){
    
  dotsX = (int[])append(dotsX, mouseX);
  events = (String[])append(events,JOptionPane.showInputDialog(null,"Event:"));
  years = (String[])append(years, JOptionPane.showInputDialog(null,"Time:"));
  }
  }
  if(phase == 1) {
    //boolean clicked = false;
    for(int y = 0; y < dotsX.length; y++) {
      if(dist(mouseX, mouseY, dotsX[y], height / 2) < 10) {
        //clicked = true;
        text(eventsCopy[randomIndex], dotsX[y], (height / 2) - 60);
         open=true;
         eventsCopy[randomIndex] = null;
         amountDone++;
         fill(200,200,255);
         noStroke();
         rect(0, 0, width, height / 3);
      }
    }
    
  }


  if(mouseX > 1200 && mouseX < 1400 && mouseY > 800 && mouseY < 870) {
    noStroke();
    fill(200,200,255);
    rect(0, 0, width, height / 3);
    rect(0, height - (height / 3), width, height / 3);
    saveFrame("data/Correct.jpg");
    
    phase = 1;
    for(int l = 0; l < events.length; l++) {
    eventsCopy = (String[])append(eventsCopy, events[l]);
  }
    background(200,200,255);
    fill(200,90,90);
  text("Click the corresponding date", width / 2, height / 1.5);
    strokeWeight(6);
   stroke(60,150,60);
    line(40,displayHeight/2,displayWidth-40,displayHeight/2);
  
  for(int i = 0; i < dotsX.length;i++){
          strokeWeight(15);
  point(dotsX[i],displayHeight/2);
  
  fill(23, 170, 227);
  strokeWeight(30);
  text(years[i], dotsX[i],(displayHeight/2)+60);
  }
  
  }
  
}