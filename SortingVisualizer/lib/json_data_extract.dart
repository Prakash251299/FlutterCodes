import 'dart:convert';
import 'package:http/http.dart' as http;
// import './variableValues.dart';

class Item{

}
Future<void> jsonExtractor(var api,var year,var monthVal, var day, List<String> v)async{
// void main( day)async{
  var data;
  var month = ['January','February','March','April','May','June','July','August','September','October','November','December'];
  List<int> monthlyData = [];
  int i=0;
  for(i=0;i<12;i++){
    monthlyData.add(0);
    // monthlyData[i] = 0;
  }
  int indexDate = 0;
  for(i=0;i<v.length;i++){
    if(v[i]=='dateValue'){
      indexDate = i;
      break;
    }
  }
  int count=0;
  var url = Uri.parse(api);
  // var url = Uri.parse("https://data.covid19india.org/v4/min/timeseries.min.json");
  // variableValues p = variableValues();
  // Jso a=JsonEncoder(api);
  http.Response response = await http.get(url);

  // Map m = {'dates':{'2021-10-31':{'total':{'confirmed'}}}};
  data = response.body;
  // List<dynamic> k = jsonDecode(url.toString());
  // List<v>it = List<String>.from(k.map<String>((String)=>String.fromJson()));
  // List<Item> m;
  // List<String> s = {"['WB']['dates']['2021-10-31']['total']['confirmed']"}.toList();
  print(json.decode(data)['WB']['dates']['2021-10-31'].toString());
  return;
  // Map<List<String>> s = {['WB']['dates']['2021-10-31']['total']['confirmed']};
  try{
    // print("${month[i]}: ${jsonDecode(data)['WB']['dates']['2021-10-31']['total']['confirmed']}");
    // print("${month[i]}: ${jsonDecode(data)+s}");
    // print("${month[i]}: ${jsonDecode(data)}");
    // print("${month[i]}: $s");
  }catch(e){}
  return;















  if(response.statusCode==200){
    // print(response.statusCode);
    data = response.body;
    // var d = jsonDecode(data);
    // var e = d.keys;
    // List l = e.toList();
    // var len = l.length;
      // v.add("WB");
      // v.add("dates");
      if(monthVal==12){
        // monthVal = 0;
      }else{
        year--;
      }
      // try {
      //   print("${month[i]}: ${jsonDecode(data)['WB']['dates']['2021-10-31']['total']['confirmed']}");
      // }catch(e){
      //   print("No data found");
      // }
      // return;
    String monStr=''; 
    var sum = 0;
    for(i=monthVal;count<12;i++){
      sum = 0;
      // print(int.parse(month.toString()));
      // print((monthVal));
      // return;
    // for(i=0;i<12;i++){
      if(i>11){
        i=0;year++;
      }

    // for(i=month.toString();i<12;i++){
      if(i+1<10){
        monStr = "0${i+1}";
      }else{
        monStr = "${i+1}";
      }
      var dateValue;
      var dayStr;
      // var sum=0;
      // var d;
      // if(d<10){
      //     dayStr = '0$d';
      //   }
      //   else{
      //     dayStr = '$d';
      //   }
      // dateValue = '$year-$monStr-$dayStr';
      // var dateValue = '$year-$monStr-01';
      // var dateValue = '2021-${i+1}-31';
    //   // var s = "${p.getter()}";
      // v.add("$dateValue");
      for(var d = 1;d<=31;d++){
        if(int.parse(monStr)==monthVal && i==day+1){
          break;
        }
        if(d<10){
          dayStr = '0$d';
        }else{
          dayStr = '$d';
        }
        dateValue = '$year-$monStr-$dayStr';
        v.removeAt(2);
        v.insert(indexDate,dateValue);
        // print(v[2]);
      //   v.insert(2,dateValue);
      //   v.insert(3,"total");
      //   v.insert(4,"confirmed");
      //   // v.insert(2,dateValue);
      //   //
      // }
      try{
        // print("${month[i]}: ${jsonDecode(data)['WB']['dates'][v[2]]['total']['confirmed']}");
        print("${month[i]}: ${jsonDecode(data)[v[0]][v[1]][v[2]][v[3]][v[4]]}");
        // print("${dateValue}: ${jsonDecode(data)['WB']['dates'][dateValue]['total']['confirmed']}");
        // print("${dateValue}: ${jsonDecode(data)[v[0]][v[1]][v[2]][v[3]][v[4]]}");
        // sum = sum + int.parse("${jsonDecode(data)[v[0]][v[1]][v[2]][v[3]][v[4]]}");
        // sum = sum + int.parse("${jsonDecode(data)['WB']['dates'][dateValue]['delta']['confirmed']}");
      }catch(e){
        print("${dateValue}: NA");
      }
      }
      // print("${month[i]} $dateValue: $sum");
      count++;
    }
  }else{
    print(response.statusCode);
  }
}

void main(){
  var api="https://data.covid19india.org/v4/min/timeseries.min.json",year=2021,month=5,day=31;
  List<String> v = ['WB','dates','dateValue','total','confirmed'];
  jsonExtractor(api,year,month,day,v);
}