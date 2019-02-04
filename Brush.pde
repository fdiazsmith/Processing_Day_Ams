/**
 * @class Brush
 */
class Brush {
  int size;
  color brushColor;
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
  /**
   * @method reset – delete all marks. return to blank 'canvas'
   */
  void reset() {
    pg = createGraphics(width, height);
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
