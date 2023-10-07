import 'package:flutter/material.dart';
import 'package:personalmeetingschedulingplatform/controller/auth_controller.dart';

class AskForLogOut {
  static askForLogOut(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Are you sure that you want to logout?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () async {
                  await auth.signOut().then(
                    (value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "login", (route) => false);
                    },
                  );
                },
                child: const Text("Yes"),
              )
            ],
          );
        });
  }
}
