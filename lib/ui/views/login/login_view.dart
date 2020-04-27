import 'dart:ui';

import 'package:dashboard/core/redux/connectors/login/login_form.dart';
import 'package:dashboard/core/redux/connectors/login/signup_form.dart';
import 'package:dashboard/ui/shared/green_lean_icons.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final double _sigmaX = 5.0;
  final double _sigmaY = 5.0;
  final double _opacity = 0.5;

  bool _showLoginForm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
              child: Container(
                color: Colors.black.withOpacity(_opacity),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          GreenLean.power,
                          size: 50,
                        ),
                        Container(width: 15),
                        Text('Green Lean', style: TextStyle(fontSize: 30))
                      ],
                    ),
                    Container(height: 15, width: 0),
                    Container(
                      width: 275,
                      child: _showLoginForm
                        ? LoginFormConnector()
                        : SignUpFormConnector(),
                    ),
                    Container(height: 25, width: 0),
                    GestureDetector(
                      child: _showLoginForm
                          ? Text('I don\'t have an account')
                          : Text('I already have an account'),
                      onTap: () =>
                          setState(() => _showLoginForm = !_showLoginForm),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
