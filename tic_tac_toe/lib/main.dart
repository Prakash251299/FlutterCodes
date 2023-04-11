import 'package:flutter/material.dart';
void main(){
  runApp(
    new MaterialApp(
      home: MyApp(),
  ));
}

var player1='',player2='',_textController = TextEditingController(),_textController1 = TextEditingController();
var name = 'Default: player1 = John, Player2 = Roman';
class MyApp extends StatefulWidget{
  State createState()=>MyAppState();
}

class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.grey[600],
      body: Center(
        child: 
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Column(children:[Text(name,style: TextStyle(color:Colors.yellow),)]),
                TextField(
                  controller: _textController,
                  style:TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Name of Player 1',
                    hintStyle: TextStyle(color:Colors.white),
                  ),
                ),
                TextField(
                  controller: _textController1,
                  style: TextStyle(color:Colors.white),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Name of Player 1',
                    hintStyle: TextStyle(color:Colors.white),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Start'),
                  onPressed: (){ Navigator.of(context).push(MaterialPageRoute(
                  builder:(context)=>screen1(),),);
                    setState(() {
                      player1 = _textController.text;
                      player2 = _textController1.text;
                      if(player1==''){
                        player1 = 'John';
                      }
                      if(player2==''){
                        player2 = 'Roman';
                      }
                  });
                }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class screen1 extends StatefulWidget{
  State createState() => screen1State();
}

class screen1State extends State<screen1>{
  var a = '';
  var myText = ['','','','','','','','',''],Message = '';
  var cont = '',fill = [10,10,10,10,10,10,10,10,10], count = 0;
  restart(){
    setState(() {
      Message='';
      cont = '';
      for(var j = 0;j<9;j++){
        myText[j] = '';
        fill[j] = 10;
      }
      a = '';
      count = 0;
    });
  }
  _changeText(i){
    setState((){
      if(Message == ''){
        if(myText[i]==''){
          if(cont!=''){
            if(cont=='o'){
              cont = 'x';
              myText[i] = cont;
            }
            else{
              cont = 'o';
              myText[i] = cont;
            }
          }
          else{
            cont = 'o';
            myText[i] = cont;
          }
          if(myText[0]=='o' && myText[1] == 'o' && myText[2] == 'o'){
            Message = player1 +' wins';
            fill[0] = 0;
            fill[1] = 1;
            fill[2] = 2;
          }
          if(myText[0]=='o' && myText[3] == 'o' && myText[6] == 'o'){
            Message = player1 +' wins';
            fill[0] = 0;
            fill[3] = 3;
            fill[6] = 6;
          }
          if(myText[4]=='o' && myText[3] == 'o' && myText[5] == 'o'){
            Message = player1 +' wins';
            fill[4] = 4;
            fill[3] = 3;
            fill[5] = 5;
          }
          if(myText[4]=='o' && myText[1] == 'o' && myText[7] == 'o'){
            Message = player1 +' wins';
            fill[4] = 4;
            fill[1] = 1;
            fill[7] = 7;
          }
          if(myText[8]=='o' && myText[6] == 'o' && myText[7] == 'o'){
            Message = player1 +' wins';
            fill[8] = 8;
            fill[6] = 6;
            fill[7] = 7;
          }
          if(myText[8]=='o' && myText[2] == 'o' && myText[5] == 'o'){
            Message = player1 +' wins';
            fill[8] = 8;
            fill[5] = 5;
            fill[2] = 2;
          }
          if(myText[4]=='o' && myText[2] == 'o' && myText[6] == 'o'){
            Message = player1 +' wins';
            fill[4] = 4;
            fill[6] = 6;
            fill[2] = 2;
          }
          if(myText[4]=='o' && myText[0] == 'o' && myText[8] == 'o'){
            Message = player1 +' wins';
            fill[0] = 0;
            fill[4] = 4;
            fill[8] = 8;
          }
          if(myText[0]=='x' && myText[1] == 'x' && myText[2] == 'x'){
            Message = player2 +' wins';
            fill[0] = 0;
            fill[1] = 1;
            fill[2] = 2;
          }
          if(myText[0]=='x' && myText[3] == 'x' && myText[6] == 'x'){
            Message = player2 +' wins';
            fill[0] = 0;
            fill[3] = 3;
            fill[6] = 6;
          }
          if(myText[4]=='x' && myText[1] == 'x' && myText[7] == 'x'){
            Message = player2 +' wins';
            fill[4] = 4;
            fill[1] = 1;
            fill[7] = 7;
          }
          if(myText[4]=='x' && myText[3] == 'x' && myText[5] == 'x'){
            Message = player2 +' wins';
            fill[4] = 4;
            fill[5] = 5;
            fill[3] = 3;
          }
          if(myText[8]=='x' && myText[6] == 'x' && myText[7] == 'x'){
            Message = player2 +' wins';
            fill[6] = 6;
            fill[7] = 7;
            fill[8] = 8;
          }
          if(myText[8]=='x' && myText[2] == 'x' && myText[5] == 'x'){
            Message = player2 +' wins';
            fill[8] = 8;
            fill[5] = 5;
            fill[2] = 2;
          }
          if(myText[4]=='x' && myText[0] == 'x' && myText[8] == 'x'){
            Message = player2 +' wins';
            fill[0] = 0;
            fill[4] = 4;
            fill[8] = 8;
          }
          if(myText[4]=='x' && myText[2] == 'x' && myText[6] == 'x'){
            Message = player2 +' wins';
            fill[4] = 4;
            fill[6] = 6;
            fill[2] = 2;
          }
          count = 0;
          for(var j=0;j<9;j++){
            if(myText[j]!=''){
              count++;
            }
          }
          if(count==9 && Message==''){
            Message = 'Tied';
          }
        }
      }
      // }
    });
  }
  _button(int i){
    return InkWell(
      child: Container(
        color:Colors.grey,
        height: MediaQuery.of(context).size.height*20/100,
        width: MediaQuery.of(context).size.width*20/100,
        child:Text(myText[i]),
      ),
      onTap:(){
        print(i);
      }
    );
    // ButtonTheme(
    //   height: 80,
    //   minWidth: 80,
    //   child: ElevatedButton(
    //     child: Text(myText[i]),
    //     // style: ButtonStyle(
    //     //   overlayColor: MaterialStateProperty.all<Color>(Colors.white)),
    //     //   // onHover: Message==''?(i==fill[i]?Colors.green:(myText[i]==''? Colors.deepPurple:Colors.red)):(i==fill[i]?Colors.green:Colors.red),
    //     // )
    //     // splashColor: Colors.white,
    //     // hoverColor: Message==''?(i==fill[i]?Colors.green:(myText[i]==''? Colors.deepPurple:Colors.red)):(i==fill[i]?Colors.green:Colors.red),
    //     onPressed: ()=> {_changeText(i),},
    //     // color: Message!=''?(i==fill[i]?Colors.green:Colors.red):(myText[i]==''? Colors.blue:Colors.red),
    //   ),
    // );
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.green[500],
      //   title: Text("Tic Tack Toe"),
      // ),
      // backgroundColor: Colors.brown[400],
      body: 
      new Container(
        margin:EdgeInsets.all(MediaQuery.of(context).size.width*3/100),
        child:
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children:[ 
          new Row(
              children:[new Text(Message,style: TextStyle(color: Colors.teal,fontSize: 50),)],
                mainAxisAlignment:MainAxisAlignment.center,
              ),
          new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
          _button(0),
          _button(1),
          _button(2),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
          _button(3),
          _button(4),
          _button(5),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
          _button(6),
          _button(7),
          _button(8),
          ],
        ),
        Padding(padding: EdgeInsets.only(top:10)),
        
    ButtonTheme(
      child: ElevatedButton(
        child: Text("Restart",style: TextStyle(color: Colors.white),),
        // splashColor: Colors.white,
        onPressed: ()=> {restart()},
        // color: Colors.red,
      ),
    ),
    ButtonTheme(
      child: ElevatedButton(
        child: Text("Go to first page",style: TextStyle(color: Colors.white),),
        // splashColor: Colors.white,
        onPressed: ()=> {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()))},
        // color: Colors.red,
      ),
    ),
        ]
      ),
      ),
    );
  }
}