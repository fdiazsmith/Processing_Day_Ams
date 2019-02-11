
Canvas canvas;
JSONObject settings;

/**
* - useful to always have in a Pricessing day/ 
* @method settings
*/
void settings( ){

  settings = loadJSONObject("settings.json");

  JSONObject size;
  size = settings.getJSONObject("size");

  size(size.getInt("width"), size.getInt("height"));
  // here we could add a check to see if the widht and height ar defined
  // go go full screen if they are not.
  fullScreen( );
}
/**
*
* @method setup
*/
void setup() {
  size(600, 600);
  canvas = new Canvas( "data" );
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
