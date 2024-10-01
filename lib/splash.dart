import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tipcalapp/calculator.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Timer to navigate to the main screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Clac()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return (const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 217, 103),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.attach_money_sharp, size: 55),
          Text(
            "Pay The Tip",
            style: TextStyle(color: Colors.black),
          )
        ],
      )),
    ));
  }
}
