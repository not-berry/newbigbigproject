import fisica.*;

//colours but color
color black = #000000;
color dark = color(24,98,52);
color white = color(255,255,255);
color noStroke = #644949;
color noFill = #5F4444;
color red = #F55454;
color blue = #3896C6;
color spawn = #22B14C;
color enemyz = color(237, 28, 36);

//images
PImage grass;
PImage dirt;

//vars
PImage map;
int x = 0;
int y = 0;
int gridsize = 64;

//key variables
boolean upkey, leftkey, rightkey, spacebar;

//spawn
int spawnX = 0;
int spawnY = 0;

//position list
FloatList posX = new FloatList(), posY = new FloatList();

//fisica
FWorld world;
FBox p;
FBox e;
FBomb bomb = null;
FEnemy enemy;

ArrayList<FBox> boxes;

ArrayList<FBox> enemies;

void setup() {
  size(1400,1000);
  
  Fisica.init(this);
  world = new FWorld();
  makeWorld();
  
  FCompound ground = new FCompound();
  
  createPlayer();
  
  boxes = new ArrayList();
  
  enemies = new ArrayList();
  
  grass = loadImage("blockt.png");
  dirt = loadImage("blockt.png");
  
  map = loadImage("bigmap.png");
  while(y < map.height) {
    color c = map.get(x,y);
    
    if(c == black) {
      FBox b = new FBox(gridsize, gridsize);
      b.setFillColor(black);
      b.setPosition(x*gridsize,y*gridsize);
      b.setStatic(true);
      b.setGrabbable(false);
      if(map.get(x,y-1) != black && y > 13) b.attachImage(grass);
      else b.attachImage(dirt);
      boxes.add(b);
      //world.add(b);
      ground.addBody(b);
    } else if(c == dark) {
      posX.append(x*gridsize);
      posY.append(y*gridsize);
    } else if(c == spawn) {
      spawnX = x*gridsize;
      spawnY = y*gridsize;
      p.setPosition(spawnX,spawnY);
    } else if(c == enemyz) {
      //createEnemy(x*gridsize, y*gridsize);
      enemy = new FEnemy(gridsize*x, gridsize*y);
    }
    
    x++;
    
    if(x == map.width) {
      x = 0;
      y++;
    }
  }
  ground.setStatic(true);
  ground.setGrabbable(false);
  world.add(ground);
}

void draw() {
  background(#060524);
  
  movePlayer();
  
  for(int i = 0; i < enemies.size();i++) {
    FBox e = enemies.get(i);
    float vy = e.getVelocityY();
    e.setVelocity(60,vy);
  }
  
  pushMatrix();
  translate(-p.getX()+width/2, -p.getY()+height/2);
  rectMode(CENTER);
  for(int i = 0; i < posX.size(); i++) {
    fill(black);
    square(posX.get(i),posY.get(i), gridsize);
    //image(dirt, posX.get(i)-gridsize/2,posY.get(i)-gridsize/2);
  }
  world.step();
  world.draw();
  popMatrix();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld(-100,-100, 10000,10000);
  world.setGravity(0, 900);
}
