import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:personalmeetingschedulingplatform/provider/remember_me_provider.dart';
import 'package:personalmeetingschedulingplatform/provider/show_password_provider.dart';
import 'package:personalmeetingschedulingplatform/views/forgot_password_screen.dart';
import 'package:personalmeetingschedulingplatform/views/login_page.dart';
import 'package:provider/provider.dart';
import 'package:personalmeetingschedulingplatform/views/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShowPasswordProvider()),
        ChangeNotifierProvider(create: (_) => RememberMeProvider()),
      ],
      child: MaterialApp(
        title: "Personal Meeting Scheduling App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        initialRoute: "login",
        routes: {
          "login": (context) => const LoginPage(),
          "fogotpassword": (context) => const ForgotScreenPage(),
          "signup": (context) => const SignupPage(),
        },
      ),
    );
  }
}
