// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:symptoscan/CreateAccount.dart';
import 'package:symptoscan/LoginScreen.dart';

class onBoard extends StatelessWidget {
  onBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LiquidSwipe(
          pages: pages,
          enableLoop: false,
          fullTransitionValue: 300,
          enableSideReveal: true,
          slideIconWidget: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.5,
        ),
      ),
    );
  }

  final pages = [
    Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Image.asset(
              "assets/1.png",
              height: 300,
              width: 300,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text("SymptoScan",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ))),
          const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Disease Predictor",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ))),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Colors.blue[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Image.asset(
              "assets/2.png",
              height: 300,
              width: 300,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text("Unlock Your Health Insights",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ))),
          const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Your Journey to Wellness Begins with a Secure Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ))),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Image.asset(
              "assets/3.png",
              height: 300,
              width: 300,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text("Empowering Health",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ))),
          const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("One Service at a Time",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ))),
        ],
      ),
    ),
    LoginScreen(),
  ];
}
