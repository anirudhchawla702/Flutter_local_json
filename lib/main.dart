import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(
          child: new Text(
            "Load JSON App",
          ),
        ),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder<String>(
            future: DefaultAssetBundle.of(context).loadString(
              'load_json/person.json',
            ),
            builder: (context, snapshot) {
              //decoding json file
              var myData = json.decode(
                snapshot.data.toString(),
              );
              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        new Text("Name: " + myData[index]["name"]),
                        new Text("Age: " + myData[index]["age"]),
                        new Text("Height: " + myData[index]["height"]),
                        new Text("Color: " + myData[index]["hair_color"]),
                        new Text("Gender: " + myData[index]["gender"]),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
