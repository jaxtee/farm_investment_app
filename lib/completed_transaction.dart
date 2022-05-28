import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedTransaction extends StatefulWidget {
  @override
  _CompletedTransactionState createState() => _CompletedTransactionState();
}

class _CompletedTransactionState extends State<CompletedTransaction> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text('Transaction Details', style: GoogleFonts.raleway()),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(children: <Widget>[
          Container(
            height: _height * .40,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    offset: Offset(-5, -5),
                    blurRadius: 15,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: Offset(10.5, 10.5),
                    blurRadius: 15,
                  ),
                ]),
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: constraints.maxHeight * .88,
                    width: constraints.maxWidth * .95,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.green.shade300,
                          Colors.green.shade700
                        ]),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.green.shade900, width: 2)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                          child: Text('Transaction Details',
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17),
                              )),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Type:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                              Text(
                                'FARM \'N\' VEST SCHEMES',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Title:',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                              Text('Tomato Farm',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Unit:',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                              Text('1',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Price:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                              Text('₦45,000.00',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Duration:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                              Text('5 Months',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('ROI:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                              Text('37.5%',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Start Date:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                              Text('26/11/2020',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('End Date:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                              Text('25/04/2021',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Expected Returns:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                              Text('₦61,8875.00',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
