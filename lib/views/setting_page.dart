import 'package:flutter/material.dart';
import 'package:personalmeetingschedulingplatform/views/about_us.dart';
import 'profile_page.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Account Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Handle change password tap
            },
          ),
          ListTile(
            title: Row(
              children: [
                Text('Push Notifications'),
                Spacer(),
                Switch(
                  value:
                      true, // You can set the initial value based on user preferences
                  onChanged: (value) {
                    // Handle switch state change for push notifications
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Text('Dark Mode'),
                Spacer(),
                Switch(
                  value:
                      false, // You can set the initial value based on user preferences
                  onChanged: (value) {
                    // Handle switch state change for dark mode
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'More',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('About Us'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()));
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Handle Privacy Policy tap
            },
          ),
        ],
      ),
    );
  }
}
