import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:async/async.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'population.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import './covi';

void main() {
  runApp(const MyApp());
}

String version = "";
var state = [
    "Mizoram",
    "Chandigarh",
    "Madhya Pradesh",
    "Tamil Nadu",
    "Karnataka",
    "Gujarat",
    "Andhra Pradesh",
    "Uttar Pradesh",
    "Odisha",
    "Telangana",
    "Kerala",
    "Lakshadweep"
    "Nagaland",
    "Jharkhand",
    "Assam",
    "Chhattisgarh",
    "Punjab",
    "Haryana",
    "NCT of Delhi",
    "Rajasthan",
    "Bihar",
    "Puducherry",
    "West Bengal",
    "Jammu and Kashmir",
    "Uttarakhand",
    "Meghalaya",
    "Manipur",
    "Maharashtra",
    "Dadra and daman",
    "Arunachal Pradesh",
    "Tripura",
    "Himachal Pradesh",
    "Goa",
    "Sikkim",
    "Ladakh",
    "Andaman and Nicobar Islands",
  ];
  var resp;
  var apiFetchError=0;
  var popTapped = 0;
  var info1 = 1;

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // durationFun()async{
  //   Future.delayed(const Duration(seconds:5),(){
  //     // if(this.mounted){
  //       setState((){
          
  //       });
  //     // }
  //   });
  // }
  // This widget is the root of your application.
  @override
  void initState() async {
    // super.initState();
    PackageInfo packInfo = await PackageInfo.fromPlatform();
    version = packInfo.version;
    // Future.delayed(const Duration(seconds:5),(){
    //   if(this.mounted){
    //     setState((){

    //     });
    //   }
    // });
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
// var maxHeight=498;
var maxHeight=510;
var screen2=0;
class firstScreen extends State<MyHomePage> {
  int n = 100;
  var value = "100";
  var message = "";
  int change = 0;
  // @override
  // information1(){
  //   Future.delayed(const Duration(seconds:2),(){
  //       if(this.mounted){
  //         setState((){
  //           info1 = 0;
  //         });
  //       }
  //   });
  // }
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
        // height: MediaQuery.of(context).size.height <= 498
        //     ? 62
        //     : (MediaQuery.of(context).size.height / 2) / 4,



        height: MediaQuery.of(context).size.height <= maxHeight
            ? maxHeight/8.032
            : (MediaQuery.of(context).size.height / 2) / 4,
        child: Center(
            child: Text("Visualizer", style: TextStyle(color: Colors.red))),
      ),
      onTap: () => {
            // setState((){
            //   info1 = 1;
            // }),
        setState(
          () => {
            // screen2=0,
            if (num < 2)
              {
                message = "Put a value >= 2",
              }
            else
              {
                // await information1(),
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
        height: MediaQuery.of(context).size.height <= maxHeight
            ? maxHeight/8.032
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

  // var state = [
  //   "Mizoram",
  //   "Chandigarh",
  //   "Madhya Pradesh",
  //   "Tamil Nadu",
  //   "Karnataka",
  //   "Gujarat",
  //   "Andhra Pradesh",
  //   "Uttar Pradesh",
  //   "Odisha",
  //   "Telangana",
  //   "Kerala",
  //   "Lakshadweep"
  //   "Nagaland",
  //   "Jharkhand",
  //   "Assam",
  //   "Chhattisgarh",
  //   "Punjab",
  //   "Haryana",
  //   "NCT of Delhi",
  //   "Rajasthan",
  //   "Bihar",
  //   "Puducherry",
  //   "West Bengal",
  //   "Jammu and Kashmir",
  //   "Uttarakhand",
  //   "Meghalaya",
  //   "Manipur",
  //   "Maharashtra",
  //   "Dadra and Nagar Haveli and Daman and Diu",
  //   "Arunachal Pradesh",
  //   "Tripura",
  //   "Himachal Pradesh",
  //   "Goa",
  //   "Sikkim",
  //   "Ladakh",
  //   "Andaman and Nicobar Islands",
  // ];

  Future<List> fetchApi() async {
    // const url = 'https://data.covid19india.org/csv/latest/states.csv';
    const url = 'https://prakash251299.github.io/API/population.json';
    // try{

    // }catch(e){
    //   print("Error:");
    //   print(e);
    // }
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    // print(body);
    var res = jsonDecode(body);
    resp = res;
    List<int> lst=[];
    for(int i=0;i<35;i++){
      if(res[state[i]]==null){
        lst.add(0);
      }
      else{
        lst.add(res[state[i]]);
      }
      // print(lst);
    }
    // print(lst);
    // print(state.length);
    // print(res[state[0]]);
    // print(res["Bihar"]);
    // print("Ishu");
    // l = lst;
    // print(l);
    return lst;
  }

  // List l=[];

  @override
  Widget build(BuildContext context) {
    List<int> a = List.filled(n, 1);
    List<int> a1 = List.filled(n, 1);
    // List l = List.filled(n, 1);
    for (int i = 0; i < a.length; i++) {
      a[i] = 1 + Random().nextInt(100);
      a1[i] = a[i];
    }
    // information1(){
    //   Future.delayed(const Duration(seconds:5),(){
    //     if(this.mounted){
    //       setState((){
    //       info1 = 0;
    //       });
    //     }
    //   });
    // }
    errorControl(){
      Future.delayed(const Duration(seconds:5),(){
        if(this.mounted){
          setState((){
            // info1=0;
            apiFetchError = 0;
          });
        }
      });
    }
    // errorControl();
    return Scaffold(
      body: SafeArea(
        top:true,
        left:false,
        right:false,
        bottom:true,
        child:Container(
        color: Colors.grey[300],
        width: MediaQuery.of(context).size.width <= 240
            ? 240
            : MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height <= maxHeight
        //     ? maxHeight*1
        //     : MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (c, i) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: 
                  Stack(
                    alignment:Alignment.topCenter,
                    children:[
                      Container(
                        // margin:EdgeInsets.only(bottom:MediaQuery.of(context).size.height*50/100),
                        // margin:EdgeInsets.only(bottom:MediaQuery.of(context).size.height<=maxHeight?maxHeight*50/100:MediaQuery.of(context).size.height*50/100),
                        // margin:EdgeInsets.only(top:MediaQuery.of(context).size.height<=600?600*12/100:700*12/100),
                        margin:EdgeInsets.only(top:MediaQuery.of(context).size.height<=600?600*12/100:MediaQuery.of(context).size.height>=700?700*12/100:MediaQuery.of(context).size.height*12/100),
                        child:Column(children:[
                    if(apiFetchError==1)...[
                              Text("Api fetch error you are offline",style: TextStyle(
                                      color: Colors.red,
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width >=
                                              348
                                          ? 16
                                          : MediaQuery.of(context).size.width <=
                                                  240
                                              ? 10
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  24)),
                    ],
                      ]),
                    ),
                  Stack(
                    alignment:Alignment.topCenter,
                    children: [
                    




                      Container(
                        // margin: EdgeInsets.only(
                        //         top: MediaQuery.of(context).size.height >= 348
                        //             ? 43
                        //             : MediaQuery.of(context).size.height <= 240
                        //                 ? 30
                        //                 : MediaQuery.of(context).size.height /
                        //                     8),
                        // margin: EdgeInsets.only(top:10),
                        // height: 10,
                        child: 
                        Row(children:[
                          Column(children:[
                          //   if(apiFetchError==0)...[
                          //     Text("Api fetch error you are offline",style: TextStyle(
                          //             color: Colors.red,
                          //             fontSize: MediaQuery.of(context)
                          //                         .size
                          //                         .width >=
                          //                     348
                          //                 ? 16
                          //                 : MediaQuery.of(context).size.width <=
                          //                         240
                          //                     ? 10
                          //                     : MediaQuery.of(context)
                          //                             .size
                          //                             .width /
                          //                         24)),
                          //   ],
                          // ]),
                        Row(
                          // alignment:Alignment.bottomCenter,
                          children:[
                          // Text("State wise population visualization of india",style: TextStyle(
                          //             // color: Colors.green,
                          //             fontSize: MediaQuery.of(context)
                          //                         .size
                          //                         .width >=
                          //                     348
                          //                 ? 16
                          //                 : MediaQuery.of(context).size.width <=
                          //                         240
                          //                     ? 10~
                          //                     : MediaQuery.of(context)
                          //                             .size
                          //                             .width /
                          //                         24)),
                          // InkWell(child:Icon(Icons.ads_click_outlined,color:Colors.green[900]),onTap:() async {
                          //   List lst;
                          //   setState((){
                          //     popTapped = 1;
                          //   });
                          //   try{
                          //     // print(state[-1]);
                          //     // print("hi");
                          //     lst =  await fetchApi();
                          //     Navigator.push(context,MaterialPageRoute(builder: (context)=>PopPage(lst,lst)));
                          //   }catch(e){
                          //     setState((){
                          //       apiFetchError=1;
                          //       popTapped = 0;
                          //     });
                          //     errorControl();
                          //   }


                          // }),
                        ]),
                        ]),
                        ]),
                      ),
                    Container(
                      height: MediaQuery.of(context).size.height <= maxHeight
                          ? maxHeight/2
                          : MediaQuery.of(context).size.height / 2,
                      child: Column(children: [
                        Row(children: [

                          // Stack(
                          //   alignment:Alignment.centerRight,
                          //   children: [
                          //         Container(color:Colors.red,height:10,width:10),
                          // ],),

                          Container(
                            // color:Colors.red,
                            width: MediaQuery.of(context).size.width <= 240
                                ? 240
                                : MediaQuery.of(context).size.width,

                                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height<=maxHeight?maxHeight*2/100:MediaQuery.of(context).size.height*2/100),
                            // margin: EdgeInsets.only(
                            //     top: MediaQuery.of(context).size.height >= 348
                            //         ? 43
                            //         : MediaQuery.of(context).size.height <= 240
                            //             ? 30
                            //             : MediaQuery.of(context).size.height /
                            //                 8),


                            // margin: EdgeInsets.only(
                            //     top: MediaQuery.of(context).size.width >= 348
                            //         ? 43
                            //         : MediaQuery.of(context).size.width <= 240
                            //             ? 30
                            //             : MediaQuery.of(context).size.width /
                            //                 8),
                            child: Center(
                              child: 
                            //   Stack(
                            // alignment:Alignment.centerRight,
                            // children: [
                            //       Container(color:Colors.red,height:10,width:10),
                          // ],),
                              Column(children:[
                                Text("Sorting visualizer",
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
                                // Text("sdfghjk"),
                                Row(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children:[
                                Text("State wise population visualization of india",style: TextStyle(
                                      // color: Colors.green,
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width >=
                                              348
                                          ? 16
                                          : MediaQuery.of(context).size.width <=
                                                  240
                                              ? 10
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  24)),
                          InkWell(child:Icon(Icons.ads_click_outlined,color:Colors.green[900]),onTap:() async {
                            List lst;
                            setState((){
                              popTapped = 1;
                            });
                            try{
                              // print(state[-1]);
                              // print("hi");
                              lst =  await fetchApi();
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>PopPage(lst,lst)));
                            }catch(e){
                              setState((){
                                apiFetchError=1;
                                popTapped = 0;
                              });
                              errorControl();
                            }


                          }),
                                ]),


                    //       Container(
                    //     margin:EdgeInsets.only(top:maxHeight*2/100),
                    //     // margin:EdgeInsets.only(top:100),
                    //     child:Column(children:[
                    // if(apiFetchError==0)...[
                    //           Text("Api fetch error you are offline",style: TextStyle(
                    //                   color: Colors.red,
                    //                   fontSize: MediaQuery.of(context)
                    //                               .size
                    //                               .width >=
                    //                           348
                    //                       ? 16
                    //                       : MediaQuery.of(context).size.width <=
                    //                               240
                    //                           ? 10
                    //                           : MediaQuery.of(context)
                    //                                   .size
                    //                                   .width /
                    //                               24)),
                    // ],
                    //   ]),
                    // ),
                              
                        ]),

          



                            ),
                          ),
                        ]),
                        Column(children: [
                          Container(
                            // color:Colors.red,
                            // height: MediaQuery.of(context).size.height <= 498
                            //     ? 249/3
                            //     : MediaQuery.of(context).size.height/3,
                            height: MediaQuery.of(context).size.height <= maxHeight
                                ? maxHeight/4
                                : MediaQuery.of(context).size.height / 4,
                            // height: MediaQuery.of(context).size.height <= maxHeight
                            //     ? maxHeight/3-20
                            //     : MediaQuery.of(context).size.height / 3-20,
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Column(
                                    children: [
                                      Text("Number of elements to sort",style:TextStyle(color: Color.fromARGB(255, 173, 175, 76))),
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
                                  Column(
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
                      // color:Colors.red,
                      width: MediaQuery.of(context).size.width <= 240
                          ? 240
                          : MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height<=maxHeight?maxHeight/2:MediaQuery.of(context).size.height/2),
                      // height: 100,
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

                  ]),

                )),
      ),
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
    if (max >= minHeight * per) {
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
  // information1();
  @override
  Widget build(BuildContext context) {
    // initState(){
    // }
    // initState();
    return mainScreen(a);
  }
  // var screen2 = 0;
  Widget mainScreen(var a) {
      information1(){
        Future.delayed(const Duration(seconds:5),(){
            if(this.mounted){
              setState((){
                info1 = 0;
              });
            }
        });
      }
      if(screen2==0){
        information1();
        setState((){
          screen2 = 1;
        });
      }
    // information1();
    // information();
    // print(a);
    List resizedArr = List.filled(a.length, 0);
    for (i = 0; i < a.length; i++) {
      resizedArr[i] = a[i];
    }
    resizedArr = reSizer(resizedArr);

    return Scaffold(
      body:SafeArea(child:
          Stack(
            // fit: StackFit.expand, 
            alignment: Alignment.center, 
            
            children: [
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
                                    // Stack(children:[]),
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



                                                      // Container(
                                                      //   margin:
                                                      //       EdgeInsets.all(10),
                                                      //   width:MediaQuery.of(
                                                      //                     context)
                                                      //                 .size
                                                      //                 .width <=
                                                      //             240
                                                      //         ? 240 * 6 / 100
                                                      //         : MediaQuery.of(context)
                                                      //                     .size
                                                      //                     .width >=
                                                      //                 600
                                                      //             ? 600 *
                                                      //                 6 /
                                                      //                 100
                                                      //             : MediaQuery.of(
                                                      //                         context)
                                                      //                     .size
                                                      //                     .width *
                                                      //                 6 /
                                                      //                 100,
                                                      // ),




                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: GestureDetector(
                                                        child: Container(
                                                          // height:100,
                                                          // width:100,
                                                          child: 
                                                          MouseRegion(
                                                            cursor:SystemMouseCursors.click,
                                                            child:
                                                          Icon(
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
                                                        ),
                                                        onTap: () {
                                                          cancelled = true;
                                                          sortTap = 0;
                                                          hamburger = 0;
                                                          popTapped = 0;
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
                                                    Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        width:MediaQuery.of(
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
                                                      child: 
                                                      MouseRegion(
                                                        cursor:SystemMouseCursors.click,
                                                        child:
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Icon(
                                                          Icons.info_outline,
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
                                                      ),
                                                      onTap: (() async => {
                                                            // setState(() => {
                                                              await information1(),
                                                                  if (info1 == 0)
                                                                    {
                                                                      setState((){
                                                                        info1 = 1;
                                                                      }),
                                                                    }
                                                                  else
                                                                    {
                                                                      setState((){
                                                                        // info1 = 1;
                                                                        info1 = 0;
                                                                      }),
                                                                    }
                                                                // }),
                                                          }),
                                                    ),
                                                    GestureDetector(
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: 
                                                        MouseRegion(
                                                          cursor:SystemMouseCursors.click,
                                                          child: 
                                                        Icon(
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
                                                      ),
                                                      onTap: (() => {
                                                            setState(() => {
                                                                  if (hamburger == 0)
                                                                    {
                                                                      hamburger = 1,
                                                                    }
                                                                  else
                                                                    {
                                                                      hamburger = 0,
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
                                                      child: 
                                                      MouseRegion(
                                                        cursor:SystemMouseCursors.click,
                                                        child:
                                                      Container(
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
                                                      child: 
                                                      MouseRegion(
                                                        cursor:SystemMouseCursors.click,
                                                        child:
                                                      Container(
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
                                          return 
                                          MouseRegion(
                                            cursor:SystemMouseCursors.click,
                                            child:hamburgerOption(),
                                          );
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
                                        info1 = 0;
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
                        },


            
                      ]),
                    ),
                  ),
                ),
              ]),
            ),
            onTap: () {
              setState(() => {
                    hamburger = 0,
                    info1=0,
                  });
            }),
            if(info1==1)...[
                          // Row(
                          //   // alignment:Alignment.topCenter,
                          //   // mainAxisAlignment:MainAxisAlignment.center,
                          //   // crossAxisAlignment:CrossAxisAlignment.center,
                          //   children:[
            Center(child:
            Container(
                    // margin:EdgeInsets.only(top:MediaQuery.of(context).size.height<=maxHeight?maxHeight*50/100:0),
                    height:100,
                    width:250,
                    decoration:BoxDecoration(
                      color:Colors.black87,
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                    ),
                    child:Center(child:
                    // Column(
                    //   mainAxisAlignment:MainAxisAlignment.center,
                    //   children:[
                        Text("Visualize different sorting algorithms and its working",textAlign:TextAlign.center,style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <=
                                                                  240
                                                              ? 240 * 3 / 100
                                                              : MediaQuery.of(context)
                                                                          .size
                                                                          .width >=
                                                                      500
                                                                  ? 500 *
                                                                      3 /
                                                                      100
                                                                  : MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      3 /
                                                                      100,
                                                        )),
                    // ]),
                                                        ),
                  ),
            ),
                          // ]),
            ],
      ]),
      ),
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
    return 
    SafeArea(child:
    InkWell(
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
        }),
    );
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
        body: 
        SafeArea(child:
        ListView.builder(
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
                          margin: EdgeInsets.only(left: 2, top: 10),
                          child: 
                          MouseRegion(
                            cursor:SystemMouseCursors.click,
                            child:
                          Icon(
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
                        ),
                        onTap: () {
                          cancelled = true;
                          sortTap = 0;
                          hamburger = 0;
                          Navigator.pop(context);
                          Navigator.pop(context);
                          if(popTapped==0){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage2(a, b),
                                ));
                          }else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage2(a, b),
                                ));
                          }
                        },
                      ),
                    ]),
                  ]),
                )),
                ));
  }

  @override
  Widget build(BuildContext context) {
    return screen();
  }
}
