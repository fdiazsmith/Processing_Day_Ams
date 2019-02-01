
Canvas canvas;

void setup(){
  size(600,600);
  canvas = new Canvas( "data" );
  canvas.bgCol = color(255,255,0);
  canvas.set();
}

void draw( ) {
  clear();
  canvas.update();
}

void keyReleased( ){
  canvas.released(key);
}
