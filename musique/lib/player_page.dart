import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
