import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/error_page.dart';
import 'package:sail_away/common/loading_page.dart';
import 'package:sail_away/cubit/main_cubit.dart';
import 'package:sail_away/main.dart';
import 'package:sail_away/main_pages/create_trip_page.dart';
import 'package:sail_away/main_pages/join_trip.dart';
import 'package:sail_away/main_pages/main_page.dart';
import 'package:sail_away/main_pages/profile.dart';
import 'package:sail_away/main_pages/share_created_trip_page.dart';

class MainLogic extends StatelessWidget {
  const MainLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state is MainInitial) {
            return const LoadingPage();
          } else if (state is MoveToProfilePage) {
            return Profile(
              name: state.name,
              email: state.email,
              products: state.products,
              allergies: state.allergies,
            );
          } else if (state is MoveToMainPage) {
            return MainPage(trips: state.trips);
          } else if (state is UserSignedOut) {
            return const MyApp();
          } else if (state is CreateNewTrip) {
            return const CreateTripPage();
          } else if (state is ShareNewTrip) {
            return ShareCreatedTripPage(
              name: state.name,
              inviteCode: state.code,
            );
          } else if (state is JoinTrip) {
            return const JoinTripPage();
          } else if (state is Error) {
            return ErrorPage(errorMessage: state.errorMessage);
          }

          return const ErrorPage(errorMessage: 'problem na main');
        },
      ),
    );
  }
}
