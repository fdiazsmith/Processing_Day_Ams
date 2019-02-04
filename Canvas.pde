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
  PImage[] onionLayers = new PImage[10];
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

    for (int i = 0; i < 10; i++) {
      onionLayers[i] = loadImage("data/"+(totalNumberOfFrames-i)+".png");
    }
  }

  /**
   * @method onion – display onion skin layer for reference
   * @param {int} _count - number of layer to to show
   */
  void onion(int _count) {
    for (int i = _count; i >= 0; i--) {
      float alpha = i*1.0/_count*1.0;
      tint(255, alpha * 150);
      image(onionLayers[i], 0, 0);
    }
    tint(255, 255);
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
   * @method update - draws and displays
   */
  void update( ) {
    background(bgCol);
    // brush.update( );
    brush.draw( );

    onion(3);
    brushCanvas = brush.get();
    image(brushCanvas, 0, 0);

    // save
    // IDEA maybe to be consistent we should put this in it own handler, just like the key keyReleased
    if ( keyPressed && !pressedLastFrame ) {
      if ( key == 's' ) {
        save( );
      }
    }
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
