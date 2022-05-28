import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iboro/scheme_description.dart';

class Schemes extends StatefulWidget {
  @override
  _SchemesState createState() => _SchemesState();
}

class _SchemesState extends State<Schemes> {
  var scheme = [
    {
      'images': 'assets/tomatoes.jpg',
      'schemeType': 'FARM \'N\' VEST SCHEMES',
      'schemeTitle': 'Tomato Farm',
      'schemeDetail': '500 units available\n@ ₦45,000 per unit',
      'schemeROI': 'Earn up to 37.5% ROI in 5 months',
      'price': 45000,
      'location': 'Imina, Ogun State'
    },
    {
      'images': 'assets/pepper.jpg',
      'schemeType': 'FARM \'N\' VEST SCHEMES',
      'schemeTitle': 'Habanero',
      'schemeDetail': '500 units available\n@ ₦45,000 per unit',
      'schemeROI': 'Earn up to 37.5% ROI in 5 months',
      'price': 45000,
      'location': 'Imina, Ogun State'
    },
    {
      'images': 'assets/onions.jpg',
      'schemeType': 'FARM \'N\' VEST SCHEMES',
      'schemeTitle': 'Onions',
      'schemeDetail': '500 units available\n@ ₦45,000 per unit',
      'schemeROI': 'Earn up to 37.5% ROI in 5 months',
      'price': 45000,
      'location': 'Imina, Ogun State'
    },
    {
      'images': 'assets/fishpond.jpg',
      'schemeType': 'FARM OWNER OPERATOR',
      'schemeTitle': 'Fish Ponds',
      'schemeDetail': '200 units of 1,000 - 5,000 capacity',
      'schemeROI': 'Iboro Integrated Farm Estate,',
      'price': 45000,
      'location': 'Along Old Ilaro/Ibese Road,\n Yewa North, Ogun State'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: scheme.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.transparent,
            height: 250,
            child: SchemeCard(
              cardImage: scheme[index]['images'],
              cardType: scheme[index]['schemeType'],
              cardTitle: scheme[index]['schemeTitle'],
              cardDetail: scheme[index]['schemeDetail'],
              cardROI: scheme[index]['schemeROI'],
              cardPrice: scheme[index]['price'],
              cardLocation: scheme[index]['location'],
            ),
          );
        });
  }
}

class SchemeCard extends StatelessWidget {
  final cardImage;
  final cardType;
  final cardTitle;
  final cardDetail;
  final cardROI;
  final cardPrice;
  final cardLocation;

  SchemeCard(
      {this.cardImage,
      this.cardType,
      this.cardTitle,
      this.cardDetail,
      this.cardROI,
      this.cardPrice,
      this.cardLocation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: cardTitle,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SchemePage(
                        dImage: cardImage,
                        dType: cardType,
                        dTitle: cardTitle,
                        dDetail: cardDetail,
                        dROI: cardROI,
                        dPrice: cardPrice,
                        dLocation: cardLocation,
                      ))),
              child: GridTile(
                  footer: Container(
                    height: 120,
                    color: Colors.white70,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              cardType,
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              cardTitle,
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                          child: Row(
                            children: <Widget>[
                              Text(cardROI),
                              Spacer(),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '₦' + cardPrice.toString() + '/unit',
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Invest Now',
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  child: Image.asset(
                    cardImage,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
