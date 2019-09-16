class Mover {
  PVector location;
  PVector velocity;
  PVector V_max;
  PVector acceleration;
  float A_max;
  
  Mover(PVector init_P, PVector init_V, PVector init_A, float init_A_max){
    location = init_P;
    velocity = init_V;
    acceleration = init_A;
    A_max = init_A_max;
  };
  
  void display()
  {
    stroke(1);
    fill(175);
    ellipse(location.x,location.y,16,16);
  };
  
  void changeAccel(PVector Delta_A)
  {
    acceleration.add(Delta_A);
    acceleration.limit(A_max);
  };
  
  void updateVel()
  {
    velocity.add(acceleration);
  };
  
  void move()
  {
    location.add(velocity);
  };
  
  void update()
  {
    changeAccel(new PVector(.001, .001));
    updateVel();
    move();
  };
};
