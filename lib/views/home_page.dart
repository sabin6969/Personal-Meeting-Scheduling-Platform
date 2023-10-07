import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalmeetingschedulingplatform/controller/auth_controller.dart';
import 'package:personalmeetingschedulingplatform/controller/url_laucher.dart';
import 'package:personalmeetingschedulingplatform/utils/ask_for_logout_dialog.dart';
// Import this for date formatting

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final stream = FirebaseFirestore.instance
      .collection("usersData")
      .doc(auth.currentUser!.uid)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    // Get the current time for greeting
    String greeting = getGreeting();

    return Scaffold(
      appBar: AppBar(
     
        title: const Image(image: AssetImage("asset/images/Glogo.png",),width: 150,),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  }),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting, // Display the greeting
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat.yMMMMd()
                  .format(DateTime.now()), // Display today's date
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16), // Add some spacing

            // Product planning card
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Product Planning',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Description of the product planning goes here.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle invite button press
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Invite'),
                        ),
                        const Icon(Icons.more_vert), // Add your end icon here
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Handle drawer button press
                Scaffold.of(context).openDrawer();
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle,size: 35,),
              onPressed: () {
                Navigator.pushNamed(context,"profile");
              },
            ),
          ],
        ),
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
