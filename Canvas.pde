
class Canvas {
  boolean pressedLastFrame;
  int frameCount;
  Player player;

 Canvas ( String path) {
   player = new Player(path);
   frameCount = player.getFileCount( );

 }

 void set( ){
  // onion skin
 }
 void released(char key){

   if( key == 's' ){
    pressedLastFrame = false;
   }
 }

 void update(){
   // save
   if( keyPressed && !pressedLastFrame ){
     if( key == 's' ){
      frameCount++;
      saveFrame("data/"+frameCount+".png");
      pressedLastFrame = true;


     }
   }

 }

}
