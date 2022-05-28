import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iboro/profile.dart';
import 'package:iboro/scheme_card.dart';
import 'components/bottom_buttons.dart';
import 'components/button_tapped.dart';
import 'investment.dart';

class HomePage extends StatelessWidget {
  var icons1 = Icons.house;
  var icons2 = Icons.business_center;
  var icons3 = Icons.person;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
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
                onTap: () {},
                child: ButtonTapped(icon: icons1),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InvestmentPage()));
                },
                child: BottomButtons(icon: icons2),
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
      body: Container(
        color: Colors.green.shade900,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'IBORO INTEGRATED\nFARM ESTATE',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Choose 1 or more of our\ninvestment schemes',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: _height * .561,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0))),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Schemes(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
