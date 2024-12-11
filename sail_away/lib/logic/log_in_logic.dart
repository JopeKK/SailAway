import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/error_page.dart';

import 'package:sail_away/cubit/log_in_cubit.dart';
import 'package:sail_away/log_in_register/log_in_page.dart';
import 'package:sail_away/log_in_register/register_user_info_page.dart';
import 'package:sail_away/log_in_register/register_user_preferences_page.dart';
import 'package:sail_away/navigation/move_to_main_page.dart';

class LogInLogic extends StatelessWidget {
  const LogInLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LogInCubit, LogInState>(
        builder: (context, state) {
          if (state is LogIn) {
            return const LogInPage();
          } else if (state is Error) {
            return ErrorPage(errorMessage: state.errorMessage);
          } else if (state is RegisterPart1) {
            return const RegisterUserInfoPage();
          } else if (state is RegisterPart2) {
            return RegisterUserPreferencesPage(
              products: state.products,
              allergies: state.allergies,
            );
          } else if (state is MoveToMainScreen) {
            return const MoveToMainPage();
          }

          return const ErrorPage(errorMessage: 'problem na starcie');
        },
      ),
    );
  }
}
