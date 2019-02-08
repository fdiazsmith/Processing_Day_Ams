/**
 * @class Brush
 * - anything that leaves a mark should be handled here.
 */
class Brush {
  int size;
  int scale;
  color brushColor;
  boolean eraser = false;
  PGraphics pg;
  PShape shp;
  /**
   * @contructor
   * @param {int} _s - size of the brush
   */
  Brush (int _s) {
    brushColor = color(23);
    scale = 2;
    size = (int)_s/scale;
    pg = createGraphics(width/scale, height/scale);
    shp = createShape();
  }
  /**
   * @method update – change appreances of the brush
   */
  void update() {
    if ( mousePressed ) {
      if (mouseButton == LEFT) {
        draw();
      } else if (mouseButton == RIGHT) {
        eraser = true;
        erase();
      }
    }
  }
  /**
   * @method draw – make the trace
   */
  void draw() {
    pg.beginDraw();
    // pg.clear();
    pg.stroke(brushColor);
    pg.strokeWeight(size);
    pg.smooth();

    // if( sqrt( pow((pmouseX/scale) - (mouseX/scale),2) + pow((pmouseY/scale) - (mouseY/scale),2)) < size*4 ){
      pg.line(pmouseX/scale, pmouseY/scale, mouseX/scale, mouseY/scale);
    // }


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
  /**
   * @method erase –
   */
  void erase() {
    int r = size/2;
    color clearColor  = color(255, 0);
    int wMin = (mouseX/scale) - r;
    int wMax = (mouseX/scale) + r;
    int hMin = (mouseY/scale) - r;
    int hMax = (mouseY/scale) + r;
    pg.beginDraw();
    pg.loadPixels();
    for(int x = wMin ; x < wMax ; x++){
      for(int y = hMin ; y < hMax ; y++){
          if( sqrt( pow((mouseX/scale) - x,2)+pow((mouseY/scale) - y,2) ) < r ){
            // pg.set(x,y,clearColor);
            pg.pixels[x+y*(width/scale)] = clearColor;
          }
      }
    }
    pg.updatePixels();
    pg.endDraw();
  }
  /**
   * @method reset – delete all marks. return to blank 'canvas'
   */
  void reset() {
    // pmouseX = mouseX;
    // pmouseY =  mouseY;
    // pg = createGraphics(width, height);
    // // HACK: you can't save an empty canvas. so we draw and transparent line
    // pg.beginDraw();
    // pg.stroke(255, 0);
    // pg.line(0, 0, width, 0);
    // pg.endDraw();
    // shp = createShape();
  }
  /**
   * @method get – returns the brush graphics context
   * @returns {PGraphics} pg
   */
  PGraphics get() {
    return pg;
  }
}
