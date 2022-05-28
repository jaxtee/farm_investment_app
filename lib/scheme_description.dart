import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iboro/list_investment.dart';

class SchemePage extends StatefulWidget {
  final dImage;
  final dType;
  final dTitle;
  final dDetail;
  final dROI;
  final dPrice;
  final dLocation;

  SchemePage(
      {this.dImage,
      this.dType,
      this.dTitle,
      this.dDetail,
      this.dROI,
      this.dPrice,
      this.dLocation});

  @override
  _SchemePageState createState() => _SchemePageState();
}

class _SchemePageState extends State<SchemePage> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(widget.dImage),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: _height * 0.4),
              Text(
                widget.dType,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              Text(
                widget.dTitle,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              Text(
                widget.dDetail,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Text(
                widget.dROI,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Text(
                widget.dLocation,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Container(
                height: _height * .274,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildColumn1(),
                      _buildColumn2(),
                      Container(
                        width: 80.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: GestureDetector(
                          onTap: () {
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InvestmentList()));
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Invest Now',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      color: Colors.green.shade700,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          // ),
        ),
      ),
    );
  }

  Column _buildColumn2() {
    return Column(
      children: <Widget>[
        //1st Container
        Padding(
          padding: const EdgeInsets.only(top: 28.0, bottom: 8.0),
          child: Container(
            width: 130.0,
            height: 80.0,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.green.shade700,
                  width: 3.0,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () => setState(() => _counter++)),
                Container(
                  width: 28.0,
                  height: 28.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.green.shade700,
                          width: 3.0,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: Text(
                      _counter.toString(),
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      if (_counter == 0) {
                        _counter = 0;
                      }
                      else {
                        _counter--;
                      }
                    });
                  } 
                ),
              ],
            ),
          ),
        ),
        // 2nd Container
        Container(
          width: 130.0,
          height: 80.0,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.green.shade700,
                width: 3.0,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'Price',
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '₦' + (_counter * widget.dPrice).toString(),
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Column _buildColumn1() {
    return Column(
      children: [
        // 1st Container
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.green.shade700,
                  width: 3.0,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Center(
              child: Text(
                '5 months',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
