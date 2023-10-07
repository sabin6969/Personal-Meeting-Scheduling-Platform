import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:personalmeetingschedulingplatform/utils/flutter_toast_message.dart';
import 'package:personalmeetingschedulingplatform/validations/email_validation.dart';
import 'package:personalmeetingschedulingplatform/validations/name_validation.dart';
import 'package:personalmeetingschedulingplatform/validations/password_validations.dart';
import 'package:personalmeetingschedulingplatform/views/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key,});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.40,
                width: size.width,
                child: Image.asset(
                  "asset/images/Logo.png", // Replace with your logo image path
                  fit: BoxFit.cover,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.06,
                        vertical: size.height * 0.03,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              final message =
                                  NameValidator.validateName(value!);
                              return message;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                              ),
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: "Enter your name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email,
                              ),
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: "Enter your email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              final message =
                                  EmailValidation.validateEmail(value!);
                              return message;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: "Enter your password",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              final message =
                                  PasswordValidation.validatePassword(value!);
                              return message;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: "Confirm your password",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              final message =
                                  PasswordValidation.validatePassword(value!);
                              return message;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minWidth: size.width,
                            color: const Color(0xFFEF8509),
                            height: size.height * 0.06,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (confirmPasswordController.text
                                        .compareTo(passwordController.text) ==
                                    0) {
                                } else {
                                  ToastMessage.showToastMessage(
                                    "Both password must match",
                                  );
                                }
                              }
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const Text(
                            "Or",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: size.width,
                            child: GoogleAuthButton(
                              onPressed: () {
                                // Handle Google sign up logic here
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigate to the login page
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
