//
class Brush {
  int size;
  color brushColor;
  PGraphics pg;
  PShape shp;

 Brush (int _s) {
   size = _s;
   brushColor = color(23);
   pg = createGraphics(width, height);
   shp = createShape();
 }
 Brush (int _s, int _c) {
   size = _s;
   brushColor = _c;
   pg = createGraphics(width, height);
 }

 void update(){
   pg.beginDraw();
   pg.stroke(brushColor);
   pg.strokeWeight(size);
   pg.smooth();
   pg.endDraw();
 }

 void draw() {
  if( mousePressed ){
    pg.beginDraw();
    // pg.clear();
    pg.stroke(brushColor);
    pg.strokeWeight(size);
    pg.smooth();
    pg.line(pmouseX, pmouseY, mouseX, mouseY);


    // shp.beginShape();
    // shp.fill(0, 100, 255);
    // shp.stroke(100);
    //
    // shp.vertex(0, 0);
    // shp.vertex(0, 50);
    // shp.vertex(50, 50);
    // shp.vertex(50, 0);
    // shp.endShape(CLOSE);
    // pg.shape(shp);
    pg.endDraw();
  }
 }

 void reset(){
   pg = createGraphics(width, height);
   shp = createShape();
 }

 PGraphics get(){
   return pg;
 }


}
