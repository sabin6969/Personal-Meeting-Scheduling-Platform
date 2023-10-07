import 'package:flutter/material.dart';

class ReusableDiaglogBox {
  static dialgoBox(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 40,
              ),
              Text(
                "Loading",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static hideLoadingDialogBox(BuildContext context) {
    Navigator.of(context).pop();
  }
}
