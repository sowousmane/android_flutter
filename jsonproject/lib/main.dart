import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Flutter Demo JSON API'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'http://www.omdbapi.com/?apikey=a1727543&i=tt3896198';
  late Map<String, dynamic> film;
  bool dataOK = false;

  @override
  void initState() {
    recupFilm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: dataOK ? affichage() : attente(),
      backgroundColor: Colors.blueGrey[900],
    );
  }

  Future<void> recupFilm() async {
    var response = await http.get(Uri.parse(url)) ;
    if (response.statusCode == 200) {
      film = convert.jsonDecode(response.body);
      setState(() {
        dataOK = !dataOK;
      });
    }
  }

  Widget attente() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('En attente des données',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget affichage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          film != null
              ? Text(
            '${film['Title']}',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          )
              : Text('Aucune donnée'),
          film != null
              ? Text(
            '${film['Year']}',
            style: TextStyle(color: Colors.white),
          )
              : Text('Aucune donnée'),
          Padding(padding: EdgeInsets.all(15.0)),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 7.0),
                  spreadRadius: 3.0,
                  blurRadius: 15.0)
            ]),
            child: film != null
                ? Image.network('${film['Poster']}')
                : Text('Aucune donnée'),
          ),
          Padding(padding: EdgeInsets.all(15.0)),
          film != null
              ? Text(
            '${film['Plot']}',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          )
              : Text('Aucune donnée'),
        ],
      ),
    );
  }
}
