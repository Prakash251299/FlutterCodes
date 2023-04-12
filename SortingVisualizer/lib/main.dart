import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:async/async.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'json_data_extract.dart';

void main() {
  runApp(const MyApp());
}

String version = "";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  initState() async {
    PackageInfo packInfo = await PackageInfo.fromPlatform();
    version = packInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => firstScreen();
}

class firstScreen extends State<MyHomePage> {
  int n = 100;
  var value = "100";
  var message = "";
  int change = 0;
  Widget button2(int num, List arr, List arr2) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple[200],
          border: Border.all(width: 0.2, color: Colors.white),
        ),
        width: MediaQuery.of(context).size.width <= 240
            ? 80
            : MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height <= 498
            ? 62
            : (MediaQuery.of(context).size.height / 2) / 4,
        child: Center(
            child: Text("Visualizer", style: TextStyle(color: Colors.red))),
      ),
      onTap: () => {
        setState(
          () => {
            if (num < 2)
              {
                message = "Put a value >= 2",
              }
            else
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage2(arr, arr2),
                  ),
                ),
              }
          },
        ),
      },
    );
  }

  Widget button(int a) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple[200],
          border: Border.all(width: 0.2, color: Colors.white),
        ),
        width: MediaQuery.of(context).size.width <= 240
            ? 80
            : MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height <= 498
            ? 62
            : (MediaQuery.of(context).size.height / 2) / 4,
        child: Center(
            child: a == 10
                ? Icon(Icons.backspace)
                : Text(a.toString(),
                    style: TextStyle(color: Colors.green[900]))),
      ),
      onTap: () => {
        setState(
          () => {
            message = "",
            if (a == 10)
              {
                if (value.length > 0)
                  {
                    message = "",
                    value = value.substring(0, value.length - 1),
                    if (value.length == 0)
                      {
                        n = 0,
                      }
                    else
                      {
                        n = int.parse(value),
                      }
                  }
              }
            else
              {
                if (value.length == 0 && a == 0)
                  {
                    message = "0 is not accepted",
                    value = "",
                  }
                else
                  {
                    if (value.length >= 3)
                      {
                        value = value + a.toString(),
                        if (int.parse(value) == 1000)
                          {
                            n = 1000,
                          }
                        else
                          {
                            message = "Max limit is 1000",
                            value = value.substring(0, value.length - 1),
                          }
                      },
                    if (value.length <= 2)
                      {
                        value = value + a.toString(),
                        n = int.parse(value),
                      }
                  }
              }
          },
        ),
      },
    );
  }

  // String csvFilePath = "";
  var api = "https://data.covid19india.org/v4/min/timeseries.min.json";
  // var url = Uri.parse("https://data.covid19india.org/v4/min/timeseries.min.json");
  // data
  var year = "2020";
  var month = "10";
  var day = "31";
  // String tex = "";
  showAlertOptions(BuildContext context){
    Widget okButton = FloatingActionButton(
      child:Text("OK"),
      onPressed:()async{
        await jsonExtractor(api,year,month,day);
        Navigator.of(context).pop();
      }
    );
    AlertDialog alert = AlertDialog(
      title:Text("Enter the API and year"),
      content:GestureDetector(child:Container(
        child: Row(children:[
          TextField(
            decoration:InputDecoration(
              hintText:api,
            ),
            onChanged:(text){
              api = text;
              // print(tex);
            },
          ),
          TextField(
            decoration:InputDecoration(
              hintText:'2020',
            ),
            onChanged:(text){
              year = text;
              // print(tex);
            },
          ),

        ]),
      )),
      actions:[okButton],
    );
    showDialog(
      context:context,
      builder:(BuildContext context){
        return alert;
      }
    );
  }

  showAlertDialog(BuildContext context){
    Widget okButton = FloatingActionButton(
      child:Text("OK"),
      onPressed:(){
        Navigator.of(context).pop();
      }
    );
    AlertDialog alert = AlertDialog(
      title:Text("hi"),
      content:
      GestureDetector(child:Container(
        child: Text("Monthly data for a specific year"),
      ),
      onTap:(){
        showAlertOptions(context);
      }),
      actions: [okButton],
    );
    showDialog(
      context:context,
      builder:(BuildContext context){
        return alert;
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    List<int> a = List.filled(n, 1);
    List<int> a1 = List.filled(n, 1);
    for (int i = 0; i < a.length; i++) {
      a[i] = 1 + Random().nextInt(100);
      a1[i] = a[i];
    }
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        width: MediaQuery.of(context).size.width <= 240
            ? 240
            : MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height <= 497
            ? 497
            : MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (c, i) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(children: [
                    // Stack(children:[
                    // Container(
                    //   height:1000,
                    //   width:100,
                    //   color:Colors.red,
                    //   child:Text("ajsdgjka"),
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height <= 498
                          ? 249
                          : MediaQuery.of(context).size.height / 2,
                      child: Column(children: [
                        Row(children: [
                          Container(
                            width: MediaQuery.of(context).size.width <= 240
                                ? 240
                                : MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width >= 348
                                    ? 43
                                    : MediaQuery.of(context).size.width <= 240
                                        ? 30
                                        : MediaQuery.of(context).size.width /
                                            8),
                            child: Stack(
                              alignment:Alignment.center,
                              children:[
                                Positioned.fill(
                                  child:Align(
                                    alignment:Alignment.centerRight,
                                    // alignment:Alignment.topRight,
                                    // alignment:Alignment.bottomRight,
                                    child:GestureDetector(
                                      child: Container(
                                        height:20,
                                        width:MediaQuery.of(context)
                                                  .size
                                                  .width >=
                                              348
                                          ? 29
                                          : MediaQuery.of(context).size.width <=
                                                  240
                                              ? 20
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  12,
                                        color:Colors.amber[200],
                                        // child: ,
                                      ),
                                      onTap:(){
                                        showAlertDialog(context);





                                        










                                        // setState(()=>{

                                        // AlertDialog(
                                        // //   title:Text("ahd"),
                                        //   content:SingleChildScrollView(
                                        //     child:Column(children:[
                                        //       Text("jdshfk"),
                                        //       Text("jdshfk")
                                        //     ]),
                                        //   ),
                                        //   actions: <Widget>[
                                        //     TextButton(
                                        //       child:Text("jhdsk"),
                                        //       onPressed:(){},
                                        //     ),
                                        //   ],
                                        // ),
                                        // });
                                      }
                                    ),
                                  ),
                                ),
                              // Row(
                              //   crossAxisAlignment:CrossAxisAlignment.start,
                              //   children:[
                              //   Text("hiejk")
                              // ]),
                              Center(
                              child: Text("Sorting visualizer",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width >=
                                              348
                                          ? 29
                                          : MediaQuery.of(context).size.width <=
                                                  240
                                              ? 20
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  12)),
                            ),]),
                          ),
                        ]),
                        Column(children: [
                          Container(
                            height: MediaQuery.of(context).size.height <= 498
                                ? 166
                                : MediaQuery.of(context).size.height / 3,
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Row(
                                    children: [
                                      Text(value,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width >=
                                                      348
                                                  ? 25
                                                  : MediaQuery.of(context)
                                                              .size
                                                              .width <=
                                                          240
                                                      ? 17
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          7 /
                                                          100)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("___________________",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w800,
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width >=
                                                      348
                                                  ? 14
                                                  : MediaQuery.of(context)
                                                              .size
                                                              .width <=
                                                          240
                                                      ? 9
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          4 /
                                                          100)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(message),
                                      )
                                    ],
                                  )
                                ])),
                          ),
                        ]),
                      ]),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width <= 240
                          ? 240
                          : MediaQuery.of(context).size.width,
                      child: Center(
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [button(1)],
                              ),
                              Row(
                                children: [button(2)],
                              ),
                              Row(
                                children: [button(3)],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [button(4)],
                              ),
                              Row(
                                children: [button(5)],
                              ),
                              Row(
                                children: [button(6)],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [button(7)],
                              ),
                              Row(
                                children: [button(8)],
                              ),
                              Row(
                                children: [button(9)],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [button(10)],
                              ),
                              Row(
                                children: [button(0)],
                              ),
                              Row(
                                children: [button2(n, a, a1)],
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ]),
                )),
      ),
    );
  }
}

int barColor1 = -1, barColor2 = -1;

class MyHomePage2 extends StatefulWidget {
  final List<int> a;
  final List<int> c;
  MyHomePage2(b, k)
      : this.a = b ?? [],
        this.c = k;
  // int n = 0;
  @override
  State<MyHomePage2> createState() => secondScreen(a, c);
}

var _value = 75.0;
var cancelled = false;
var resetter = 0;
var sortTap = 0;
var hamburger = 0;
var barPosition = 0;
var sortingMethods = [
  "Selection sort",
  "Insertion sort",
  "Bubble sort",
  "Quick sort",
  "Merge sort",
];
var selectedSortingMethod = 0;
var cross = CrossAxisAlignment.end;

class secondScreen extends State<MyHomePage2> {
  final List<int> a;
  final List<int> originalArr;
  secondScreen(b, c)
      : this.a = b ?? [],
        this.originalArr = c ?? [];

  int _counter = 0;
  int i = 0, j = 0;

  Future<bool> sort(var A) async {
    // print("Sorting");
    if (selectedSortingMethod == 0) {
      selectionSort(A);
    }
    if (selectedSortingMethod == 1) {
      insertionSort(A);
    }
    if (selectedSortingMethod == 2) {
      bubbleSort(A);
    }
    if (selectedSortingMethod == 3) {
      quickSort(A, 0, A.length - 1);
    }
    if (selectedSortingMethod == 4) {
      await mergeSort(A, 0, A.length - 1);
    }
    return true;
  }

  Future<bool> merge(var a, var x1, var y1, var x2, var y2) async {
    int i = 0, j = 0;
    int start = x1, end = y2;
    List<int> c = List<int>.filled(0, 0, growable: true);
    List<int> indexCont = List<int>.filled(0, 0, growable: true);
    while (true) {
      if (cancelled && this.mounted) {
        setState(() => {
              barColor1 = -1,
              barColor2 = -1,
              cancelled = false,
            });
        return true;
      }
      if (x1 > y1) {
        for (i = x2; i <= y2; i++) {
          c.add(a[i]);
          if (this.mounted)
            setState(() => {
                  barColor1 = y1,
                  barColor2 = i,
                });
        }
        break;
      }
      if (x2 > y2) {
        for (i = x1; i <= y1; i++) {
          c.add(a[i]);
          if (this.mounted)
            setState(() => {
                  barColor1 = y2,
                  barColor2 = i,
                });
        }
        break;
      }
      if (a[x1] <= a[x2]) {
        c.add(a[x1]);
        if (this.mounted)
          setState(() => {
                barColor1 = x1,
                barColor2 = x2,
              });
        x1++;
      } else {
        c.add(a[x2]);
        if (this.mounted)
          setState(() => {
                barColor1 = x1,
                barColor2 = x2,
              });
        x2++;
      }
    }
    for (i = start; i <= end; i++) {
      await changeVal(a, i, c, start);
    }
    return true;
  }

  Future<bool> changeVal(var a, var i, var c, var start) async {
    var v = 0;
      if(_value==100){
        v = 0;
      }
      if(_value==75){
        v = 100;
      }
      if(_value==50){
        v = 350;
      }
      if(_value==25){
        v = 650;
      }
      if(_value==0){
        v = 1000;
      }
    await Future.delayed(Duration(milliseconds: v));
    if (this.mounted)
      setState(() => {
            a[i] = c[i - start],
          });
    return true;
  }

  Future<bool> mergeSort(var a, var x, var y) async {
    if (x >= y) {
      return true;
    }
    int mid = ((x + y) / 2).toInt();
    await mergeSort(a, x, mid);
    await mergeSort(a, mid + 1, y);
    await merge(a, x, mid, mid + 1, y);
    if (this.mounted)
      setState(() => {
            barColor1 = -1,
            barColor2 = -1,
          });
    return true;
  }

  Future<bool> quickSort(
      listtobesort, int leftelement, int rightelement) async {
    int i = leftelement;
    int j = rightelement;
    int pivotelement = listtobesort[(leftelement + rightelement) ~/ 2];

    while (i <= j) {
      var v = 0;
      if(_value==100){
        v = 0;
      }
      if(_value==75){
        v = 100;
      }
      if(_value==50){
        v = 350;
      }
      if(_value==25){
        v = 650;
      }
      if(_value==0){
        v = 1000;
      }
      await Future.delayed(Duration(milliseconds: v));
      if (cancelled && this.mounted) {
        setState(() => {
              barColor1 = -1,
              barColor2 = -1,
              cancelled = false,
            });
        return true;
      }
      while (listtobesort[i] < pivotelement) {
        i++;
      }

      while (listtobesort[j] > pivotelement) {
        j--;
      }
      int objtemp;
      if (i <= j) {
        if (this.mounted) {
          setState(() => {
                objtemp = listtobesort[i],
                listtobesort[i] = listtobesort[j],
                listtobesort[j] = objtemp,
                barColor1 = i,
                barColor2 = j,
              });
        }
        i++;
        j--;
      }
    }

    if (leftelement < j) {
      quickSort(listtobesort, leftelement, j);
    }
    if (i < rightelement) {
      quickSort(listtobesort, i, rightelement);
    }
    if (this.mounted)
      setState(() => {
            barColor1 = -1,
            barColor2 = -1,
          });
    return true;
  }

  Future<bool> bubbleSort(var L) async {
    var n = L.length;
    for (var i = 0; i < n; i++) {
      var v = 0;
      if(_value==100){
        v = 0;
      }
      if(_value==75){
        v = 100;
      }
      if(_value==50){
        v = 350;
      }
      if(_value==25){
        v = 650;
      }
      if(_value==0){
        v = 1000;
      }
      await Future.delayed(Duration(milliseconds: v));
      if (cancelled && this.mounted) {
        setState(() => {
              barColor1 = -1,
              barColor2 = -1,
              cancelled = false,
            });
        return true;
      }
      var temp;
      for (var j = 0; j < n - i - 1; j++) {
        if (L[j] > L[j + 1]) {
          if (this.mounted) {
            setState(() => {
                  temp = L[j],
                  L[j] = L[j + 1],
                  L[j + 1] = temp,
                  barColor1 = i,
                  barColor2 = j,
                });
          }
        }
      }
    }
    if (this.mounted)
      setState(() => {
            barColor1 = -1,
            barColor2 = -1,
          });
    return true;
  }

  Future<bool> insertionSort(List<int> list) async {
    for (int j = 1; j < list.length; j++) {
      var v = 0;
      if(_value==100){
        v = 0;
      }
      if(_value==75){
        v = 100;
      }
      if(_value==50){
        v = 350;
      }
      if(_value==25){
        v = 650;
      }
      if(_value==0){
        v = 1000;
      }
      await Future.delayed(Duration(milliseconds: v));
      if (cancelled && this.mounted) {
        setState(() => {
              barColor1 = -1,
              barColor2 = -1,
              cancelled = false,
            });
        return true;
      }
      int key = list[j];

      int i = j - 1;

      while (i >= 0 && list[i] > key) {
        if (this.mounted) {
          setState(() => {
                list[i + 1] = list[i],
                i = i - 1,
                list[i + 1] = key,
                barColor1 = j,
                barColor2 = i,
              });
        }
      }
    }
    if (this.mounted)
      setState(() => {
            barColor1 = -1,
            barColor2 = -1,
          });
    return true;
  }

  Future<bool> selectionSort(var L) async {
    var n = L.length;
    var temp, lock = 0, i = 0, j = 0;
    var index_min = 0;
    for (i = 0; i < n - 1; i++) {
      var v = 0;
      if(_value==100){
        v = 0;
      }
      if(_value==75){
        v = 100;
      }
      if(_value==50){
        v = 350;
      }
      if(_value==25){
        v = 650;
      }
      if(_value==0){
        v = 1000;
      }
      // var v = -1 *
      //     1 *
      //     (_value - 50.0)
      //         .toInt(); // '_value' goes from 100 to 0 so made it go from 0 to 100 by making its value decreased by 100 and negating the result {40 is  multiplied so that v can varies from 0 to 4000 for milliseconds in multiple of 40 milliseconds}
      await Future.delayed(Duration(milliseconds: v));
      if (cancelled && this.mounted) {
        setState(() => {
              barColor1 = -1,
              barColor2 = -1,
              cancelled = false,
            });
        return true;
      }
      index_min = i;
      for (j = i + 1; j < n; j++) {
        if (L[j] < L[index_min]) {
          index_min = j;
        }
      }
      if (index_min != i) {
        if (this.mounted) {
          // While sorting process is going on, back button is clicked then it stops sorting else gives error
          setState(() => {
                temp = L[i],
                L[i] = L[index_min],
                L[index_min] = temp,
                barColor1 = i,
                barColor2 = index_min,
              });
        }
      }
    }
    if (this.mounted)
      setState(() => {
            barColor1 = -1,
            barColor2 = -1,
          });
    // print("hi");
    // });
    return true;
  }

  int max = 0;
  List reSizer(var a) {
    for (i = 0; i < a.length; i++) {
      if (a[i] > max) {
        max = a[i];
      }
    }
    var minHeight = MediaQuery.of(context).size.height <= 498
        ? 498
        : MediaQuery.of(context).size.height;
    var per = 65 / 100;
    double percentHeightOfElements = 0;
    if (max > minHeight * per) {
      percentHeightOfElements = (minHeight * per * 100) / max;
      for (i = 0; i < a.length; i++) {
        a[i] = a[i] * percentHeightOfElements / 100;
      }
    } else {
      if (max < minHeight * per) {
        percentHeightOfElements = minHeight * per / max;
        for (i = 0; i < a.length; i++) {
          a[i] = a[i] * percentHeightOfElements;
        }
      }
    }
    return a;
  }

  Widget hamburgerOption() {
    return new Column(children: [
      for (int i = 0; i < sortingMethods.length; i++) ...{
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(),
              height: MediaQuery.of(context).size.width <= 240
                  ? 240 * 9 / 100
                  : MediaQuery.of(context).size.width >= 600
                      ? 600 * 9 / 100
                      : MediaQuery.of(context).size.width * 9 / 100,
              width: MediaQuery.of(context).size.width <= 240
                  ? 240 * 40 / 100
                  : MediaQuery.of(context).size.width * 40 / 100,
              child:
                  // Row(children:[
                  Center(
                child: Text("${sortingMethods[i]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width >= 600
                          ? 600 * 2.6 / 100
                          : MediaQuery.of(context).size.width <= 240
                              ? 240 * 2.6 / 100
                              : MediaQuery.of(context).size.width * 2.6 / 100,
                    )),
              ),
            ),
            onTap: () {
              setState(() => {
                    selectedSortingMethod = i,
                    hamburger = 0,
                    cancelled = true,
                    sortTap = 0,
                  });
              // print(i);
            })
      },
    ]);
  }

  Widget rectangleCreator(double val, var arr, var i) {
    return Container(
      alignment: Alignment.center,
      child: new Column(
        children: [
          Container(
            color:
                i == barColor1 || i == barColor2 ? Colors.yellow : Colors.red,
            height: val,
            width: MediaQuery.of(context).size.width <= 240
                ? (240 / 2) / arr.length
                : (MediaQuery.of(context).size.width / 2) / arr.length,
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width <= 240
                    ? (240 / 2) / arr.length
                    : (MediaQuery.of(context).size.width / 2) / arr.length),
            alignment: Alignment.topLeft,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return mainScreen(a);
  }

  Widget mainScreen(var a) {
    List resizedArr = List.filled(a.length, 0);
    for (i = 0; i < a.length; i++) {
      resizedArr[i] = a[i];
    }
    resizedArr = reSizer(resizedArr);

    return Scaffold(
      body:
          Stack(fit: StackFit.expand, alignment: Alignment.topRight, children: [
        GestureDetector(
            child: Container(
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Stack(alignment: Alignment.topRight, children: [
                        new Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.grey,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: new Column(
                                  children: [
                                    Container(
                                      child: Column(children: [
                                        new Row(children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                            .size
                                                            .height <=
                                                        498
                                                    ? 498 * 10 / 100
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        10 /
                                                        100),
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    240
                                                ? 240
                                                : MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .height <=
                                                    498
                                                ? 49.8
                                                : MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    10 /
                                                    100,
                                            child: Center(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: GestureDetector(
                                                        child: Container(
                                                          // height:100,
                                                          // width:100,
                                                          child: Icon(
                                                            Icons.arrow_back,
                                                            color: Colors.white,
                                                            size: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width <=
                                                                    240
                                                                ? 240 * 6 / 100
                                                                : MediaQuery.of(context)
                                                                            .size
                                                                            .width >=
                                                                        600
                                                                    ? 600 *
                                                                        6 /
                                                                        100
                                                                    : MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        6 /
                                                                        100,
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          cancelled = true;
                                                          sortTap = 0;
                                                          hamburger = 0;
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    MyHomePage(
                                                                        title:
                                                                            'Flutter Demo Home Page'),
                                                              ));
                                                        },
                                                      ),
                                                    ),
                                                    Spacer(flex: 1),
                                                    Text(
                                                        "${sortingMethods[selectedSortingMethod]}",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <=
                                                                  240
                                                              ? 240 * 5 / 100
                                                              : MediaQuery.of(context)
                                                                          .size
                                                                          .width >=
                                                                      500
                                                                  ? 500 *
                                                                      5 /
                                                                      100
                                                                  : MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      5 /
                                                                      100,
                                                        )),
                                                    Spacer(flex: 1),
                                                    GestureDetector(
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Icon(
                                                          Icons.menu,
                                                          color: Colors.white,
                                                          size: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <=
                                                                  240
                                                              ? 240 * 6 / 100
                                                              : MediaQuery.of(context)
                                                                          .size
                                                                          .width >=
                                                                      600
                                                                  ? 600 *
                                                                      6 /
                                                                      100
                                                                  : MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      6 /
                                                                      100,
                                                        ),
                                                      ),
                                                      onTap: (() => {
                                                            setState(() => {
                                                                  if (hamburger ==
                                                                      0)
                                                                    {
                                                                      hamburger =
                                                                          1,
                                                                    }
                                                                  else
                                                                    {
                                                                      hamburger =
                                                                          0,
                                                                    }
                                                                }),
                                                          }),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ]),
                                        new Row(children: [
                                          Container(
                                              child: Row(
                                            crossAxisAlignment: cross,
                                            children: [
                                              for (i = 0;
                                                  i < a.length;
                                                  i++) ...[
                                                rectangleCreator(resizedArr[i],
                                                    resizedArr, i),
                                              ],
                                            ],
                                          )),
                                        ]),
                                        // ]
                                      ]),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context)
                                                  .size
                                                  .height <=
                                              498
                                          ? 498 * 15 / 100
                                          : MediaQuery.of(context).size.height *
                                              15 /
                                              100,
                                      width: MediaQuery.of(context)
                                                  .size
                                                  .width <=
                                              240
                                          ? 240
                                          : MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[800],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(0.0, -5.0),
                                              blurRadius: 10.0,
                                              spreadRadius: 5.0,
                                            ),
                                          ]),
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      2 /
                                                      100),
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .height <=
                                                      498
                                                  ? 498 * 3 / 100
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      3 /
                                                      100,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width <=
                                                      240
                                                  ? 240 * 70 / 100
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      70 /
                                                      100,
                                              child: Slider(
                                                  min: 0,
                                                  max: 100,
                                                  divisions: 4,
                                                  label:
                                                      '${_value.round() / 25 + 1}x',
                                                  value: _value,
                                                  onChanged: (v) {
                                                    // print(v);
                                                    setState(() => {
                                                          hamburger = 0,
                                                          _value = v,
                                                        });
                                                  }),
                                              // ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  GestureDetector(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height <=
                                                                    240
                                                                ? 240 * 2 / 100
                                                                : MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    2 /
                                                                    100),
                                                        height: 20,
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <=
                                                                240
                                                            ? 240 * 35 / 100
                                                            : MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                35 /
                                                                100,
                                                        color: Colors.yellow,
                                                        child: Center(
                                                          child: Text("Reset",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .brown)),
                                                        ),
                                                      ),
                                                      onTap: () async {
                                                        sortTap = 0;
                                                        barColor1 = -1;
                                                        barColor2 = -1;
                                                        hamburger = 0;
                                                        // });
                                                        Navigator.pop(context);

                                                        cancelled =
                                                            true; // Error:  Only simultaneous two or more taps cancelled is true but it should be made false

                                                        for (int i = 0;
                                                            i < a.length;
                                                            i++) {
                                                          a[i] = originalArr[i];
                                                        }
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MyHomePage2(a,
                                                                      originalArr),
                                                            ));
                                                      }),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  GestureDetector(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height <=
                                                                    240
                                                                ? 240 * 2 / 100
                                                                : MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    2 /
                                                                    100),
                                                        height: 20,
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <=
                                                                240
                                                            ? 240 * 35 / 100
                                                            : MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                35 /
                                                                100,
                                                        color: Colors.blue,
                                                        child: Center(
                                                            child: Text("Sort",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white))),
                                                      ),
                                                      onTap: () {
                                                        hamburger = 0;
                                                        if (sortTap == 0) {
                                                          cancelled = false;
                                                          sort(a);
                                                        }
                                                        sortTap++;
                                                      }),
                                                ],
                                              ),
                                            ]),
                                      ]),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        if (hamburger != 0) ...{
                          Container(
                            height: MediaQuery.of(context).size.height <= 498
                                ? 498
                                : MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width <= 240
                                ? 240 * 35 / 100
                                : MediaQuery.of(context).size.width >= 550
                                    ? 550 * 35 / 100
                                    : MediaQuery.of(context).size.width *
                                        35 /
                                        100,
                            color: Colors.blueGrey,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.width <=
                                                    240
                                                ? 240 * 9 / 100
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width >=
                                                        600
                                                    ? 600 * 9 / 100
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        9 /
                                                        100),
                                    child: ListView.builder(
                                        itemCount: 1,
                                        itemBuilder: (c, i) {
                                          return hamburgerOption();
                                        }),
                                  ),
                                  GestureDetector(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width <=
                                                    240
                                                ? 240 * 9 / 100
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width >=
                                                        600
                                                    ? 600 * 9 / 100
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        9 /
                                                        100,
                                        width:
                                            MediaQuery.of(context).size.width <=
                                                    240
                                                ? 240 * 40 / 100
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    40 /
                                                    100,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width <=
                                                            400
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4 /
                                                            100
                                                        : 2))),
                                        child: Center(
                                          child: Text("Setting",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width >=
                                                        600
                                                    ? 600 * 2.6 / 100
                                                    : MediaQuery.of(context)
                                                                .size
                                                                .width <=
                                                            240
                                                        ? 240 * 2.6 / 100
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            2.6 /
                                                            100,
                                              )),
                                        ),
                                      ),
                                      onTap: () {
                                        hamburger = 0;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomepage3(a, originalArr),
                                            ));
                                        //
                                      }),
                                ]),
                          ),
                        }
                      ]),
                    ),
                  ),
                ),
              ]),
            ),
            onTap: () {
              setState(() => {
                    hamburger = 0,
                  });
            }),
      ]),
    );
  }
}

class MyHomepage3 extends StatefulWidget {
  List<int> a;
  List<int> b;
  MyHomepage3(a1, c)
      : this.a = a1 ?? [],
        this.b = c ?? [];
  @override
  State<MyHomepage3> createState() => Screen3(a, b);
}

var settingOptions = ["Bar type", "Sorting sound [Enabled]", "Source code"];
var option = 0;
var opacity = 1.0;

class Screen3 extends State<MyHomepage3> {
  List<int> a;
  List<int> b;
  Screen3(c, d)
      : this.a = c ?? [],
        this.b = d ?? [];
  //
  Widget settingOptionsButton(int i) {
    return InkWell(
        child: Container(
          height: MediaQuery.of(context).size.width <= 240
              ? 240 * 20 / 100
              : MediaQuery.of(context).size.width >= 348
                  ? 348 * 20 / 100
                  : MediaQuery.of(context).size.width * 20 / 100,
          width: MediaQuery.of(context).size.width <= 240
              ? 240
              : MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width <= 240
                  ? 240 * 2 / 100
                  : MediaQuery.of(context).size.width * 2 / 100),
          child: Center(
            child: Row(children: [
              Text("${settingOptions[i]}",
                  style: TextStyle(
                      color: Colors.white.withOpacity(opacity),
                      fontSize: MediaQuery.of(context).size.width >= 348
                          ? 348 * 5 / 100
                          : MediaQuery.of(context).size.width <= 240
                              ? 240 * 5 / 100
                              : MediaQuery.of(context).size.width * 5 / 100)),
            ]),
          ),
        ),
        onTap: () {
          if (i == 0) {
            if (this.mounted)
              setState(() => {
                    if (option != 1)
                      {
                        option = 1,
                        opacity = 0.3,
                      }
                    else
                      {
                        option = 0,
                        opacity = 1.0,
                      }
                  });
            // print("${settingOptions[i]}");
          }
          if (i == 1) {
            if (this.mounted)
              setState(() => {
                    if (option != 2)
                      {
                        option = 2,
                        opacity = 1,
                        settingOptions[i] = "Sorting sound [Disabled]",
                      }
                    else
                      {
                        option = 0,
                        opacity = 1,
                        settingOptions[i] = "Sorting sound [Enabled]",
                      }
                  });

            print("${settingOptions[i]}");
          }
          if (i == 2) {
            if (this.mounted)
              setState(() => {
                    if (option != 3)
                      {
                        opacity = 1,
                        _launchUrl(),
                      }
                    else
                      {
                        option = 0,
                        opacity = 1,
                      }
                  });
            print("${settingOptions[i]}");
          }
        });
  }

  Future<bool> barChanger(int i) async {
    if (this.mounted)
      setState(() => {
            if (i == 0)
              {
                cross = CrossAxisAlignment.end,
                opacity = 1,
                option = 0,
              },
            if (i == 1)
              {
                cross = CrossAxisAlignment.start,
                opacity = 1,
                option = 0,
              },
            if (i == 2)
              {
                cross = CrossAxisAlignment.center,
                opacity = 1,
                option = 0,
              },
          });
    return false;
  }

  Future<int> _launchUrl() async {
    const url = 'https://github.com/Prakash251299/Flutter/blob/80a98b783835bffcdddae2559df46122c36bdb7e/Sorting%20visualizer';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Error: $url';
    }
    return 0;
  }

  Widget screen() {
    // print("hi");
    return Scaffold(
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(children: [
                    Stack(children: [
                      GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(opacity),
                                  Colors.black54.withOpacity(0.5),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            height: MediaQuery.of(context).size.height <= 498
                                ? 498
                                : MediaQuery.of(context).size.height,
                            child: Column(children: [
                              Row(children: [
                                Container(
                                  width: MediaQuery.of(context).size.width<=240?240:MediaQuery.of(context).size.width,
                                  child: Column(children: [
                                    Container(
                                      width: MediaQuery.of(context)
                                                  .size
                                                  .width <=
                                              240
                                          ? 240
                                          : MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                      .size
                                                      .height <=
                                                  498
                                              ? 498 / 11
                                              : MediaQuery.of(context)
                                                          .size
                                                          .height >=
                                                      600
                                                  ? 600 / 11
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      11),
                                      child: Center(
                                        child: Text("Settings",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(opacity),
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width >=
                                                        348
                                                    ? 29
                                                    : MediaQuery.of(context)
                                                                .size
                                                                .width <=
                                                            240
                                                        ? 20
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            12)),
                                      ),
                                    ),
                                    Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                              child: Column(children: [
                                            for (int i = 0; i < 3; i++) ...[
                                              settingOptionsButton(i),
                                            ],
                                          ])),
                                          if (option == 1) ...{
                                            Column(children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                            .size
                                                            .width <=
                                                        240
                                                    ? 240 * 40 / 100
                                                    : MediaQuery.of(context)
                                                                .size
                                                                .width >=
                                                            348
                                                        ? 348 * 40 / 100
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            40 /
                                                            100,
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width <=
                                                        240
                                                    ? 240 * 40 / 100
                                                    : MediaQuery.of(context)
                                                                .size
                                                                .width >=
                                                            348
                                                        ? 348 * 40 / 100
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            40 /
                                                            100,
                                                color: Colors.black54,
                                                child: Center(
                                                    child: Column(
                                                  children: [
                                                    InkWell(
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <=
                                                                  240
                                                              ? (240 *
                                                                      40 /
                                                                      100) /
                                                                  3
                                                              : MediaQuery.of(context)
                                                                          .size
                                                                          .width >=
                                                                      348
                                                                  ? (348 *
                                                                          40 /
                                                                          100) /
                                                                      3
                                                                  : (MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          40 /
                                                                          100) /
                                                                      3,
                                                          child: Center(
                                                            child: Text(
                                                                "Normal",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          await barChanger(0);
                                                        }),
                                                    InkWell(
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <=
                                                                  240
                                                              ? (240 *
                                                                      40 /
                                                                      100) /
                                                                  3
                                                              : MediaQuery.of(context)
                                                                          .size
                                                                          .width >=
                                                                      348
                                                                  ? (348 *
                                                                          40 /
                                                                          100) /
                                                                      3
                                                                  : (MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          40 /
                                                                          100) /
                                                                      3,
                                                          child: Center(
                                                            child: Text(
                                                                "Reverse",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          await barChanger(1);
                                                        }),
                                                    InkWell(
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <=
                                                                  240
                                                              ? (240 *
                                                                      40 /
                                                                      100) /
                                                                  3
                                                              : MediaQuery.of(context)
                                                                          .size
                                                                          .width >=
                                                                      348
                                                                  ? (348 *
                                                                          40 /
                                                                          100) /
                                                                      3
                                                                  : (MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          40 /
                                                                          100) /
                                                                      3,
                                                          child: Center(
                                                            child: Text(
                                                                "Centralized",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          await barChanger(2);
                                                        }),
                                                  ],
                                                )),
                                              )
                                            ]),
                                          },
                                        ]),
                                    Container(
                                      height: MediaQuery.of(context)
                                                  .size
                                                  .width <=
                                              240
                                          ? 240 * 20 / 100
                                          : MediaQuery.of(context).size.width >=
                                                  348
                                              ? 348 * 20 / 100
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  20 /
                                                  100,
                                      width: MediaQuery.of(context)
                                                  .size
                                                  .width <=
                                              240
                                          ? 240
                                          : MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width <=
                                                    240
                                                ? 240 * 2 / 100
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    2 /
                                                    100,
                                      ),
                                      child: Center(
                                        child: Row(children: [
                                          Text("App version",
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(opacity),
                                                  fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width >=
                                                          348
                                                      ? 348 * 5 / 100
                                                      : MediaQuery.of(context)
                                                                  .size
                                                                  .width <=
                                                              240
                                                          ? 240 * 5 / 100
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              5 /
                                                              100)),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: MediaQuery.of(context)
                                                            .size
                                                            .width <=
                                                        384
                                                    ? 40
                                                    : 50),
                                            child: Text("${version}",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(opacity),
                                                    fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width >=
                                                            348
                                                        ? 348 * 5 / 100
                                                        : MediaQuery.of(context)
                                                                    .size
                                                                    .width <=
                                                                240
                                                            ? 240 * 5 / 100
                                                            : MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                5 /
                                                                100)),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ]),
                                )
                              ])
                            ]),
                          ),
                          onTap: () {
                            setState(() => {
                                  opacity = 1,
                                  option = 0,
                                });
                          }),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(left: 2, top: 5),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width <= 240
                                ? 240 * 6 / 100
                                : MediaQuery.of(context).size.width >= 600
                                    ? 600 * 6 / 100
                                    : MediaQuery.of(context).size.width *
                                        6 /
                                        100,
                          ),
                        ),
                        onTap: () {
                          cancelled = true;
                          sortTap = 0;
                          hamburger = 0;
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage2(a, b),
                              ));
                        },
                      ),
                    ]),
                  ]),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return screen();
  }
}
