import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'musique player',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade700,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Application Musique'),
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 35.0,
                        offset: Offset(0.0, 10.0) // Shadow position
                        ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/un.jpg'),
                  )),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                "Them swift",
                style: GoogleFonts.actor(color: Colors.white, fontSize: 35),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                "Codabee",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MusicControlButtonSection(),
                  DurationSection(),
                  MusicSliderSection()
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MusicSliderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Slider(
        value: 19,
        min: 1.0,
        max: 100,
        divisions: 10,
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        onChanged: (double newValue) {},
      ),
    );
  }
}

class DurationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 27, right: 27, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '1.08',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          Text(
            '3.14',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class MusicControlButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.shuffle,
              color: Colors.grey,
              size: 35,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 40,
            ),
            onPressed: null,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.pause,
                color: Colors.black,
                size: 40.0,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
              side: BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 40,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.repeat,
              color: Colors.grey,
              size: 35,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
