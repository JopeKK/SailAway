import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/cubit/main_cubit.dart';
import 'package:sail_away/data/repository.dart';
import 'package:sail_away/logic/main_logic.dart';

class MoveToMainPage extends StatelessWidget {
  const MoveToMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MainCubit(DataRepository()),
        child: const MainLogic(),
      );
  }
}