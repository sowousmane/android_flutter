

import 'package:flutter/material.dart';
class Appessai extends StatefulWidget {
  @override
  AppessaiSate createState() => AppessaiSate();
}

class AppessaiSate extends State<Appessai> {
  String prenom = "";
  String nom = "";
  bool switchValue = false;
  double sliderValue = 0;
  int groupValue = 1;
  bool mySecret = true;

  Map<String, bool> hobbies = {
    "Pétanque": false,
    "Code": true,
    "Rugby": false,
    "Football": false,
  };


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
      appBar: AppBar(
        title: Text("Mon profil"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade900,
      ),

        body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(

                      width: double.infinity,
                      height: 180,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(20),
                      color: Colors.deepPurple.shade200,
                      alignment: Alignment.center,
                      child: Column(
                          children: [
                            Text("$prenom $nom"),
                            Text("Taille: ${sliderValue.toInt()} cm"),
                            Text("Genre: " + ((switchValue) ? "Masculin" : "Feminin")),
                            Text("Hobbies: "),
                            ElevatedButton(
                                onPressed: secret,
                                child: Text("Montrer le secret", style: TextStyle(color: Colors.white),),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple.shade400),

                              ),


                            )

                          ],
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 3,
                      color:  Colors.purple,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("Modifier les infos"),
                          TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Prénom",
                            ),
                            keyboardType: TextInputType.name,
                            onChanged: (newString) {
                              setState(() {
                                prenom = newString;
                              });
                            },
                          ),
                          TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Nom",
                            ),
                            keyboardType: TextInputType.name,
                            onChanged: (newString) {
                              setState(() {
                                nom = newString;
                              });
                            },
                          ),
                          TextField(
                            obscureText: mySecret,
                            decoration: InputDecoration(
                              hintText: "Dites nous un secret",
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(((switchValue) ? "Masculin" : "Feminin")),
                              Switch(
                                activeColor: Colors.purple,
                                inactiveTrackColor: Colors.grey,
                                inactiveThumbColor: Colors.grey,
                                value: switchValue,
                                onChanged: ((bool){
                                  setState(() {
                                    switchValue = bool;
                                  });
                                }),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Taille: ${sliderValue.toInt()} cm"),
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
                                activeColor: Colors.purple,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 3,
                      color:  Colors.purple,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("Mes Hobbies"),
                          checks(),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 3,
                      color:  Colors.purple,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("Langage préféré"),
                          radios(),
                        ],
                      ),
                    ),
                    ],
        ),
      )
    );
  }//build

  Column checks() {
    List<Widget> items = [];
    hobbies.forEach((hobbie, name) {
      Widget row = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hobbie),
          Checkbox(
              value: name,
              onChanged: ((newValue) {
                setState(() {
                  hobbies[hobbie] = newValue ?? false;

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

  secret(){
    setState(() {
      if(mySecret){
        mySecret = false;
      } else {
        mySecret = true;
      }
    });
  }
}