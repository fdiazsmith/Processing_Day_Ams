
Canvas canvas;
JSONObject settings;

/**
*
* @method settings
*/
void settings( ){

  settings = loadJSONObject("settings.json");

  JSONObject size;
  size = settings.getJSONObject("size");

  size(size.getInt("width"), size.getInt("height"));
}
/**
*
* @method setup
*/
void setup() {
  size(600, 600);
  canvas = new Canvas( "data" );
  canvas.bgCol = color(255, 255, 0);
  canvas.set();
}
/**
*
* @method draw
*/
void draw( ) {
  clear();
  canvas.update();
}
/**
*
* @method keyReleased
*/
void keyReleased( ) {
  canvas.released(key);
}

/**
*
* @method keyPressed
*/
void keyPressed( ) {
  canvas.pressed(key);
}

/**
*
* @method mouseMoved
*/
void mouseMoved( ) {
  canvas.mouseMoved();
}
/**
*
* @method mousePressed
*/
void mousePressed() {
  canvas.mousePressed();
}
