/**
 * @class Player
 *  - anything that has to do with frames should be handled here
 */
class Player {
  File[] files;
  String path;
  PImage[] onionLayers = new PImage[10];
  boolean playing = false;
  int frame = 0;
  int framesPerSecond;
  int lastFrameTimeStamp;
  int onionLayerCount = 3;
  boolean onionLayersAvailable = false;

  private int oLCount = 3;
  private float fpsInterval = 0;
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
   * @method preview
   */
  void preview() {
    // I think this is where onion should be called from.
  }
  /**
   * @method loop
   */
  void loop() {
    // save
  }
  /**
   * @method play
   */
  void play() {
    showFrame( frame );
    if(lastFrameTimeStamp + fpsInterval < millis()){
      frame++;
      lastFrameTimeStamp = millis();
    }
  }
  /**
   * @method showFrame
   */
  void showFrame(int frame) {
    int totalFrames = getFileCount();
    tint(255, 255);
    if(frame < totalFrames){
      PImage currentFrame = loadImage("data/"+frame+".png");
      image(currentFrame, 0, 0);
    }
    else{
      stop();
    }
  }
  /**
   * @method stop
   * prepares the canvas to draw the next frame.
   */
  void stop(){
    playing = false;
    frame = 0;
  }
  /**
   * @method set
   * prepares the canvas to draw the next frame.
   */
  void set( ) {
    int fileCount = getFileCount()>10? 10 : getFileCount() ;
    if(fileCount>=0){
      onionLayersAvailable = true;
      oLCount = fileCount>3? oLCount: fileCount;
      println("Get number of file !! ", fileCount);
      for (int i = 0; i <= fileCount-1; i++) {
        println(i+"  data/"+(getFileCount()-i)+".png");
        onionLayers[i] = loadImage("data/"+(getFileCount()-i)+".png");
      }
    }
  }

  /**
   * @method onion – display onion skin layer for reference
   */
  void onion( ) {
    if(onionLayersAvailable){
      for (int i = 0; i < oLCount; i++) {
        float alpha = 1 - (i*1.0/oLCount*1.0);
        tint(255, alpha * 150);
        image(onionLayers[i], 0, 0);
      }
      tint(255, 255);
    }
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
  void reload() {
    files = listFiles( path );
    set();
  }
  /**
   * @method setFPS –
   */
  float setFPS(int frames) {
    files = listFiles( path );
    framesPerSecond = frames;
    fpsInterval = 1000/framesPerSecond;
    return fpsInterval;
  }
  /**
   * @method listFiles – get
   * @returns {File[]} - array of filepath.
   */
  File[] listFiles(String dir) {
    File file = new File(sketchPath() + "/"+dir);
    if (file.isDirectory()) {
      File[] files = file.listFiles();
      return files;
    } else {
      // If it's not a directory
      return null;
    }
  }
}
