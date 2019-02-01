
class Player {
   File[] files;


 Player ( String _path ) {
   files = listFiles( _path );

 }
 void preview(){
  // onion skin
 }

 void loop(){
   // save
 }

 int getFileCount( ){

   return files.length;
 }


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
