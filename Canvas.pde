
class Canvas {
  boolean pressedLastFrame;
  int totalNumberOfFrames;
  Player player;
  color bgCol = color(225,255,20);
  int onionLayer;
  PImage current;
  Brush brush;
  PImage[] onionLayers = new PImage[10];
  PGraphics[] oL = new PGraphics[10];
  PGraphics brushCanvas;

 Canvas ( String path) {
   brush = new Brush(10);
   player = new Player(path);
   totalNumberOfFrames = player.getFileCount( );
   onionLayer = 3;
   current = createImage( width, height, ARGB );

 }

 void set( ){

  brush.reset();
  player.reload();

  totalNumberOfFrames = player.getFileCount( );

  for(int i = 0; i < 10; i++){
    onionLayers[i] = loadImage("data/"+(totalNumberOfFrames-i)+".png");
  }
 }

  void onion(int _count){
    for(int i = _count; i >= 0; i--){
      image(onionLayers[i],0,0);
    }

  }

  void released(char _key){
    if( _key == 's' ){
      pressedLastFrame = false;
    }
  }

  void update( ){
    background(bgCol);
    // brush.update( );
    brush.draw( );

    onion(3);
    brushCanvas = brush.get();
    image(brushCanvas, 0, 0);

    // save
    if( keyPressed && !pressedLastFrame ){
      if( key == 's' ){
        save( );
      }
    }
  }

  void save( ){
    totalNumberOfFrames++;
    brushCanvas.save("data/"+totalNumberOfFrames+".png");
    pressedLastFrame = true;
    set();
  }
}
