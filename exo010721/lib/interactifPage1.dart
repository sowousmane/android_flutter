//creation of a statefull

import 'package:flutter/material.dart';

class InteractifPage1 extends StatefulWidget {
  @override
  InteractifPage1State createState() => InteractifPage1State();
}

class InteractifPage1State extends State<InteractifPage1> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  bool textButtonPressed = false;
  IconData icon = Icons.favorite;
  String prenom = "";
  bool check = false;
  Map<String, bool> courses = {
    "Carottes": false,
    "Oignon": true,
    "Abrico": false,
  };
  int groupValue = 1;
  bool switchValue = true;
  double sliderValue = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Mon profil"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: updateAppBar,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.work), textButtonText()],
                )),
            ElevatedButton(
              onPressed: () {
                print("bonjour");
              },
              child: Text("Elevatin"),
              onLongPress: () {
                print("coucoucouc");
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.indigo,
                  elevation: 10,
                  primary: Colors.deepPurple),
            ),

            
            IconButton(
              onPressed: setIcon,
              icon: Icon(icon),
              color: Colors.pink,
              splashColor: Colors.pinkAccent,
            ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                hintText: "entrez votre email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (newString) {
                setState(() {
                  prenom = newString;
                });
              },
            ),
            Text(prenom),
            Checkbox(
                value: check,
                onChanged: ((newBool) =>
                    setState(() => check = newBool ?? false))),
            checks(),
            radios(),
            Text(((switchValue)
                ? "J'aime les chats"
                : "Les chats sont gentils")),
            Switch(
              activeColor: Colors.green,
              inactiveTrackColor: Colors.red,
              inactiveThumbColor: Colors.redAccent,
              value: switchValue,
              onChanged: ((bool) {
                setState(() {
                  switchValue = bool;
                });
              }),
            ),
            Slider(
              min: 0,
              max: 100,
              value: sliderValue,
              onChanged: ((newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              }),
              inactiveColor: Colors.brown,
              activeColor: Colors.yellow,
            ),
            Text("Valeur: ${sliderValue.toInt()}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: upgradeColors,
        child: Icon(Icons.build),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  upgradeColors() {
    setState(() {
      backgroundColor =
          (backgroundColor == Colors.white) ? Colors.black : Colors.white;
      textColor = (textColor == Colors.black) ? Colors.white : Colors.black;
    });
  }

  updateAppBar() {
    setState(() => textButtonPressed = !textButtonPressed);
  }

  String updateAppBarText() {
    return (textButtonPressed) ? "je m'y connais un peu " : "Les interactifs";
  }

  Text textButtonText() {
    return Text(
      "Je suis un text button",
      style: TextStyle(color: Colors.red, backgroundColor: Colors.grey),
    );
  }

  setIcon() {
    setState(() {
      icon = (icon == Icons.favorite) ? Icons.favorite_border : Icons.favorite;
    });
  }

  Column checks() {
    List<Widget> items = [];
    courses.forEach((course, achete) {
      Widget row = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(course),
          Checkbox(
              value: achete,
              onChanged: ((newValue) {
                setState(() {
                  courses[course] = newValue ?? false;
                });
              }))
        ],
      );
      items.add(row);
    });
    return Column(
      children: items,
    );
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < 4; i++) {
      Radio r = Radio(
          value: i,
          groupValue: groupValue,
          onChanged: ((newValue) {
            setState(() {
              groupValue = newValue as int;
            });
          }));
      radios.add(r);
    }
    return Row(
      children: radios,
    );
  }
}
