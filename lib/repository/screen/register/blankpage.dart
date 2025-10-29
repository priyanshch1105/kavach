import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kawach/repository/screen/bottomnav/bottomnavscreen.dart';

class BlankPage extends StatefulWidget {
  @override
  _BlankPageState createState() => _BlankPageState();

}

  class _BlankPageState extends State<BlankPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () { // Delay before navigation
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1500),
          // Animation duration
          pageBuilder: (_, __, ___) => BottomNavScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation, // simple fade in/out
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }

