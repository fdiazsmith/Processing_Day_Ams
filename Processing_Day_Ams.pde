
Brush brush;

void setup(){
  size(600,600);
  background(255,255,0);
  brush = new Brush(10);
}

void draw( ) {
  brush.update();
  brush.draw();
}
