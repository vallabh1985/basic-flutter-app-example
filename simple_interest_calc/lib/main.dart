import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Interest calc",
    home: interestForm(),
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.tealAccent,
      accentColor: Colors.tealAccent,
    ),
  ));
}

class interestForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _incCalc();
  }
}

class _incCalc extends State<interestForm> {

  var _formKey= GlobalKey<FormState>();

  TextEditingController principalController = TextEditingController();
  TextEditingController roi = TextEditingController();
  TextEditingController year = TextEditingController();

  var _dispalyResult="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Simple Interest Calculator")),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Image(
                  image: AssetImage('images/Simple-Interest-Formula.png'),
                ),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: principalController,
                      validator: (String val){
                        if(val==""){
                          return "This field is required.";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Principal Amount",
                          hintText: "Enter amount",
                          errorStyle: TextStyle(fontSize: 14.0),
                      ),

                    )),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: roi,
                      validator: (String val){
                        if(val==""){
                          return "This field is required.";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Rate of Interest",
                          hintText: "Rate of Interest",
                        errorStyle: TextStyle(fontSize: 14.0),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: year,
                      validator: (String val){
                        if(val==""){
                          return "This field is required.";
                        }
                      },
                      decoration:
                          InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Term", hintText: "Term",
                              errorStyle: TextStyle(fontSize: 14.0),
                          ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed:(){
                        setState(() {
                          if(_formKey.currentState.validate()){
                            this._dispalyResult = _calculate();
                          }
                        });
                      },
                      child: Text("Calculate",textScaleFactor: 1.5,),
                    ),
                    Container(width: 20.0,),
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          this._dispalyResult = _resetform();
                        });
                      },
                      child: Text("Reset",textScaleFactor: 1.5,),
                    )
                  ],
                ),
                Text("$_dispalyResult"),
              ],
            ),
          ),
        ));
  }

  String _calculate() {
    double p = double.parse(principalController.text);
    double r = double.parse(roi.text);
    double n = double.parse(year.text);
    double totalAmount = p + (p * r * n) / 100;

    return "Total Amount will be $totalAmount";
  }

  String _resetform(){
    principalController.text="";
    roi.text="";
    year.text="";

    return "";
  }


}

