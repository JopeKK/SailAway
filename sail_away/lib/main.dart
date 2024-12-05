import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/cubit/log_in_cubit.dart';
import 'package:sail_away/data/repository.dart';
import 'package:sail_away/log_in_register/log_in_page.dart';
import 'package:sail_away/log_in_register/register_user_info_page.dart';
import 'package:sail_away/log_in_register/register_user_preferences_page.dart';
import 'package:sail_away/logic/log_in_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
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
      //home: const RegisterUserInfoPage(),
      //home: const LogInPage(),
      //home: const RegisterUserPreferencesPage(),
      home: BlocProvider(
        create: (context) => LogInCubit(DataRepository()),
        child: const LogInLogic(),
      ),
    );
  }
}
