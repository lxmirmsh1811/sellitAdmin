class TrimName{
 var name;
  TrimName({this.name});
  
  static String checkNameLength(String name){
    if (name.length <= 18 ){
      return name.toUpperCase();
    }
    else {
      name = trimProductName(name);
    }
  }

  static String trimProductName(String title) {
    var result = title.substring(0,18).toUpperCase() + '...';
    return result;
  }        
}