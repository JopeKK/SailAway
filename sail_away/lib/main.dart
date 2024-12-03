import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sail_away/log_in_register/log_in_page.dart';
import 'package:sail_away/log_in_register/register_user_info_page.dart';
import 'package:sail_away/log_in_register/register_user_preferences_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const RegisterUserInfoPage(),
      // home: const LogInPage(),
      home: const RegisterUserPreferencesPage(),
    );
  }
}
