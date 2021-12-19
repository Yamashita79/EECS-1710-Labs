import processing.sound.*;
PImage img;
PShader shader_thresh; 
int x,y;
color c;
SoundFile soundfile;

void setup() {
  size(800, 600, P2D);
  
  img = loadImage("Violin_Pizz.png");
  
  shader_thresh = loadShader("shaders/thresh.glsl");
  shader_thresh.set("resolution", float(width), float(height), 1.0);
  soundfile=new SoundFile(this,"violin3.mp3");
  println("SFSampleRate="+soundfile.sampleRate()+"Hz");
  println("SFSamples="+soundfile.frames()+"samples");
  println("SFDuration="+soundfile.duration()+"seconds");
  soundfile.loop();
}

void draw() {
  background(0);
  
  shader_thresh.set("threshold", 255 * ((float) mouseX / (float) width)); 
  shader_thresh.set("tex0", img);
  filter(shader_thresh);
  surface.setTitle("" + frameRate);
}
void mouseDragged()
{
  float playbackSpeed=map(mouseX,0,width,0.25,6.0);
  soundfile.rate(playbackSpeed);
  float amplitude=map(mouseY,0,width,0.2,1.0);
  soundfile.amp(amplitude);
  stroke(255,0,0);
  strokeWeight(5);
  line(mouseX,mouseY,mouseX+random(-0.5*mouseY,0.5*mouseY),mouseY+random(-0.5*mouseX,0.5*mouseX));
  line(mouseX,mouseY,mouseX+random(-0.5*mouseY,0.5*mouseY),mouseY+random(-0.5*mouseX,0.5*mouseX));
  line(mouseX,mouseY,mouseX+random(-0.5*mouseY,0.5*mouseY),mouseY+random(-0.5*mouseX,0.5*mouseX));
}
