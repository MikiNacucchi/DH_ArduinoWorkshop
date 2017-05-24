/*
DIGITAL HUMANITIES 2: CODING / Introduction to Arduino workshop
by Miki Nacucchi
https://github.com/MikiNacucchi/DH_ArduinoWorkshop

24/05/2017 - 17.30 
Cà' Foscari University of Venice 
Campus Economico, Fondamenta S. Giobbe, 873, 30121 Venice

Arduino sketch:
the execution waits an incoming character on the serial port, if receive the char '1' turns on the onboard LED (turn it off otherwise)
then send the analog value of the A0 pin as response

Connect a potentiometer on A0 pin
*/


#define SOFT_POT_PIN A0 
#define MAX 255


void setup() {
  // initialize serial port @9600 BAUD
  Serial.begin(9600);
  // initialize pins
  pinMode(SOFT_POT_PIN, INPUT);
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
 // check incoming data 
 if(Serial.available() > 0) {
  if (Serial.read() == '1'){
    digitalWrite(LED_BUILTIN, HIGH); 
  }
  else{
    digitalWrite(LED_BUILTIN, LOW); 
  }

  // Read in the soft pot's ADC value
  int softPotADC = analogRead(SOFT_POT_PIN);

  // Map the 0-1023 value to 0-40
  int val = map(softPotADC, 0, 1023, 0, MAX);

  //Print analog value 0-255
  Serial.write(val);
 }

  delay(1);
}

