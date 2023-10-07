// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, unused_element

import 'package:flutter/material.dart';
import 'package:personalmeetingschedulingplatform/views/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //test
    Future<void> delayFunction() async {
      await Future.delayed(Duration(seconds: 1));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.38,
                horizontal: 80),
            child: Image(image: AssetImage("asset/images/Glogo.png")),
          )
        ]),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.13,
        child: Image(image: AssetImage("asset/images/logo.png")),
      ),
    );
  }
}
