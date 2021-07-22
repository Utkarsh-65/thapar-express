import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget{
  Widget button({
    required String name,
    required Color color,
    required Color textColor,
  }){
    return Container(
      height:45,
      width:300,
      child: RaisedButton(
          color: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(color:Colors.green,width: 2),
              borderRadius: BorderRadius.circular(30)),
          onPressed: () {},
          child: Text(
            name,
            style:TextStyle(color: textColor),
          ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children:[
          Expanded(child: Container(
            child: Center(
              child:Image.asset('images/logo.jpg'),
            ),
          ),
          ),
          Expanded(
            child: Container(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Text("Welcomes You", style: TextStyle(fontSize: 30,
                   fontWeight: FontWeight.bold,
                   color: Colors.green,
                 ),
                 ),
                 Column(
                   children: [
                     Text("Just order and chill"),
                   ],
                 ),
               button(
                 name:'Login',
                 color: Colors.green,
                 textColor: Colors.white,
               ),
                 button(
                   name:'Signup',
                   color:Colors.white,
                   textColor: Colors.green,
                 ),
               ],
             ),
            ),
          ),
        ],
      ),
    );
  }
}