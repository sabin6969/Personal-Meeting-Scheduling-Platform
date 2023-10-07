import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('About us'),),
      body: Container(height: MediaQuery.sizeOf(context).height*0.4,
      child: Image(image: AssetImage('')),),
    );
  }
}