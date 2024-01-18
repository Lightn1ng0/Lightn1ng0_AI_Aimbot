#include <Mouse.h>

int negMax = -127;
int posMax = 127;

void setup() {
  Serial.begin(9600);
  Mouse.begin();
}

void loop() {
  if (Serial.available() > 0) {
    // Read Data
    String data = Serial.readStringUntil('x');

    // Gets demarcation between deltaX, DeltaY, and Click
    int deltaXIndex = data.indexOf(':');
    int deltaYIndex = data.indexOf(':', deltaXIndex + 1);

    // Extract DeltaX, DeltaY, and Click
    int delta[2];
    delta[0] = data.substring(0, deltaXIndex).toInt();
    delta[1] = data.substring(deltaXIndex + 1, deltaYIndex).toInt();
    int click = data.substring(deltaYIndex + 1).toInt();
      
    handleX(delta[0]);
    handleY(-delta[1]);

    if (click == 1) {
      Mouse.click();
    }
  }
}

// Handle Moving of x 
void handleX(int dx){
  
  int spawns; 
  int remainder;
  
  if(dx < negMax)
  {
    // How many times we move mouse
    spawns = int(dx / negMax); 
    
    // How much we move after for loop
    remainder = int(dx % negMax);

    // Because we can only move 125 at a time,
    // we need a for loop to spawn multiple mouse events.
    for(int i = 0; i < spawns; i++)
    {
      Mouse.move(negMax , 0, 0);
    }
    // Move Remainder
    Mouse.move(remainder, 0, 0);
  } 
  else if (dx >= negMax && dx <= posMax)
  {
    Mouse.move(dx, 0, 0);
  }
  else if (dx > posMax)
  {
    // How many times we move mouse
    spawns = int(dx / posMax); 
    
    // How much we move after for loop
    remainder = int(dx % posMax);
    
    for(int i = 0; i < spawns; i++)
    {
      Mouse.move(posMax , 0, 0);
    }
    // Move Remainder
    Mouse.move(remainder, 0, 0);
  }
  
}

// Handle Moving of x 
void handleY(int dy){
  
  int spawns; 
  int remainder;
  // MindTrip, Neg is pos & Pos is Neg for move, hence the inverted pos & Neg
  if(dy < negMax)
  {
    // How many times we move mouse
    spawns = int(dy / negMax); 
    
    // How much we move after for loop. -1 converts to correct direction on arduino (pos,neg,neg,pos)
    remainder = int(dy % negMax);
    remainder *= -1;
    // Because we can only move 125 at a time,
    // we need a for loop to spawn multiple mouse events.
    for(int i = 0; i < spawns; i++)
    {
      Mouse.move(0, posMax, 0);
    }
    // Move Remainder
    Mouse.move(0, remainder, 0);
  } 
  else if (dy >= negMax && dy <= posMax)
  {
    dy *= -1;
    Mouse.move(0, dy, 0);
  }
  else if (dy > posMax)
  {
    // How many times we move mouse
    spawns = int(dy / posMax); 
    
    // How much we move after for loop
    remainder = int(dy % posMax);
    remainder *= -1;
    
    for(int i = 0; i < spawns; i++)
    {
      Mouse.move(0, negMax, 0);
    }
    // Move Remainder
    Mouse.move(0, remainder, 0);
  }
}
