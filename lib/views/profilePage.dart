// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int intialIndex = 0;
  bool isSwitched = false;
  bool ischange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text(ischange ? " Account Settings " : "Profile"),
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                intialIndex = 0;
                ischange = false;
              });
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  intialIndex = 1;
                  ischange = true;
                });
              },
            )
          ]),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: IndexedStack(
          index: intialIndex,
          children: [
            Visibility(
              child: SizedBox(
                child: Column(children: [
                  Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    width: MediaQuery.sizeOf(context).width,
                    child: Stack(children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Color.fromARGB(255, 238, 123, 8),
                          child: CircleAvatar(
                              radius: 75,
                              child: Icon(
                                Icons.person,
                                size: 50,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.15,
                            left: MediaQuery.sizeOf(context).width * 0.58),
                        child: const CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(children: [
                      const Text("Pawan Ghimire",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const Text(
                        "HR. Manager",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const SizedBox(height: 18),
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Color.fromARGB(144, 223, 181, 178)),
                          height: MediaQuery.sizeOf(context).height * 0.08,
                          width: MediaQuery.sizeOf(context).width,
                          child: const Center(
                            child: Text("Email: Pghimire522@rku.ac.in",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          )),
                      const SizedBox(height: 18),
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Color.fromARGB(144, 178, 207, 223)),
                          height: MediaQuery.sizeOf(context).height * 0.08,
                          width: MediaQuery.sizeOf(context).width,
                          child: const Center(
                            child: Text("Company: Gateway Group ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          )),
                      const SizedBox(height: 15),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color.fromARGB(255, 205, 103, 25)),
                        height: MediaQuery.sizeOf(context).height * 0.06,
                        width: MediaQuery.sizeOf(context).width,
                        child: const Center(
                          child: Text("Logout",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                ]),
              ),
            ),
            Visibility(
              visible: true,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(children: [
                       Card(
                      child: ListTile(
                        onTap: () {
                          
                        },
                        trailing: Icon(Icons.arrow_right,size: 40,color: Colors.black,),
                        tileColor: Color.fromARGB(139, 255, 255, 255),
                        title: Text("Change password"),
                        leading: Icon(Icons.key,color: Colors.black,),
                      ),
                    ),
                    SizedBox(height: 18,),
                    Card(
                      child: ListTile(
                        
                        trailing: Switch(

                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                        tileColor: Color.fromARGB(139, 255, 255, 255),
                        title: Text("Notifications"),
                        leading: Icon(Icons.notifications,color: Colors.black,),
                      ),
                    ),

                    SizedBox(height: 18,),
                     Card(
                      child: ListTile(
                        onTap: () {

                        },
                          trailing: Icon(Icons.arrow_right,size: 40,color: Colors.black,),
                       
                        tileColor: Color.fromARGB(139, 255, 255, 255),
                        title: Text("About Us"),
                        leading: Icon(Icons.newspaper,color: Colors.black,),
                      ),
                    ),
                    SizedBox(height: 18,),
                     SizedBox(height: 18,),
                     Card(
                      child: ListTile(
                        onTap: () {

                        },
                          trailing: Icon(Icons.arrow_right,size: 40,color: Colors.black,),
                       
                        tileColor: Color.fromARGB(139, 255, 255, 255),
                        title: Text("Privacy and Policy"),
                        leading: Icon(Icons.policy,color: Colors.black,),
                      ),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
