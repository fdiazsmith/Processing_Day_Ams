/**
 * @class Brush
 * - anything that leaves a mark should be handled here.
 */
class Brush {
  int size;
  int scale;
  color brushColor;
  PGraphics pg;
  PShape shp;

  private int radius;
  private int mX,
              mY,
              pX,
              pY;
  private boolean eraser = false;
  private color clearColor  = color(255, 0);

  /**
   * @contructor
   * @param {int} _s - size of the brush
   */
  Brush (int _s) {
    brushColor = color(23);
    scale = 1;
    size = (int)_s/scale;
    radius = size/2;
    pg = createGraphics(width/scale, height/scale);
    shp = createShape();
  }

  /**
   * @method update – change appreances of the brush
   */
  void update() {
    getMouse();
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
    pg.stroke(brushColor);
    pg.strokeWeight(size);
    pg.smooth();
    pg.line(pX, pY, mX, mY);
    /*
    if we wanted to createshapes that could be revisited or redrawn
    here we would use a PShape to create vertor art instead of pixel based images
    */
    pg.endDraw();
  }

  /**
   * @method erase –
   */
  void erase() {
    int wMin = mX - radius;
    int wMax = mX + radius;
    int hMin = mY - radius;
    int hMax = mY + radius;
    pg.beginDraw();
    pg.loadPixels();
    for(int x = wMin ; x < wMax ; x++){
      for(int y = hMin ; y < hMax ; y++){
          if( sqrt( pow((mouseX/scale) - x,2)+pow((mouseY/scale) - y,2) ) < radius ){
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
   * @params {boolean} hardReset
   */
  void reset( boolean hardReset) {
    pX = mouseX;
    pY =  mouseY;
    if(hardReset){
      pg = createGraphics(width, height);
      // HACK: you can't save an empty canvas. so we draw and transparent line
      pg.beginDraw();
      pg.stroke(255, 0);
      pg.line(0, 0, width, 0);
      pg.endDraw();
      shp = createShape();
    }
  }

  /**
   * @method get – returns the brush graphics context
   * @returns {PGraphics} pg
   */
  PGraphics get() {
    return pg;
  }

  /**
   * @method get – returns the brush graphics context
   * @returns {PGraphics} pg
   */
  void getMouse() {
    mX = mouseX/scale;
    mY = mouseY/scale;
    pX = pmouseX/scale;
    pY = pmouseY/scale;
  }
}
