class variableValues{
  // void main(){

  // }
  var dateVal;
  var pathOfTheValueInJson;
  String getter(){
    setter();
    return pathOfTheValueInJson;
  }
  void setter(){
    pathOfTheValueInJson = "['WB']['dates']['$dateVal']['total']['confirmed']";
  }
  void dateValSetter(String text){
    dateVal = text;
  }
}