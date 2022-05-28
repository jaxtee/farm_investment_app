import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'components/bottom_buttons.dart';
import 'components/button_tapped.dart';
import 'home.dart';
import 'investment.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var icons1 = Icons.house;
  var icons2 = Icons.business_center;
  var icons3 = Icons.person;

  String _username, _email, _password = "";
  var _formKey = GlobalKey<FormState>();
  var _formKey1 = GlobalKey<FormState>();

  bool _allowPopBack = false;

  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  bool agreeVal = false;
  bool rememberVal = false;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/green_background.jpg'),
        fit: BoxFit.cover,
      )),
      child: WillPopScope(
        onWillPop: () async {
          return _allowPopBack;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // title: Text('Profile'),
            backgroundColor: Colors.transparent,
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InvestmentPage()));
                    },
                    child: BottomButtons(icon: icons2),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ButtonTapped(icon: icons3),
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 12),
                  child: Container(
                    height: _height * .3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sign Up/Sign In to start investing',
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Text(
                            'Think investment, think us',
                            style: GoogleFonts.raleway(
                              textStyle:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        Text(
                          'Join us now',
                          style: GoogleFonts.raleway(
                            textStyle:
                                TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton(
                      onPressed: () => _signIn(context),
                      style: TextButton.styleFrom(
                        primary: Colors.white
                      ),
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.raleway(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _signUp(context),
                      style: TextButton.styleFrom(
                        primary: Colors.white
                      ),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.raleway(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUp(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(30.0),
        topRight: const Radius.circular(30.0))),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SafeArea(
              child: Container(
                child: Wrap(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          nameInput(),
                          SizedBox(height: 16),
                          emailInput(),
                          SizedBox(height: 16),
                          passwordInput(),
                          SizedBox(height: 16),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                  value: agreeVal,
                                  onChanged: (bool value) {
                                    setState(() {
                                      agreeVal = value;
                                    });
                                  }),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: 'I agree to the ',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.black),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.green.shade700,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(
                                  text: ' & ',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.black),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Conditions',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ])),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                toastMessage(
                                    'Username: $_username\nEmail: $_email\nPassword: $_password');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green.shade900,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              elevation: 5.0,
                              textStyle: GoogleFonts.raleway(
                                textStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: Text(
                                  'Already have an account?',
                                  style: GoogleFonts.raleway(),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _allowPopBack = !_allowPopBack;
                                  });
                                  Navigator.pop(context);
                                  _signIn(context);
                                },
                                child: Text(
                                  'Sign In',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.green.shade700,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            );
          });
        });
  }

  void _signIn(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(30.0),
          topRight: const Radius.circular(30.0))),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SafeArea(
              child: Container(
                child: Wrap(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey1,
                      child: Column(
                        children: <Widget>[
                          nameInput(),
                          SizedBox(height: 20),
                          passwordInput(),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green.shade900,
                              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(18.0),
                              ),
                              elevation: 5.0,
                              textStyle: GoogleFonts.raleway(
                                textStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                            child: Text(
                              'Sign in',
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Checkbox(
                                  value: rememberVal,
                                  onChanged: (bool value) {
                                    setState(() {
                                      rememberVal = value;
                                    });
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 10.0),
                                child: Text(
                                  'Remember me',
                                  style: GoogleFonts.raleway(),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.green.shade700,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Don\'t have an account?',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _allowPopBack = !_allowPopBack;
                                  });
                                  Navigator.pop(context);
                                  _signUp(context);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.green.shade700,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            );
          });
        });
  }

  Widget nameInput() {
    return TextFormField(
      focusNode: _usernameFocusNode,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration:
          InputDecoration(labelText: "Username", hintText: "e.g Jackson"),
      textInputAction: TextInputAction.next,
      validator: (name) {
        Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(name))
          return 'Invalid username';
        else
          return null;
      },
      onSaved: (name) => _username = name,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _usernameFocusNode, _emailFocusNode);
      },
    );
  }

  Widget emailInput() {
    return TextFormField(
      focusNode: _emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(labelText: "Email", hintText: "e.g abc@gmail.com"),
      textInputAction: TextInputAction.next,
      validator: (email) =>
          EmailValidator.validate(email) ? null : "Invalid email address",
      onSaved: (email) => _email = email,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
      },
    );
  }

  Widget passwordInput() {
    return TextFormField(
      focusNode: _passwordFocusNode,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: Icon(Icons.lock),
      ),
      textInputAction: TextInputAction.done,
      validator: (password) {
        Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(password))
          return 'Invalid password';
        else
          return null;
      },
      onSaved: (password) => _password = password,
    );
  }

  void toastMessage(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
