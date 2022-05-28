import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iboro/progress_pie_bar.dart';
import 'dart:async';

class InvestmentStatus extends StatefulWidget {
  @override
  _InvestmentStatusState createState() => _InvestmentStatusState();
}

class _InvestmentStatusState extends State<InvestmentStatus>
    with SingleTickerProviderStateMixin {
  int _value = 1;
  double earnings;
  double percentage;
  double nextPercentage;
  Timer timer;
  AnimationController progressAnimationController;

  @override
  void initState() {
    super.initState();
    percentage = 0.0;
    nextPercentage = 0.0;
    earnings = 0.0;
    timer = null;
    initAnimationController();
    startProgress();
  }

  initAnimationController() {
    progressAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {
          percentage = lerpDouble(
              percentage, nextPercentage, progressAnimationController.value);
        });
      });
  }

  start() {
    Timer.periodic(Duration(seconds: 15), (handleTicker));
  }

  handleTicker(Timer timer) {
    timer = timer;
    if (nextPercentage < 100) {
      publishProgress();
    } else {
      timer.cancel();
    }
  }

  startProgress() {
    if (null != timer && timer.isActive) {
      timer.cancel();
    }
    setState(() {
      percentage = 0.0;
      nextPercentage = 0.0;
      earnings = 0.0;
      start();
    });
  }

  publishProgress() {
    setState(() {
      percentage = nextPercentage;
      nextPercentage += 20;
      earnings += 12375;
      if (nextPercentage > 100) {
        percentage = 0.0;
        nextPercentage = 0.0;
      }
      progressAnimationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          'Investment Status',
          style: GoogleFonts.raleway(),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: _height * .32,
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
                          border: Border.all(
                              color: Colors.green.shade900, width: 2)),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                            child: Text(
                              'Transaction Details',
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Type:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
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
                                Text(
                                  'Tomato Farm',
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
                                  'Unit:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  '1',
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
                                  'Price:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  '₦45,000.00',
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
                                  'Duration:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  '5 Months',
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
                                  'ROI:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  '37.5%',
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
                                  'Start Date:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  '26/11/2020',
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
                                  'End Date:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  '25/04/2021',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Expected Returns:',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  '₦61,8875.00',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
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
            SizedBox(height: 10.0),
            // Circular Progress Bar
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Container(
                height: 280,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade100,
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
                    ],
                    border: Border.all(
                      width: 15,
                      color: Colors.white,
                    )),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: 175,
                        child: CustomPaint(
                          painter: ProgressBarPainter(
                            circleWidth: 65,
                            completedPercentage: percentage,
                            defaultCircleColor: Colors.transparent,
                          ),
                          child: Center(),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 15,
                              color: Colors.white,
                            )),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Earnings',
                                style: GoogleFonts.raleway(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                              Text(
                                '₦' + earnings.toStringAsFixed(2),
                                style: GoogleFonts.raleway(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    'Rollover Options',
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 280.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.green.shade900,
                    border: Border.all(
                        color: Colors.green.shade700,
                        width: 3.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        dropdownColor: Colors.green.shade700,
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'Don\'t rollover',
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(letterSpacing: 2.0),
                              ),
                            ),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              'Rollover principal and withdraw interest',
                              style: GoogleFonts.raleway(
                                fontSize: 11,
                              ),
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text('Rollover principal and interest',
                                style: GoogleFonts.raleway(
                                  fontSize: 11,
                                )),
                            value: 3,
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ),
                ),
                SizedBox(height: 4.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade900,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    textStyle: GoogleFonts.raleway(
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  child: Text(
                    'Terminate Investment', 
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
