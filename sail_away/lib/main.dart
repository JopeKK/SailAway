import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/cubit/log_in_cubit.dart';
import 'package:sail_away/data/repository.dart';
import 'package:sail_away/logic/log_in_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sail_away/main_pages/main_page.dart';
import 'package:sail_away/navigation/move_to_main_page.dart';
import 'package:sail_away/sail_away_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  // await FirebaseAppCheck.instance.activate(
  //   androidProvider: AndroidProvider.debug,
  //   appleProvider: AppleProvider.debug,
  // );
  // FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  SailAwayApiConnector.instance.dataConnect.useDataConnectEmulator('localhost',9399);
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
      home: BlocProvider(
        create: (context) => LogInCubit(DataRepository()),
        child: const LogInLogic(),
      ),
    );
  }
}
