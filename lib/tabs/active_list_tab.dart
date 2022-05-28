import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iboro/investment_status.dart';

class ActiveList extends StatefulWidget {
  @override
  _ActiveListState createState() => _ActiveListState();
}

class _ActiveListState extends State<ActiveList> {
  int _currentBalance = 6000000;
  int _activePlan = 6;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 30),
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 12.0),
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
        SizedBox(height: 20.0),
        Container(
          width: _width,
          height: _height * 0.35,
            child: Container(
              child: ActiveViews(),
            ),
          ),
      ]),
    );
  }
}

class ActiveViews extends StatefulWidget {
  @override
  _ActiveViewsState createState() => _ActiveViewsState();
}

class _ActiveViewsState extends State<ActiveViews> {
  var investList = [
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Balance': 1000000,
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Balance': 500000,
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Balance': 1000000,
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Balance': 1000000,
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Balance': 500000,
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Balance': 1000000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: investList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ActiveTile(
                aType: investList[index]['Type'],
                aTitle: investList[index]['Title'],
                aBalance: investList[index]['Balance'],
              ),
            ),
          );
        });
  }
}

class ActiveTile extends StatelessWidget {
  final aType;
  final aTitle;
  final aBalance;

  ActiveTile({
    this.aType,
    this.aTitle,
    this.aBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      width: 100.0,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade600,
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0)
        ],
      ),
      child: InkWell(
        splashColor: Colors.green.shade700,
        onTap: () {
          return Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => InvestmentStatus()));
        },
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 2.0),
                  child: Text(
                    aType,
                    style: GoogleFonts.raleway(
                      textStyle:
                          TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                  child: Text(
                    aTitle,
                    style: GoogleFonts.raleway(
                      textStyle:
                          TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                  child: Text('₦' +
                    aBalance.toStringAsFixed(2),
                    style: GoogleFonts.raleway(
                      textStyle:
                          TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
                  child: Text(
                    'Click for details',
                    style: GoogleFonts.raleway(
                      textStyle:
                          TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
