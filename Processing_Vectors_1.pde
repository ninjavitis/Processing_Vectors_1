
// DECLARATIONS
  Mover ball;

// SETUP - called once
void setup()
{
  size(640,360);
  ball = new Mover(new PVector(width/2, height/2),new PVector(0.0,0.0), new PVector(0.0, 0.0), .5, 5.0, 16);
}

// DRAW - The main proccessing loop
void draw()
{
  background(255);
  
  
  ball.update();
  ball.display();
}
