import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myHomePage.dart';

class ResultPage extends StatelessWidget{
  final String bmi;
  final String outcome;
  final String desc;

  ResultPage({
    this.bmi,
    this.outcome,
    this.desc
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[

          Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(bmi,
                style: TextStyle(
                    fontSize: 80.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                ),),
              )),

         Expanded(
           child: Container(
             padding: EdgeInsets.all(20.0),
             alignment: Alignment.center,
             child: Text(
               outcome,
               style: TextStyle(
                 fontSize: 30.0,
             ),),
           ),

         ),

         Expanded(
           child: Container(
             child: Text(
               desc,
               style: TextStyle(
                   fontSize: 20.0
             ),
             textAlign: TextAlign.center,),
           ),

         ),

         GestureDetector(
           onTap: (){
             Navigator.pop(context);
           },
           child: Container(
             padding: EdgeInsets.all(16.0),
            width: 250,
             decoration: BoxDecoration(
                 color: Colors.blue,
                 borderRadius: BorderRadius.all(Radius.circular(20))
             ),

               child: Text(
                 'Oblicz ponownie',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 26.0,
                   fontWeight: FontWeight.bold,
                 ),

               ),


           )
             ),
          SizedBox(
            height: 20.0,
          )

        ],
      ),
    );
  }

}