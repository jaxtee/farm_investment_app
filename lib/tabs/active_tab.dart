import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home.dart';

class Active extends StatefulWidget {
  @override
  _ActiveState createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  int _currentBalance = 0;
  int _activePlan = 0;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: _height * .3,
                width: _width * .9,
                child: Column(children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                    child: Center(
                      child: Text(
                        'Investment Wallet',
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Total Balance: ',
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(fontSize: 16))),
                        Text('₦' + _currentBalance.toStringAsFixed(2),
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Active Plan(s): ',
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(fontSize: 16))),
                        Text(_activePlan.toString(),
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 90.0),
              RaisedButton(
                onPressed: () {
                  return Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'Start Investing',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
                color: Colors.green.shade900,
                splashColor: Colors.green.shade700,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
