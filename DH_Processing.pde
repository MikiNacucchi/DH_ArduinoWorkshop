/*
DIGITAL HUMANITIES 2: CODING / Introduction to Arduino workshop
by Miki Nacucchi
https://github.com/MikiNacucchi/DH_ArduinoWorkshop

24/05/2017 - 17.30 
Cà' Foscari University of Venice 
Campus Economico, Fondamenta S. Giobbe, 873, 30121 Venice

Processing sketch:
Send '1' or '0' to serial if mouse is over the square (change the background color as visual feedback)
Read data from the serial port and assign it to a variable. Set the fill a rectangle on the screen using the value read from a sensor connected to the Arduino board.
*/
 
import processing.serial.*; 
 
Serial port;  // Create object from Serial class
int val = 0;  // Data received from the serial port 
 
void setup() { 
  size(200, 200); 
  noStroke(); 
  frameRate(5);  // Run 5 frames per second
  
  // Open the port that the board is connected to and use the same speed (9600 bps) 
  port = new Serial(this, Serial.list()[0], 9600); 
} 

void draw() { 
  
  // If mouse is over square
  if (mouseOverRect() == true)  {  
    // change color to GREEN and
    background(0,255,0);       
    // send an ‘1’ to Arduino
    port.write('1');            
  } 
  // If mouse is not over square,
  else {                           
    // change color to BLUE and
    background(0,0,255);             
    // send an ‘0’ to Arduino
    port.write('0');               
  } 
  
  // If data is available to read
  if (port.available() > 0) {  
    val = port.read();
    print(val);
  }   
  // Set fill color with the value read
  fill(val);                     
  // Draw square
  rect(50, 50, 100, 100);           
} 


// Test if mouse is over square
boolean mouseOverRect() {         
  return ((mouseX >= 50) && (mouseX <= 150) && (mouseY >= 50) && (mouseY <= 150)); 
} 