import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalmeetingschedulingplatform/controller/auth_controller.dart';
import 'package:personalmeetingschedulingplatform/controller/url_laucher.dart';
import 'package:personalmeetingschedulingplatform/utils/ask_for_logout_dialog.dart';
import 'package:personalmeetingschedulingplatform/views/meeting_page.dart';
import 'package:personalmeetingschedulingplatform/views/profile_page.dart'; // Import this for date formatting

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final stream = FirebaseFirestore.instance
      .collection("usersData")
      .doc(auth.currentUser!.uid)
      .snapshots();
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // Get the current time for greeting
    // String greeting = getGreeting();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gmeet'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button press
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: StreamBuilder(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LinearProgressIndicator();
                  } else {
                    final data = snapshot.data!.get("name");
                    return Text(data);
                  }
                },
              ),
              accountEmail: Text(auth.currentUser!.email ?? "loading"),
              currentAccountPicture: const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              onTap: () {
                UrlLauncher.launchSource();
              },
              leading: const Icon(
                Icons.code,
              ),
              title: const Text("View Source Code"),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sign Out'),
              onTap: () {
                AskForLogOut.askForLogOut(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "addmeeting",
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const [
          MeetingPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          pageController.jumpToPage(value);
          currentIndex = value;
          setState(() {});
        },
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view_outlined,
            ),
            label: "Meetings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          )
        ],
      ),
    );
  }

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 17) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }
}
