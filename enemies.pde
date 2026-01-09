class FEnemy extends FBox {
  
  float direction = 1;
  
  FEnemy(float x, float y) {
    super(gridsize, gridsize);
    this.setPosition(x,y);
  
    //set visuals
    this.setFillColor(white);
    this.setNoStroke();
  
    //set physical properties
    this.setRestitution(0);
    this.setDensity(10);
    this.setFriction(0);
    this.setGrabbable(false);
    this.setRotatable(false);
  
    //add to world
    enemies.add(this);
    world.add(this);
  }
  
  void act() {
    this.setVelocity(100 * direction,0);
    ////println(dist(this.getX(),0, t.get(3),0));
    //println(this.getX() - t.get(3)*gridsize);
    //println(direction);
    ////println("hi");
    //for(int i = 0; i < t.size(); i++) {
    //  //if(this.getX() == t.get(i)) {
    //  //  direction *= -1;
    //  //}
    //  if(dist(this.getX(),0, t.get(i)*gridsize,0) < 0) {
    //    direction *= -1;
        
    //  }
    //}
  }
}
