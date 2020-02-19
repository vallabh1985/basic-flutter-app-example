import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Display Your Name",
    home: displayName(),
    debugShowCheckedModeBanner: false,
  ));
}

class displayName extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _displayName();
  }
}

class _displayName extends State<displayName> {
  String name = "User";
  var _menulist = ['Bannana', 'Orange', 'Grapes', 'Other'];
  var _defaultname = 'Bannana';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Using User Input:"),
      ),
      body: Container(
          child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: "Enter your name"),
          onChanged: (String userName) {
            setState(() {
              name = userName;
            });
          },
        ),
        Container(
            child: Text(
          "Hello $name",
          style: TextStyle(fontSize: 40.0),
        )),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Select Item from Dropdown",
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                ),
                DropdownButton<String>(
                  items: _menulist.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String NewValue) {
                    setState(() {
                      this._defaultname = NewValue;
                    });
                  },
                  value: _defaultname,
                ),
              ],
            ),
            Container(
                child: Text(
              "You had selected $_defaultname",
              style: TextStyle(fontSize: 30.0),
            )),
          ],
        ),
      ])),
    );
  }
}
