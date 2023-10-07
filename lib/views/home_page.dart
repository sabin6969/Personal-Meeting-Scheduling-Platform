import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalmeetingschedulingplatform/controller/auth_controller.dart'; // Import this for date formatting

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Get the current time for greeting
    String greeting = getGreeting();

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
              accountName: Text(auth.currentUser!.displayName ?? "Geust"),
              accountEmail: Text(auth.currentUser!.email ?? "loading"),
              currentAccountPicture: const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sign Out'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Are you sure you want to logout?'),
                            ElevatedButton(
                              onPressed: () {
                                // Perform logout action
                                Navigator.pushReplacementNamed(
                                    context, "login");
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
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
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Handle drawer button press
                Scaffold.of(context).openDrawer();
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                // Handle my account button press
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
