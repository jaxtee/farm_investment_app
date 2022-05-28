import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iboro/investment_tabs.dart';
import 'package:iboro/profile.dart';
import 'components/bottom_buttons.dart';
import 'components/button_tapped.dart';
import 'home.dart';

class InvestmentPage extends StatefulWidget {
  @override
  _InvestmentPageState createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {
  var icons1 = Icons.house;

  var icons2 = Icons.business_center;

  var icons3 = Icons.person;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      appBar: AppBar(
        title: Text(
          'Investments',
          style: GoogleFonts.raleway(),
        ),
        backgroundColor: Colors.green.shade900,
        centerTitle: true,
        elevation: 0.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: BottomButtons(icon: icons1),
              ),
              GestureDetector(
                onTap: () {},
                child: ButtonTapped(icon: icons2),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: BottomButtons(icon: icons3),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Container(
          width: _width,
          height: _height * .74,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.white,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: -12.0,
                    blurRadius: 12.0,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InvestmentTabs(),
            ),
          ),
        ),
      ),
    );
  }
}
