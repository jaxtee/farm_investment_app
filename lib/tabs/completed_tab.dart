import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home.dart';

class Completed extends StatefulWidget {
  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('No Investment Started',
                style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 15.0),
            child: Text('Your completed investment will be displayed here',
                style: GoogleFonts.raleway(textStyle: TextStyle(fontSize: 16))),
          ),
          SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              return Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('Start Investing',
                style: GoogleFonts.raleway(
                    textStyle: TextStyle(color: Colors.white))),
            color: Colors.green.shade900,
            splashColor: Colors.green.shade700,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          )
        ],
      ),
    );
  }
}
