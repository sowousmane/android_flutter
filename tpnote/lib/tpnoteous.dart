import 'package:flutter/material.dart';

class Tpnoteous extends StatefulWidget {
  @override
  TpnoteousSate createState() => TpnoteousSate();
}

class TpnoteousSate extends State<Tpnoteous> {
  bool switchValue = false;
  double sliderValue = 0;
  bool gender = false;
  var langages = ["faible", "moderer", "forte"];
  String favorite_langage = "";
  int groupValue = 0;
  double age = 0.0;
  double poids = 0.0;
  double taille = 0.0;
  int poidscalcule = 0;
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
          backgroundColor: getColorGender(),
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(children: [
                    Text(
                        "Flutter is Google's SDK for crafting beautiful, fast user experiences for mobile, web, and desktop from a single codebase. "),
                  ])),
                  makeSpace(),
              Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade700,
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        textWidthStyle("Homme", color: Colors.blue),
                        new Switch(
                            value: gender,
                            onChanged: (bool b) {
                              setState(() {
                                gender = b;
                              });
                            },
                            inactiveTrackColor: Colors.blue,
                            inactiveThumbColor: Colors.blue,
                            activeTrackColor: Colors.pink,
                            activeColor: Colors.pink),
                        textWidthStyle("Femme", color: Colors.pink)
                      ],
                    ),
                    makeSpace(),
                    ElevatedButton(
                        onPressed: datePicker,
                        style:
                            ElevatedButton.styleFrom(primary: getColorGender()),
                        child: Text(age == null
                            ? "Appuyer pour entrer votre age!"
                            : "Votre age est ${age.toInt()} ans.")),
                    makeSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Votre taille est : ${sliderValue.toInt()} cm")
                      ],
                    ),
                    makeSpace(),
                    Slider(
                      min: 0,
                      max: 150,
                      value: sliderValue,
                      onChanged: ((newValue) {
                        setState(() {
                          sliderValue = newValue;
                        });
                      }),
                      inactiveColor: Colors.brown,
                      activeColor: getColorGender(),
                    ),
                    makeSpace(),
                    TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Entrez votre poids en kilo",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (newString) {
                        setState(() {
                          poids = double.parse(newString);
                        });
                      },
                    ),
                    makeSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Quelle est votre activité sportive favorite?"),
                      ],
                    ),
                    makeSpace(),
                    radios(),
                  ])),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        if( poids != 0  && taille != null  ){
                          if(gender){

                            poidscalcule = (655.0955 + poids * 9.5634 + 1.8496 * sliderValue - 4.6756 * age).toInt();

                          }
                          else{

                            poidscalcule =(66.4730 + poids * 13.7516 + 5.0033 * sliderValue - 6.7550 * age).toInt() ;
                          }
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Votre besoin en calorie',
                                  style: TextStyle(color: Colors.purple),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text('Votre besoin de base: 1820'),
                                      Text('Votre besoin avec activité aportive est de :$poidscalcule' ),
                                      //Text("" + calculpoids),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: Text(
                                      "Annuler",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(getColorGender()),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'ok'),
                                    child: Text(
                                      "Valider",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(getColorGender()),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        else{
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('AlertDialog Title'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      Text('Erreur tous les champs ne sont pas rempli.'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('retour'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],

                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Calculer",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(getColorGender()),
                      ),
                    )
                  ],
                ),
              ),
            ])));
  }

  Color getColorGender() {
    if (gender)
      return Colors.pinkAccent.shade700;
    else
      return Colors.blueAccent.shade700;
  }

  Text textWidthStyle(String data, {color: Colors.black, fontSize: 15.0}) {
    return new Text(
      data,
      textAlign: TextAlign.center,
      style: new TextStyle(color: color, fontSize: fontSize),
    );
  }

  Future<Null> datePicker() async {
    DateTime? time = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1920),
        lastDate: new DateTime.now(),
        initialDatePickerMode: DatePickerMode.year);
    if (time != null) {
      var compare = new DateTime.now().difference(time);
      var days = compare.inDays;
      var years = (days / 365);
      setState(() {
        age = years;
      });
    }
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < langages.length; i++) {
      Radio r = Radio(
          activeColor: getColorGender(),
          value: i,
          groupValue: groupValue,
          onChanged: ((newValue) {
            setState(() {
              favorite_langage = langages[i];
              groupValue = newValue as int;
            });
          }));
      radios.add(Column(
        children: [r,  Text(langages[i])],
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //children: radios,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: radios,
          ),
        )
      ],
    );
  }

  Padding makeSpace() {
    return new Padding(padding: EdgeInsets.only(top: 20.0));
  }
}
