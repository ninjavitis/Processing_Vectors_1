class Mover {
  PVector location;
  PVector velocity;
  float V_max;
  PVector acceleration;
  float A_max;
  float radius;
  float mass;
  
  // Class Constructor
  Mover(PVector init_P, PVector init_V, PVector init_A, float init_A_max, float init_V_max, float size, float init_mass){
    location = init_P;
    velocity = init_V;
    acceleration = init_A;
    A_max = init_A_max;
    V_max = init_V_max;
    
    radius = size;
    mass = init_mass;
  };
  
  void display()
  {
    stroke(1);
    fill(175);
    ellipseMode(CENTER);
    ellipse(location.x,location.y, radius,radius);
  };
  
  // handles behavior at the edges of the draw area
  void checkEdges()
  {
    // check the left + right edges
    if (location.x > width)
    {
      location.x = 0;
    }
    else if (location.x < 0)
    {
      location.x = width;
    }
    
    // check the top and bottom edges
    if( location.y > height)
    {
      location.y = 0;
    }
    else if(location.y < 0)
    {
      location.y = height;
    }
  };
  
  void changeAccel(PVector Delta_A)
  {
    acceleration.add(Delta_A);
    acceleration.limit(A_max);
  };
  
  void updateVel()
  {
    velocity.add(acceleration);
    velocity.limit(V_max);
    acceleration.mult(0);
  };
  
  void applyForce(PVector force)
  {
    acceleration.add(PVector.div(force, mass));
  };
  
  void move()
  {
    location.add(velocity);
  };
  
  void update()
  {
    PVector mouseCoords = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(mouseCoords, location);
    direction.normalize();
    direction.mult(.5);

    
    changeAccel(direction);
    updateVel();
    move();
    checkEdges();
  };
};
