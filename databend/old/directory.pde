
void directory() {

  // Path
  String path = sketchPath;

  println("Listing filenames in : "+ path);
  filenames = listFileNames(path);
  //println(filenames);
}



// This function returns all the files in a directory as an array of Strings
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  }
  else {
    // If it's not a directory
    return null;
  }
}

