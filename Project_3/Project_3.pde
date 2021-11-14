PImage img;
ArrayList<Triangles> triangles;
int w,h;
void setup()
{

  fullScreen();
  img=loadImage("ES.JPG");
  h=img.height;
  w=img.width;
  surface.setSize(w,h);
  img.loadPixels();
  triangles=new ArrayList<Triangles>();
  for(int x=0;x<w;x+=10)
  {
    for(int y=0;y<h;y+=10)
    {
      int loc=x+y*(w);
      triangles.add(new Triangles(x,y,img.pixels[loc]));
    }
  }
  
}
void draw()
{
  background(125);
  if(mousePressed == true)
  {
    for(Triangles triangle:triangles)
    {
      triangle.run();
    }
  }
  else
  {
    for(Triangles triangle:triangles)
    {
       triangle.stay();
    }
  }
}
