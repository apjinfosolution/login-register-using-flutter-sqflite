import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  String msg;
  String url;
  String base64Image;
  String number = '';
  @override
  void initState() {
    super.initState();
    (() async {
      http.Response response = await http.get(
        'https://flutter.io/images/flutter-mark-square-100.png',
      );
      if (mounted) {
        setState(() {
          base64Image = base64.encode(response.bodyBytes);
        });
      }
    })();
  }

  _onChanged(value){
    setState(() {
      number = value;
    });
  }

  void add_number(){
    AlertDialog dialog = new AlertDialog(
      content: new Text("Enter Number",
        style: new TextStyle(fontSize: 20.0,color:Colors.red),),
      actions: <Widget>[
        new TextField(onChanged: (value){_onChanged(value);},)
      ],
    );

    showDialog(context: context,child: dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Image.memory(
//              base64.decode(base64Image.split(',')[1]),
//              height: 312,
//              width: 175.3,
//              fit: BoxFit.fill,
//              gaplessPlayback: true,
//            ),
            MaterialButton(child: new Text("Press here"),onPressed: (){
              add_number();},),
          ],
        ),
      ),
    );
  }
}
