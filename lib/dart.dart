import 'package:flutter/material.dart';
import 'dart:math';

class BMIApp extends StatefulWidget {
  @override
  _BMIAppState createState() => _BMIAppState();
}



class _BMIAppState extends State<BMIApp> {

  final TextEditingController _w=new TextEditingController();
  final TextEditingController _h=new TextEditingController();


  double bmiNumber=0.0;
  String over="";
  double cal(String w,String h){
    setState(() {
      bmiNumber=double.parse(w)/pow(double.parse(h), 2);
      over=bmiNumber>25?"Overweight":"Normal";

    });
    return bmiNumber;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          "BMI",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.shade200,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: ListView(

                children: <Widget>[
                Image.asset(
                  "images/bmilogo.png",
                  width: 90,
                  height: 90,
                  alignment: Alignment.center,
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Age",
                            icon: Icon(Icons.person_outline)),
                      ),
                      TextField(
                        controller: _h,
                        decoration: InputDecoration(
                            labelText: "Height in meters",
                            icon: Icon(Icons.assessment)),

                      ),
                      TextField(
                        controller: _w,
                        decoration: InputDecoration(
                            labelText: "Weight in Kgs",
                            icon: Icon(Icons.line_weight)),
                      ),
                      RaisedButton(
                          padding: EdgeInsets.all(10),
                          color: Colors.pinkAccent,
                          child: Text("Calculate",
                              style: TextStyle(color: Colors.white)),
                          onPressed: ()=>cal(_w.text, _h.text),
                      ),
                    ],
                  ),
                ),
                Text("Your BMI: ${bmiNumber.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                        height: 1.5)),
                Text(
                  "$over",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.pinkAccent,
                      height: 1.5,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
      ),
    );
  }
}
