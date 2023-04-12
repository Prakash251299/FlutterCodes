import 'dart:convert';
import 'package:http/http.dart' as http;
// import './variableValues.dart';

Future<void> jsonExtractor(var api,var year,var month, var day)async{
// void main( day)async{
  var data;
  var month = ['January','February','March','April','May','June','July','August','September','October','November','December'];
  List<int> monthlyData = [];
  int i=0;
  for(i=0;i<12;i++){
    monthlyData.add(0);
    // monthlyData[i] = 0;
  }
  List<String> v = [];
  // v[0]=3;
    // return;
  int count=0;
  var url = Uri.parse(api);
  // var url = Uri.parse("https://data.covid19india.org/v4/min/timeseries.min.json");
  // variableValues p = variableValues();
  // Jso a=JsonEncoder(api);
  http.Response response = await http.get(url);
  if(response.statusCode==200){
    // print(response.statusCode);
    data = response.body;
    // var d = jsonDecode(data);
    // var e = d.keys;
    // List l = e.toList();
    // var len = l.length;
      v.add("WB");
      v.add("dates");
    // for(i=int.parse(month.toString());count<12;i++){
    for(i=0;i<12;i++){
      // if(i>11){
      //   i=0;
      // }
    // for(i=month.toString();i<12;i++){
      var dateValue = '2021-${i+1}-31';
      v.insert(2,dateValue);
      v.insert(3,"total");
      v.insert(4,"confirmed");
    //   // var s = "${p.getter()}";
      // v.add("$dateValue");
      try{
        // var ab = jsonDecode(data)[v[0]][v[1]];
        // ab = ab[v[2]][v[3]][v[4]];
        // print(ab);
        // monthlyData.insert(i,${jsonDecode(data)[v[0]][v[1]][v[2]][v[3]][v[4]]}.toString());
        // monthlyData[i] = jsonDecode(data)[v[0]][v[1]][v[2]][v[3]][v[4]];
        print("${month[i]}: ${jsonDecode(data)[v[0]][v[1]][v[2]][v[3]][v[4]]}");
        // print("${month[i]}: ${jsonDecode(data)['WB']['dates'][dateValue]['total']['confirmed']}");
      }catch(e){
        print("${month[i]}: NA");
      }
      count++;
    }
  }else{
    print(response.statusCode);
  }
}

void main(){
  var api="https://data.covid19india.org/v4/min/timeseries.min.json",year=2020,month=10,day=31;
  jsonExtractor(api,year,month,day);
}