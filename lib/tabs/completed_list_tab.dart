import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iboro/completed_transaction.dart';

class CompletedList extends StatefulWidget {
  @override
  _CompletedListState createState() => _CompletedListState();
}

class _CompletedListState extends State<CompletedList> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Your Completed Investment(s)',
                style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: _width,
              height: _height * 0.48,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CompletedViews(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CompletedViews extends StatefulWidget {
  @override
  _CompletedViewsState createState() => _CompletedViewsState();
}

class _CompletedViewsState extends State<CompletedViews> {
  var completedList = [
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Price': '45,000.00',
      'Earnings': '₦61,8875.00'
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Price': '45,000.00',
      'Earnings': '₦61,8875.00'
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Price': '45,000.00',
      'Earnings': '₦61,8875.00'
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Price': '45,000.00',
      'Earnings': '₦61,8875.00'
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Price': '45,000.00',
      'Earnings': '₦61,8875.00'
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Price': '45,000.00',
      'Earnings': '₦61,8875.00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: completedList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: CompletedTile(
                cType: completedList[index]['Type'],
                cTitle: completedList[index]['Title'],
                cPrice: completedList[index]['Price'],
                cEarn: completedList[index]['Earnings'],
              ),
            ),
          );
        });
  }
}

class CompletedTile extends StatelessWidget {
  final cType;
  final cTitle;
  final cPrice;
  final cEarn;

  CompletedTile({
    this.cType,
    this.cTitle,
    this.cPrice,
    this.cEarn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
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
              MaterialPageRoute(builder: (context) => CompletedTransaction()));
        },
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 2.0),
                  child: Text(
                    cType,
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
                    cTitle,
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
                    cPrice,
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
                    cEarn,
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
                    'Completed',
                    style: GoogleFonts.raleway(
                      textStyle:
                          TextStyle(fontSize: 18),
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
