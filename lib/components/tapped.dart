import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabTapped extends StatelessWidget {

  var text;

  TabTapped({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 15.0,
      child: Container(
        color: Colors.transparent,
        width: 105,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Center(
            child: Text(text,
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
