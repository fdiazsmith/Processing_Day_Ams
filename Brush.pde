/**
 * @class Brush
 * - anything that leaves a mark should be handled here.
 */
class Brush {
  int size;
  color brushColor;
  boolean eraser = false;
  PGraphics pg;
  PShape shp;
  /**
   * @contructor
   * @param {int} _s - size of the brush
   */
  Brush (int _s) {
    size = _s;
    brushColor = color(23);
    pg = createGraphics(width, height);
    shp = createShape();
  }
  /**
   * @contructor
   * @param {int} _s - size of the brush
   * @param {color} _c - color of the brush
   */
  Brush (int _s, int _c) {
    size = _s;
    brushColor = _c;
    pg = createGraphics(width, height);
  }
  /**
   * @method update – change appreances of the brush
   */
  void update() {
    pg.beginDraw();
    pg.stroke(brushColor);
    pg.strokeWeight(size);
    pg.smooth();
    pg.endDraw();
  }
  /**
   * @method draw – make the trace
   */
  void draw() {
    if ( mousePressed ) {
      if (mouseButton == LEFT) {
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
      } else if (mouseButton == RIGHT) {
        eraser = true;
        erase();
      } else {

      }

    }
  }
  /**
   * @method erase –
   */
  void erase() {
    int size = 10;
    color clearColor  = color(255);
    int wMin = mouseX - size;
    int wMax = mouseX + size;
    int hMin = mouseY - size;
    int hMax = mouseY + size;
    
    pg.loadPixels();
    for(int x = wMin ; x < wMax ; x++){
      for(int y = 0 ; y < hMax ; y++){
          pg.set(x,y,clearColor);
      }
    }

    pg.updatePixels();


  }
  /**
   * @method reset – delete all marks. return to blank 'canvas'
   */
  void reset() {
    pg = createGraphics(width, height);
    // HACK: you can't save an empty canvas. so we draw and transparent line
    pg.beginDraw();
    pg.stroke(255, 0);
    pg.line(0, 0, width, 0);
    pg.endDraw();
    shp = createShape();
  }
  /**
   * @method get – returns the brush graphics context
   * @returns {PGraphics} pg
   */
  PGraphics get() {
    return pg;
  }
}
