/**
 * @class Canvas
 * - this class should coordinate between player and brush
 */
class Canvas {
  boolean pressedLastFrame;
  int totalNumberOfFrames;
  Player player;
  color bgCol = color(255, 255, 255);
  PImage current;
  Brush brush;
  PGraphics[] oL = new PGraphics[10];
  PGraphics brushCanvas;
  int modalTime = 1300;
  private int modalTimeStamp;


  /**
   * @contructor
   * @param {String} path - path to the data folder were the frames will be stored.
   */
  Canvas ( String path) {
    brush = new Brush(30);
    player = new Player(path);
    totalNumberOfFrames = player.getFileCount( );
    current = createImage( width, height, ARGB );
  }

  /**
   * @method set
   * prepares the canvas to draw the next frame.
   */
  void set( ) {
    brush.reset(false);
    player.reload();

    totalNumberOfFrames = player.getFileCount( );

  }

  /**
   * @method released – handles keyReleased events
   * @param {char} _key - key just released
   */
  void released(char _key) {
    if ( _key == 's' ) {
      pressedLastFrame = false;
    }
    else if(_key == 'h' ){
      player.setOnionLayers(3);
    }
    else if ( _key == 'p' ) {
      player.previewWithOnion = false;
    }
  }
  /**
   * @method pressed – handles keyReleased events
   * @param {char} _key - key just pressed
   */
  void pressed(char _key) {
    if ( _key == 'p' ) {
      player.playing = true;
      player.previewWithOnion = true;
    }
    else if(_key == 's' ){
      save();
    }
    else if(_key == 'r' ){
      brush.reset(false);
    }
    else if(_key == 'h' ){
      player.setOnionLayers(10);
    }
    else if(_key == 'o'){
      player.seek(-2);
    }

  }
  /**
   * @method mouseMoved
   */
  void mouseMoved() {
    // if(player.playing){
    //   player.stop();
    // }
  }
  /**
   * @method mousePressed
   */
  void mousePressed() {

  }

  /**
   * @method update - draws and displays
   */
  void update( ) {
    background(bgCol);
    if(player.playing){
      player.play();
    }
    else{
      displayUI();

      brush.update( );

      player.onion();
      brushCanvas = brush.get();
      image(brushCanvas, 0, 0, width, height);
    }
  }
  /**
   * @class displayUI – 
   */
  void displayUI( ) {
    message("Animation duration: "+player.getTimeCode(), width*.015, height*0.015);
    if(modalTimeStamp + modalTime > millis() ){
      modal("Frame Saved", (millis()-modalTimeStamp*1.0)/modalTime*1.0 );
    }
  }
  /**
   * @class save – saves out a new frame
   */
  void save( ) {
    // modal("Frame Saved");
    modalTimeStamp = millis();
    totalNumberOfFrames++;
    brushCanvas.save("data/"+totalNumberOfFrames+".png");
    pressedLastFrame = true;
    set();

  }
  /**
   * @class modal – 
   */
  void modal( String message, float normal ) {
    float alpha = 1-(normal*normal);
    textAlign(CENTER, CENTER);
    fill(50, alpha*150);
    rect(0,0,width, height);
    fill(255, alpha*255);
    textSize(132);
    text(message, width/2, height/2);
  }
  /**
   * @class message – 
   */
  void message( String message, float x, float y ) {
    textAlign(LEFT, CENTER);
    fill(30, 180);
    textSize(16);
    text(message, (int)x, (int)y );
  }
}
