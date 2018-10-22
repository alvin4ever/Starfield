NormalParticle [] colony;
OddballParticle oddball;
JumboParticle jumbo;
void setup()
{
  size(400,400);  
  colony = new NormalParticle[750];
  oddball = new OddballParticle();
  jumbo = new JumboParticle();
   for (int i = 0; i < colony.length; i++)
   {
     colony[i] = new NormalParticle();
   }
}

void draw()
{
   background(0);
   for (int i=0; i<colony.length; i++){
     colony[i].move();
     colony[i].show();
   }
    oddball.move();
    oddball.show();
    jumbo.move();
    jumbo.show();
}  

class NormalParticle
{
 double myX, myY, speed, angle; 
 NormalParticle()
 {
   myX = myY = 200;
   speed = 8;
   angle = Math.random()*720;
 }
 
 void move()
 {
   myX += Math.cos(angle) * speed; 
   myY += Math.sin(angle) * speed;
   
 }
 
 void show()
 {
     fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
     ellipse((float)myX,(float)myY,15,15);
 }
}


void mousePressed()
{
  setup();
}

interface Particle 
{
  public void show();
  public void move();
  
}


class OddballParticle implements Particle
{
  int myX, myY;
  OddballParticle()
  {
    myX = myY = 100;
  }
  public void move() 
  {
     myY += (int)(Math.random()*3)+2;
     myX += (int)(Math.random()*5)-2;
  }
  
  public void show()
  {
    fill(255,0,0);
    rect(myX,myY,20,20);
  }
}

class JumboParticle extends NormalParticle
{
  public void show()
  {
     fill(0,255,0);
     ellipse((int)myX,(int)myY,50,50);
  }
}