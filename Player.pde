/**
 * @class Player
 *  - anything that has to do with frames should be handled here
 * [custom event listeners](https://forum.processing.org/one/topic/custom-events-event-listener.html)
 */
class Player {
  File[] files;
  String path;
  PImage[] onionLayers = new PImage[10];
  boolean playing = false;
  int frame = 1;
  int framesPerSecond;
  int lastFrameTimeStamp;
  int onionLayerCount = 3;
  boolean onionLayersAvailable = false;
  boolean previewWithOnion = false;
  // This is none of your business, it is private parts!
  private int oLCount = 3;
  private float fpsInterval = 0;
  private static final boolean DEBUG = false;

  /**
   * @contructor
   * @param {String} path - path to the data folder were the frames will be stored.
   */
  Player ( String _path ) {
    path = _path;
    files = listFiles( _path );
    setFPS(12);
  }

  /**
   * @method play
   */
  void play( ) {
    showFrame( frame );
    if(lastFrameTimeStamp + fpsInterval < millis()){
      frame++;
      lastFrameTimeStamp = millis();
    }
  }
  /**
   * @method seek
   * @params seconds -
   * if negative it starts at the end and substracts seconds
   * if positive is simply starts at 0
   */
  void seek( int seconds ) {
    if( seconds < 0 ){
      frame = getFileCount() + (seconds * framesPerSecond);
    }
    else{
      frame = seconds*framesPerSecond;
    }
    playing = true;
  }

  /**
   * @method showFrame
   * the reason this in almos a repeated version of onion is because we want to optimize
   * and only load images every times we save and not every frame
   */
  void showFrame( int frame ) {
    int totalFrames = getFileCount( );
    tint(255, 255);
    if( frame < totalFrames ){
      if(previewWithOnion) showGosted();
      PImage currentFrame = loadImage("data/"+frame+".png");
      image(currentFrame, 0, 0, width, height);
    }
    else{
      stop( );
    }
  }

  /**
   * @method showGosted
   *
   */
  void showGosted( ) {
    for (int i = 0; i < oLCount; i++) {
      float alpha = 1 - (i*1.0/oLCount*1.0);
      tint(255, alpha * 150);
      int f = frame-i >=1?frame-i:1;
      PImage currentFrame = loadImage("data/"+f+".png");
      image(currentFrame, 0, 0, width, height);
    }
    tint(255, 255);
  }

  /**
   * @method stop
   * prepares the canvas to draw the next frame.
   */
  void stop( ) {
    playing = false;
    frame = 1;
  }

  /**
   * @method set
   * prepares the canvas to draw the next frame.
   */
  void set( ) {
    int fileCount = getFileCount()>10? 10 : getFileCount() ;
    if( fileCount >= 0 ){
      onionLayersAvailable = true;
      oLCount = fileCount>3? oLCount: fileCount;
      if( DEBUG ) println("Get number of file !! ", fileCount);

      for (int i = 0; i <= fileCount-1; i++) {
        if( DEBUG ) println(i+"  data/"+(getFileCount()-i)+".png");
        onionLayers[i] = loadImage("data/"+(getFileCount()-i)+".png");
      }

    }
  }

  /**
   * @method onion – display onion skin layer for reference
   */
  void onion( ) {
    if( onionLayersAvailable ){
      for (int i = 0; i < oLCount; i++) {
        float alpha = 1 - (i*1.0/oLCount*1.0);
        tint(255, alpha * 150);
        image(onionLayers[i], 0, 0, width, height);
      }
      tint(255, 255);
    }
  }
  /**
   * @method setOnionLayers
   * @param {int} count
   */
  void setOnionLayers( int count ) {
    oLCount = count;
  }

  /**
   * @method getFileCount – return number of files in the specified data folder
   * @return {int} filecount
   */
  int getFileCount( ) {
    return files.length-1;
  }

  /**
   * @method reload – updates file list array
   */
  void reload( ) {
    files = listFiles( path );
    set( );
  }

  /**
   * @method setFPS –
   */
  float setFPS( int frames ) {
    files = listFiles( path );
    framesPerSecond = frames;
    fpsInterval = 1000/framesPerSecond;
    return fpsInterval;
  }

  /**
   * @method listFiles – get
   * @returns {File[]} - array of filepath.
   */
  File[] listFiles( String dir ) {
    File file = new File( sketchPath() + "/"+dir );
    if ( file.isDirectory() ) {
      File[] files = file.listFiles( );
      return files;
    } else {
      // If it's not a directory
      return null;
    }
  }
}
