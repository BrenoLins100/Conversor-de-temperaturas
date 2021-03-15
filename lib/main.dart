

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'celsius.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Conversor de temperatura",
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2196f3),
          accentColor: const Color(0xFF2196f3),
          canvasColor: const Color(0xFFfafafa),
          fontFamily: 'Poppins',
        ),
        //instanciando classe HomePage
        home:new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(
       title: Text("Conversor de temperatura"),
       centerTitle: true,
     ), 
     body: Conversor(),
    );
  }
}



class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  TextEditingController _ctrlCelsius = TextEditingController();
  var msgResult = "Fahrenheit:";
  void calcular() {
    double _celsius = double.tryParse(_ctrlCelsius.text);
    if (_celsius == null) {
      setState(() {
        msgResult = "digite graus em Celsius";
      });
    } else {
      var fahrenheit = (9 / 5) * _celsius + 32;
      setState(() {
        msgResult = "A temperatura em Fahrenheit é: $fahrenheit Graus";
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        //import 'package:flutter/services.dart';
      });
    }
  }

  void novo() {
    setState(() {
      _ctrlCelsius.text = " ";
      msgResult = "Fahrenheit:";
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(
            //"Conversor de temperatura",
            msgResult,
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.red,
              ),
            textAlign: TextAlign.center,
            ),

          TextField(
            controller: _ctrlCelsius,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Graus Celsius"),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),

            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                    onPressed: () {
                      calcular();
                    },
                    color: Colors.blueAccent,
                    child: new Text(
                      "Calcular",
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                    onPressed: () {
                      novo();
                    },
                    color: Colors.blueAccent,
                    child: new Text(
                      "Novo",
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                  margin: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SecondPage()));
                    },
                    color: Colors.green,
                    child: new Text(
                      "Fahrenheit para Celsius ",
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}


