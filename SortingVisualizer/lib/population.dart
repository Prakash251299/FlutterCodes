import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:http/http.dart' as http;
// import 'dart:html';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart';
// import '../api/apis.dart';
// import 'package:universal_io/io.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'https://data.covid19india.org/csv/latest/states.csv';
// import 'https://github.com/covid19india/api/blob/master/src/states_daily_to_csv.js';
// import 'https://data.covid19india.org/v4/min/data.min.json';
import './main.dart';
// import 'home_screen.dart';
// import 'apis.dart';
int barColor1 = -1, barColor2 = -1;
var _value = 75.0;
var cancelled = false;
var resetter = 0;
var sortTap = 0;
var hamburger = 0;
var barPosition = 0;
var n = 10;
var info=1;
var sortingMethods = [
  "Selection sort",
  "Insertion sort",
  "Bubble sort",
  "Quick sort",
  // "Merge sort",
];
var selectedSortingMethod = 0;
var cross = CrossAxisAlignment.end;

class PopPage extends StatefulWidget {
  List<int> a = List.filled(n, 1);
  List<int> originalArr;
  PopPage(lst1,lst2):a=lst1??[],originalArr=lst2??[];

  // final String title;
  @override
  State<PopPage> createState() => CovidScreen(a,originalArr);
}

class CovidScreen extends State<PopPage> {
  // fetchApi();
  final List<int> a;
  final List<int> originalArr;
  // List<int> a = List.filled(n, 1);
  // List<int> originalArr = List.filled(n, 1);
  CovidScreen(b, c)
      : this.a = b ?? [],
        this.originalArr = c ?? [];

  int _counter = 0;
  int i = 0, j = 0;
  int popUpForBar = 0;

  barInfo(){
    Future.delayed(const Duration(seconds:3),(){
      if(this.mounted){
          setState((){
            // info1=0;
            info = 0;
          });
        }
    });
  }

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
      var obj;
      if (i <= j) {
        if (this.mounted) {
          setState(() => {
                objtemp = listtobesort[i],
                listtobesort[i] = listtobesort[j],
                listtobesort[j] = objtemp,
                obj = state[i],
                state[i] = state[j],
                state[j] = obj,
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
      var t;
      for (var j = 0; j < n - i - 1; j++) {
        if (L[j] > L[j + 1]) {
          if (this.mounted) {
            setState(() => {
                  temp = L[j],
                  L[j] = L[j + 1],
                  L[j + 1] = temp,
                  t = state[j],
                  state[j] = state[j+1],
                  state[j+1] = t,
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
      var vm = state[j];

      int i = j - 1;

      while (i >= 0 && list[i] > key) {
        if (this.mounted) {
          setState(() => {
                list[i + 1] = list[i],
                state[i+1] = state[i],
                i = i - 1,
                list[i + 1] = key,
                state[i+1] = vm,
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
      var t1;
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
                t1 = state[index_min],
                state[index_min] = state[i],
                state[i] = t1,
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

  var hoverCont = 0;
  var hoverText = "";
  var selector = 0;
  var hoverPop = 0;

  Widget rectangleCreator(double val, var arr, var i) {
    return 
    InkWell(child:
    Container(
      // color:Colors.white,
      alignment: Alignment.center,
      child: new Stack(
        children: [

          // InkWell(child:
          // if(hoverCont==1)...[
          //   // Stack(children: [
          //   Container(
          //     color:Colors.red,
          //     height:i==selector?50:0,
          //     width:i==selector?50:0,
          //     child: Text("Hi"),
          //   ),],

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
        // ]),
            
          //   onHover: (val){print(val);},
          // ),
        ],
      ),
    ),
    onTap:(){
      setState((){
        hoverCont = 1;
        hoverText = state[i];
        selector = i;
        hoverPop = resp[state[selector]];
      });
      // print(i);
    },
    
      onHover: (val){
        if(val==true){
          setState((){
            hoverCont = 1;
            hoverText = state[i];
            selector = i;
            hoverPop = resp[state[selector]];
          });
          // print(i);
        }else{
          setState((){
            hoverCont = 0;
            hoverText = "";
          });
            // print(i);
          // hoverCont = 0;
        }
      },
    );
  }


  @override
  Widget build(BuildContext context){
    if(popUpForBar==0){
      setState((){
        popUpForBar = 1;
      });
      barInfo();
    }
    // return Container();
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
      SafeArea(child:
          Stack(
            // fit: StackFit.expand, 
            alignment: Alignment.center, 
            children: [
              // Container(
              //   color:Colors.green,
              //   height:100,
              //   width: 100,
              //   margin: EdgeInsets.only(top:60),
              //   child:
              // Column(
              //   children:[
              //     Text("hjhk"),
              //   ]
              // ),
              // ),
        GestureDetector(
            child: Container(
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Stack(
                        alignment: Alignment.topRight, 
                        // alignment: Alignment.center,
                        children: [
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
                                                        child: 
                                                        MouseRegion(
                                                        cursor:SystemMouseCursors.click,
                                                        child:
                                                        Container(
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
                                                        "Population of states",
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
                                                            await barInfo(),
                                                            setState(() => {
                                                                  if (info ==
                                                                      0)
                                                                    {
                                                                      info =
                                                                          1,
                                                                    }
                                                                  else
                                                                    {
                                                                      info =
                                                                          0,
                                                                    }
                                                                }),
                                                          }),
                                                    ),
                                                    // Spacer(flex: 1),
                                                    GestureDetector(
                                                      child: 
                                                      MouseRegion(
                                                        cursor:SystemMouseCursors.click,
                                                        child:
                                                      Container(
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
                                        new Stack(
                                          alignment:Alignment.center,
                                          children: [
                                          // if(hoverCont==1)...[
                                          //   // Stack(children: [
                                          //   Container(
                                          //     color:Colors.red,
                                          //     height:i==selector?50:0,
                                          //     width:i==selector?50:0,
                                          //     child: Text("Hi"),
                                          //   ),
                                          //   ],
                                          // Text("kahsd"),
                                          // InkWell(child:
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

                                          if(hoverCont==1)...[
                                            // Stack(children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:Colors.green,
                                                // border: radius.hashCode.all(10),
                                                borderRadius:BorderRadius.all(Radius.circular(10)),
                                                // color: ,
                                              ),
                                              // height:i==selector?50:0,
                                              // width:i==selector?50:0,
                                              // margin:EdgeInsets.only(left:selector.toDouble()*10,),
                                              margin:EdgeInsets.only(bottom:100),
                                              height:50,
                                              width:70,
                                              child: Center(
                                                child:Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                  Text(hoverText,style:TextStyle(fontSize: 10)),
                                                  Text(hoverPop.toString(),style:TextStyle(fontSize: 10)),
                                                ]),
                                              )
                                            ),
                                            ],
                                          
                                          // onHover:(val){print(val);}
                                          // ),
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
                                                  InkWell(
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
                                                        // setState((){
                                                          a.shuffle();
                                                        // print(a);
                                                        // });
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                // CovidPage(a,originalArr),
                                                                PopPage(a,a),
                                                                  // MyHomePage2(a,originalArr),
                                                                      // Path for reset
                                                            ));
                                                      },
                                                      // onHover:(val){print(val);}
                                                      ),
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
                                          return hamburgerOption();
                                        }),
                                  ),
                                  GestureDetector(
                                      child: 
                                      MouseRegion(
                                                        cursor:SystemMouseCursors.click,
                                                        child:
                                      Container(
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
                                      ),
                                      onTap: () {
                                        hamburger = 0;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                // mainScreen(a),
                                                  MyHomepage3(a, originalArr),
                                            ));
                                        //
                                      }),
                                ]),
                          ),
                        },


                //         Row(
                // mainAxisAlignment:MainAxisAlignment.center,
                // children:[
                //   Column(
                //     mainAxisAlignment:MainAxisAlignment.center,
                    
                //     children:[
                  // Center(child:



                  // if(info==1)...[
                  // Container(
                  //   margin:EdgeInsets.only(top:MediaQuery.of(context).size.height<=maxHeight?maxHeight/2:MediaQuery.of(context).size.height/2,right:MediaQuery.of(context).size.width<=300?300/2:MediaQuery.of(context).size.width/2,),
                  //   height:100,
                  //   width:250,
                  //   decoration:BoxDecoration(
                  //     // color:Colors.red,
                  //     borderRadius:BorderRadius.all(Radius.circular(10)),
                  //   ),
                  //   child:Center(child:Text("Tap on the bar for info",style: TextStyle(
                  //                                         color: Colors.white,
                  //                                         fontSize: MediaQuery.of(
                  //                                                         context)
                  //                                                     .size
                  //                                                     .width <=
                  //                                                 240
                  //                                             ? 240 * 5 / 100
                  //                                             : MediaQuery.of(context)
                  //                                                         .size
                  //                                                         .width >=
                  //                                                     500
                  //                                                 ? 500 *
                  //                                                     5 /
                  //                                                     100
                  //                                                 : MediaQuery.of(
                  //                                                             context)
                  //                                                         .size
                  //                                                         .width *
                  //                                                     5 /
                  //                                                     100,
                  //                                       )),),
                  // ),
                  // ],
                  // ),
                  // ]),
                  // Row(children: [
                  //   Text("hjhk",style:TextStyle(color:Colors.yellow)),
                  // ],)
                // ]
              // ),



                      ]),
                    ),
                  ),
                ),
              ]),
            ),
            onTap: () {
              setState(() => {
                    hamburger = 0,
                    hoverCont = 0,
                    info = 0,
                  });
            }),
            if(info==1)...[
                  Container(
                    // margin:EdgeInsets.only(top:MediaQuery.of(context).size.height<=maxHeight?maxHeight/2:MediaQuery.of(context).size.height/2,right:MediaQuery.of(context).size.width<=300?300/2:MediaQuery.of(context).size.width/2,),
                    height:100,
                    width:250,
                    decoration:BoxDecoration(
                      // color:Colors.red,
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                    ),
                    child:Center(child:Text("Tap on the bar for info",style: TextStyle(
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
                                                        )),),
                  ),
                  ],
            // Container(
            //     color:Colors.green,
            //     // height:100,
            //     // width: 100,
            //     margin: EdgeInsets.only(top:60),
            //     child:


              // Column(
              //   mainAxisAlignment:MainAxisAlignment.center,
              //   children:[
              //     Center(child:Container(
              //       // height:10,
              //       // width:10,
              //       color:Colors.red,
              //       child:Text("asjdkj"),
              //     ),),
              //     // Row(children: [
              //     //   Text("hjhk",style:TextStyle(color:Colors.yellow)),
              //     // ],)
              //   ]
              // ),


              // ),
      ]),
      ),
    );
  }
}