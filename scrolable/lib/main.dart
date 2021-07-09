

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //SystemChrome.setPreferredOrientations([
    //DeviceOrientation.portraitUp,
    //DeviceOrientation.landscapeLeft,
    //DeviceOrientation.landscapeRight,
  //]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'scrolable'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Activity> mesActivites = [
    new Activity("velo", Icons.directions_bike),
    new Activity("peinture", Icons.palette),
    new Activity("Golf", Icons.golf_course),
    new Activity("Arcade", Icons.gamepad),
    new Activity("Bricolage", Icons.build),
    new Activity("velo", Icons.directions_bike),
    new Activity("peinture", Icons.palette),
    new Activity("Golf", Icons.golf_course),
    new Activity("Arcade", Icons.gamepad),
    new Activity("Bricolage", Icons.build),
    new Activity("velo", Icons.directions_bike),
    new Activity("peinture", Icons.palette),
    new Activity("Golf", Icons.golf_course),
    new Activity("Arcade", Icons.gamepad),
    new Activity("Bricolage", Icons.build),
    new Activity("velo", Icons.directions_bike),
    new Activity("peinture", Icons.palette),
    new Activity("Golf", Icons.golf_course),
    new Activity("Arcade", Icons.gamepad),
    new Activity("Bricolage", Icons.build),



  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation);
    return Scaffold(
      appBar: AppBar(
      title: Text("Scrolable"),
      centerTitle: true,
      backgroundColor: Colors.pinkAccent,
    ),
      body:new  Center(
        child: new GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: mesActivites.length,
            itemBuilder: (context, i){
              return Container(
                margin: EdgeInsets.all(7.5),
                child: new Card(
                  elevation: 10.0,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new Text('Activité:', style: new TextStyle(color: Colors.teal, fontSize: 15.0)),
                      new Icon(mesActivites[i].icone, color: Colors.teal, size: 40.0,),
                      new Text(mesActivites[i].nom, style: new TextStyle(color: Colors.teal, fontSize: 22.0, fontStyle: FontStyle.italic),)
                    ],
                  ),
                ),
              );
            }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget liste(){
    return ListView.builder(
        itemCount: mesActivites.length,
        itemBuilder: (context, i){
          Activity activite = mesActivites[i];
          String key = activite.nom;
          return new Dismissible(
              key: new Key(key),
              child: new Container(
                padding: EdgeInsets.all(5.0),

                child: new Card(
                  elevation: 7.5,
                  child: new InkWell(
                    onTap: (()=>print("trapped")),
                    onLongPress: (()=> print("c'est un looong")),
                    child: new Container(
                      height: 100,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          new Icon(activite.icone, color: Colors.teal, size: 75.0,),
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Text('activité:', style: new TextStyle(color:  Colors.teal, fontSize: 28),),
                              new Text(activite.nom, style: new TextStyle(color:  Colors.teal[700], fontSize: 30),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ),
              background : new Container(
                padding: EdgeInsets.only(right: 20.0),
                color: Colors.red,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Text("supprimer", style: new TextStyle(color: Colors.white),),
                    new Icon(Icons.delete, color: Colors.white,)
                  ],
                ),
              ),
              onDismissed: (direction){
                setState(() {
                  print(activite.nom);
                  mesActivites.remove(i);
                });
              }

          );
        }
    );
  }
}
class Activity{
  String nom = "";
  IconData icone;
  Activity(this.nom, this.icone);
}
