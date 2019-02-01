
Brush brush;
Canvas canvas;

void setup(){
  size(600,600);
  background(255,255,0);
  brush = new Brush(10);

  canvas = new Canvas( "data" );
}

void draw( ) {
  canvas.set();

  brush.update();
  brush.draw();

  canvas.update();
}

void keyReleased( ){
  canvas.released(key);
}
