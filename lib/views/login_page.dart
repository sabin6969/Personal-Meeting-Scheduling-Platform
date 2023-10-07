import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:personalmeetingschedulingplatform/controller/auth_controller.dart';
import 'package:personalmeetingschedulingplatform/provider/remember_me_provider.dart';
import 'package:personalmeetingschedulingplatform/provider/show_password_provider.dart';
import 'package:personalmeetingschedulingplatform/validations/email_validation.dart';
import 'package:personalmeetingschedulingplatform/validations/password_validations.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ShowPasswordProvider showPasswordProvider =
        Provider.of<ShowPasswordProvider>(context, listen: false);
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.40,
                width: size.width,
                child: Image.asset(
                  "asset/images/Logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              Form(
                key: globalKey,
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
                            controller: emailController,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            validator: (value) {
                              final message =
                                  EmailValidation.validateEmail(value!);
                              return message;
                            },
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
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Consumer<ShowPasswordProvider>(
                            builder: (context, value, child) {
                              return TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  final message =
                                      PasswordValidation.validatePassword(
                                          value!);
                                  return message;
                                },
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                obscureText: showPasswordProvider.isHidden,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      value.changeHiddenStatus();
                                    },
                                    icon: value.isHidden
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                  ),
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
                              );
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Consumer<RememberMeProvider>(
                                      builder: (context, value, child) {
                                    return Checkbox(
                                      value: value.isSelected,
                                      onChanged: (v) {
                                        value.changeSelectedStatus(v!);
                                      },
                                    );
                                  }),
                                  const Text(
                                    "Remember me",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, "forgotpassword");
                                },
                                child: const Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minWidth: size.width,
                            color: const Color(0xFFEF8509),
                            height: size.height * 0.06,
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                AuthController.signInUser(
                                  emailController.text.trim(),
                                  passwordController.text,
                                  context,
                                );
                              }
                            },
                            child: const Text(
                              "Login",
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
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: size.width,
                            child: GoogleAuthButton(
                              onPressed: () {},
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have any account?",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'signup');
                                },
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          )
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
