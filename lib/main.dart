import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

void main() {
  runApp(IboroProject());
}

class IboroProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;

  List cardList = [
    Item1(),
    Item2(),
    Item3(),
    Item4(),
    Item5(),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Stack(
        children: <Widget>[
          Container(
            height: 0.85 * _height,
            decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(30.0, 30.0),
                    bottomRight: Radius.elliptical(30.0, 30.0))),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 0.15 * _height,
                ),
                CarouselSlider(
                    items: cardList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: 0.6 * _height,
                          width: _width,
                          child: Card(
                            color: Colors.green.shade700,
                            child: card,
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                        height: 0.6 * _height,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        })),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(cardList, ((index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.green.shade900,
                        ),
                      );
                    }))),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 20.0),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                'Get Started',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/farm4nations.png', fit: BoxFit.cover),
          Text(
            'Agric Invesment',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0),
            ),
          ),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/farmer.PNG', fit: BoxFit.cover),
          Text(
            'Farm without being on a farm',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0),
            ),
          ),
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/grow.PNG', fit: BoxFit.cover),
          Text(
            'Watch your investments grow from the comfort of your home',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/cow.PNG', fit: BoxFit.cover),
          Text(
            'Livestock Farming',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0),
            ),
          ),
        ],
      ),
    );
  }
}

class Item5 extends StatelessWidget {
  const Item5({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/resort.PNG', fit: BoxFit.cover),
          Text(
            'Aquatic & Recreational Park',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0),
            ),
          ),
        ],
      ),
    );
  }
}
