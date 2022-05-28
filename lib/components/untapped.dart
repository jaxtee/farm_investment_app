import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabUntapped extends StatelessWidget {
  var text;

  TabUntapped({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 60,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.raleway(
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900),
          ),
        ),
      ),
    );
  }
}
