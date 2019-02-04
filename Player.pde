/**
 * @class Player
 *
 */
class Player {
  File[] files;
  String path;

  /**
   * @contructor
   * @param {String} path - path to the data folder were the frames will be stored.
   */
  Player ( String _path ) {
    path = _path;
    files = listFiles( _path );
  }
  /**
   * @method preview 
   */
  void preview() {
    // onion skin
  }
  /**
   * @method loop
   */
  void loop() {
    // save
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
