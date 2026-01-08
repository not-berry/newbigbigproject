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
    //if(this.getX() == this.pgetX()) {
      
    //}
  }
}
