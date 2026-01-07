void createEnemy(float x, float y) {
  e = new FBox(gridsize,gridsize);
  e.setPosition(x,y);
  
  //set visuals
  e.setFillColor(white);
  e.setNoStroke();
  
  //set physical properties
  e.setRestitution(0);
  e.setDensity(10);
  e.setFriction(0);
  e.setGrabbable(false);
  e.setRotatable(false);
  
  //add to world
  world.add(e);
}
