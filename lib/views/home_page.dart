// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personalmeetingschedulingplatform/controller/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Are you sure you want to logout?'),
                                ElevatedButton(
                                  onPressed: () {
                                    auth.signOut();
                                    Navigator.pushReplacementNamed(
                                        context, "login");
                                  },
                                  child: Text('Yes'),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                  auth.signOut();
                },
                child: Text('Sign out'))
          ],
        ),
      ),
    );
  }
}
