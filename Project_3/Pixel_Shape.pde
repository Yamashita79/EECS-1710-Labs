class Triangles
{
  PVector position,target;
  color col;
  float speed;
  float x1,y1;
  
  Triangles(float x1,float y1,color _col)
  {
    position=new PVector(x1,y1);
    target=new PVector(random(width),random(height));
    col=_col;
    
    float b=brightness(col)/255;
    speed=b/100;
    x1=0;
    y1=0;
  }
  void update()
  {
    position.lerp(target,speed);
  }
  void draw()
  {
    fill(col);
    triangle(position.x,position.y,position.x+13,position.y,position.x+5,position.y+10);
  }
  void run()
  {
    update();
    draw();
  }
  void stay()
  {
    draw();
  }
}
