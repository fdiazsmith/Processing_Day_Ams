/**
 * @class Canvas
 * - this class should coordinate between player and brush
 */
class Canvas {
  boolean pressedLastFrame;
  int totalNumberOfFrames;
  Player player;
  color bgCol = color(225, 255, 20);
  int onionLayer;
  PImage current;
  Brush brush;

  PGraphics[] oL = new PGraphics[10];
  PGraphics brushCanvas;

  /**
   * @contructor
   * @param {String} path - path to the data folder were the frames will be stored.
   */
  Canvas ( String path) {
    brush = new Brush(10);
    player = new Player(path);
    totalNumberOfFrames = player.getFileCount( );
    onionLayer = 3;
    current = createImage( width, height, ARGB );
  }

  /**
   * @method set
   * prepares the canvas to draw the next frame.
   */
  void set( ) {
    brush.reset();
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
  }
  /**
   * @method pressed – handles keyReleased events
   * @param {char} _key - key just pressed
   */
  void pressed(char _key) {
    if ( _key == 'p' ) {
      player.playing = true;
    }
    else if(_key == 's' ){
      save();
    }
  }
  /**
   * @method mouseMoved
   */
  void mouseMoved() {
    if(player.playing){
      player.stop();
    }
  }

  /**
   * @method update - draws and displays
   */
  void update( ) {
    background(bgCol);
    if(player.playing){
      player.play(player.frame);
      if(frameCount%5 == 0){
        player.frame++;
      }
    }
    else{

      // brush.update( );
      brush.draw( );

      player.onion(3);
      brushCanvas = brush.get();
      image(brushCanvas, 0, 0);
    }


    // // save
    // // IDEA maybe to be consistent we should put this in it own handler, just like the key keyReleased
    // if ( keyPressed && !pressedLastFrame ) {
    //   if ( key == 's' ) {
    //     save( );
    //   }
    // }
  }
  /**
   * @class save – saves out a new frame
   */
  void save( ) {
    totalNumberOfFrames++;
    brushCanvas.save("data/"+totalNumberOfFrames+".png");
    pressedLastFrame = true;
    set();
  }
}
