

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondPage extends StatelessWidget {
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
  TextEditingController _ctrlFahrenheit = TextEditingController();
  var msgResult = "Celsius:";
  void calcular() {
    double _fahrenheit = double.tryParse(_ctrlFahrenheit.text);
    if (_fahrenheit == null) {
      setState(() {
        msgResult = "digite graus em Fahrenheit";
      });
    } else {

      var celsius = (_fahrenheit - 32) / 1.8;
      var arredondar = celsius.toStringAsFixed(4);

      setState(() {
        msgResult = "A temperatura em Celsius é: $arredondar Graus";
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      });
    }
  }

  void novo() {
    setState(() {
      _ctrlFahrenheit.text = " ";
      msgResult = "Celsius";
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
            controller: _ctrlFahrenheit,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Graus Fahrenheit"),
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
        ],
      ),
    );
  }
}


