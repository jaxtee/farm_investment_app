import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingList extends StatefulWidget {
  @override
  _PendingListState createState() => _PendingListState();
}

class _PendingListState extends State<PendingList> {
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
            child: Text('Your Pending Transaction(s)',
                style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: _width,
              height: _height * 0.45,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: PendingViews(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class PendingViews extends StatefulWidget {
  @override
  _PendingViewsState createState() => _PendingViewsState();
}

class _PendingViewsState extends State<PendingViews> {
  var pendingList = [
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Date': '11-12-2020',
      'Amount': 45000,
      'Payment': 'Online Transfer',
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Date': '11-12-2020',
      'Amount': 45000,
      'Payment': 'Cash',
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Date': '11-12-2020',
      'Amount': 45000,
      'Payment': 'Cash',
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Date': '11-12-2020',
      'Amount': 45000,
      'Payment': 'ATM Debit',
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Date': '11-12-2020',
      'Amount': 45000,
      'Payment': 'Online Transfer',
    },
    {
      'Type': 'FARM \'N\' VEST SCHEMES',
      'Title': 'Tomato Farm',
      'Date': '11-12-2020',
      'Amount': 45000,
      'Payment': 'Cash',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: pendingList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: PendingTile(
                pType: pendingList[index]['Type'],
                pTitle: pendingList[index]['Title'],
                pAmount: pendingList[index]['Amount'],
                pDate: pendingList[index]['Date'],
                pMethod: pendingList[index]['Payment'],
              ),
            ),
          );
        });
  }
}

class PendingTile extends StatelessWidget {
  final pType;
  final pTitle;
  final pAmount;
  final pDate;
  final pMethod;

  PendingTile({
    this.pType,
    this.pTitle,
    this.pAmount,
    this.pDate,
    this.pMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185.0,
      width: 130.0,
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
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 2.0),
                child: Text(
                  pType,
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
                  pTitle,
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
                  'Amount:',
                  style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                child: Text('₦' +
                  pAmount.toStringAsFixed(2),
                  style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
                child: Text(
                  'Payment Type:',
                  style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 2.0, 2.0, 0.0),
                child: Text(
                  pMethod,
                  style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
                child: Text(
                  'Payment Date:',
                  style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
                child: Text(
                  pDate,
                  style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 0.0),
                child: Text(
                  'Please bear with us while we\nconfirm your payment',
                  style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
