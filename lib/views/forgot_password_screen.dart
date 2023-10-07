import 'package:flutter/material.dart';
import 'package:personalmeetingschedulingplatform/controller/auth_controller.dart';
import 'package:personalmeetingschedulingplatform/validations/email_validation.dart';

class ForgotScreenPage extends StatefulWidget {
  const ForgotScreenPage({super.key});

  @override
  State<ForgotScreenPage> createState() => _ForgotScreenPageState();
}

class _ForgotScreenPageState extends State<ForgotScreenPage> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: TextFormField(
                    validator: (value) {
                      final message = EmailValidation.validateEmail(value!);
                      return message;
                    },
                    controller: emailController,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: "Enter your email",
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minWidth: size.width,
                    color: const Color(0xFFEF8509),
                    height: size.height * 0.06,
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        AuthController.sendResetLink(
                            emailController.text.trim(), context);
                      }
                    },
                    child: const Text(
                      "Send reset link",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
