
class Brush {
  int size;
  color brushColor;


 Brush (int _s) {
   size = _s;
   brushColor = color(0);
 }
 Brush (int _s, int _c) {
   size = _s;
   brushColor = _c;
 }

 void update(){
   stroke(brushColor);
   strokeWeight(size);
   smooth();
 }
 void draw() {
  if( mousePressed ){
    line(pmouseX, pmouseY, mouseX, mouseY );
  }
 }

}
