import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xd/myResultPage.dart';
import 'myLogic.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Gender{
  male,
  female,
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 180;
  int weight = 70;
  int age = 22;
  Gender selectedGender;

  static const IconData plus_circle = IconData(0xf055);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),

      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(

                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.male;
                          print('its male');
                        });
                      },
                      child: Container(
                        child: Image.asset('assets/male.png',
                            fit: BoxFit.contain),

                        color: Colors.blueAccent,
                        margin: EdgeInsets.all(15.0),
                      ),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.female;
                          print('its female');
                        });
                      },
                      child: Container(
                        child: Image.asset('assets/female.png',
                        fit: BoxFit.contain),

                        color: Colors.lightGreen,
                        margin: EdgeInsets.all(15.0),
                      ),
                    ),
                  )

                ],)),


          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.brown,
                child: Text(
                  'Wzrost',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    height.toString(),
                    style: TextStyle(fontSize: 40.0),
                  ),
                  Text(
                    'cm',
                    style: TextStyle(fontSize: 30.0),
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(),
                child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        //print(newValue.round().runtimeType);
                        height = newValue.round();
                      });

                    }
                ),
              )
            ],
          )),

          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all((Radius.circular(10.0)))
                    ),


                    child: Column(
                      children: <Widget>[
                        Text('Waga',
                            style: TextStyle(fontSize: 35.0)),

                        Text(weight.toString(),
                            style: TextStyle(fontSize: 35.0)),

                        Row(
                          children: <Widget>[
                           Container(
                             child:  new FloatingActionButton(
                               heroTag: "we-",
                               child: Text('-', style:
                               TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0)),
                               onPressed: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                               backgroundColor: Colors.blue,
                             ),
                           ),

                            SizedBox(width: 10.0),

                            Container(
                              child: new FloatingActionButton(
                                heroTag: "we+",
                                child: Text('+', style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0)),
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: Colors.blue,
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),

                  SizedBox(width: 25.0),


                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Column(

                      children: <Widget>[

                        Text('Wiek',
                          style: TextStyle(fontSize: 35.0),
                        ),

                        Text(age.toString(),
                          style: TextStyle(fontSize: 35.0),
                        ),

                        Row(
                          children: <Widget>[
                            Container(
                              child: new FloatingActionButton(
                                heroTag: "ag-",
                                child: Text('-', style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0)),
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                backgroundColor: Colors.green,
                              ),
                            ),

                            SizedBox(width: 10.0),

                            Container(
                              child: new FloatingActionButton(
                                heroTag: "ag+",
                                child: Text('+', style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0)),
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),





                      ],
                    ),
                  ),

                ],
              )),

          SizedBox(height: 20.0),

          RaisedButton(

            onPressed: (){
              Calculate result = Calculate(weight, height);
              print('Co jest');
              Navigator.push(context,
              MaterialPageRoute(

                builder: (context) => ResultPage(
                  bmi: result.calculateBMI(),
                  outcome: result.getOutcome(),
                  desc: result.getDesc(),
                )
              ));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blueAccent)
            ),


             child: Text('Oblicz',
             style: TextStyle(fontSize: 35.0)),

          ),

          SizedBox(height: 20.0)

        ],),


    );
  }
}
