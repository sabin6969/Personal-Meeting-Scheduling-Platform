import 'package:flutter/material.dart';
import 'package:personalmeetingschedulingplatform/controller/auth_controller.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'setting_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the home page when the back button is clicked
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            },
          ),
        ],
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              // Add your profile picture here
              backgroundImage: AssetImage('asset/images/profile.jpeg'),
            ),
            SizedBox(height: 20),
            Text(
              'Pawan Ghimire', // User's name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Software Engineer', // User's designation
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                margin: EdgeInsets.all(10),
                height: size.height * 0.05,
                color: Color.fromRGBO(255, 227, 202, 1),
                width: double.infinity,
                child: Center(
                  child: Text(
                    auth.currentUser!.email.toString(), // User's email
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                margin: EdgeInsets.all(10),
                height: size.height * 0.05,
                color: const Color.fromRGBO(218, 226, 255, 1),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Company: Gateway Group', // Company name
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle logout button press
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
