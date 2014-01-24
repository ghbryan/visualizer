import ddf.minim.*;

Minim minim;
AudioInput micInput;
PShader toon;
AudioPlayer audio;

float currY = 0;
float currX = 0;

float newY = 0;
float newX = 0;

float lastChange = 0;
 
void setup() {
  minim = new Minim(this);
  audio = minim.loadFile("earthbound.mp3");
  audio.play();
  //micInput = minim.getLineIn(Minim.STEREO, 512, 44100f, 16);
  
  size(640, 360, P3D);
  noStroke();
  fill(204);
  toon = loadShader("frag.glsl", "vert.glsl");
  toon.set("fraction", 0.5);
}

void draw() {
  toon.set("colorin", random(1), random(1), random(1));
  toon.set("time", millis());
  shader(toon);
  background(0);
  //stroke(255); 
  float dirY = 0;//(mouseY / float(height) - 0.5) * 2;
  float dirX = 0;//(mouseX / float(width) - 0.5) * 2;
  
  int now = millis();
  if(now - lastChange > 5000) //onBeat
  {
    lastChange = now;
    newY = (random(2) - 1);
    newX = (random(2) - 1); 
  }
  
  currY += (newY - currY) * 0.1;
  currX += (newX - currX) * 0.1;
  
  println(currY);
  println(currX);
  
  directionalLight(204, 204, 204, currY, currX, -1);
  translate(width/2, height/2);
  sphere(120 + (audio.mix.get(0) * 50));
  
  /*for(int i = 0; i < micInput.bufferSize() - 1; i++)
  {
    line(i, 50 + micInput.left.get(i)*50, i+1, 50 + micInput.left.get(i+1)*50);
    line(i, 150 + micInput.right.get(i)*50, i+1, 150 + micInput.right.get(i+1)*50);
  }*/
}
