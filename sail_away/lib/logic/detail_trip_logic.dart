import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/error_page.dart';
import 'package:sail_away/common/loading_page.dart';
import 'package:sail_away/cubit/detail_trip_cubit.dart';
import 'package:sail_away/detail_trip/Detail_main_page.dart';
import 'package:sail_away/detail_trip/crew_page.dart';
import 'package:sail_away/detail_trip/tips_page.dart';
import 'package:sail_away/detail_trip/transport_page.dart';

class DetailTripLogic extends StatelessWidget {
  const DetailTripLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailTripCubit, DetailTripState>(
        builder: (context, state) {
          if (state is DetailInit) {
            return const LoadingPage();
          } else if (state is DetailTripStateMain) {
            return DetailMainPage(
              name: state.name,
              tips: state.tips,
              transport: state.transport,
            );
          } else if (state is Error) {
            return ErrorPage(errorMessage: state.errorMessage);
          } else if (state is loadingScreen) {
            return const LoadingPage();
          } else if (state is TipsScreen) {
            return TipsPage(items: state.tips);
          } else if (state is CrewScreen) {
            return CrewPage(
              members: state.members,
              uid: state.uid,
              authorId: state.authorId,
            );
          } else if (state is TransportScreen) {
            return TransportPage(
              transport: state.transports,
              uid: state.uid,
            );
          }

          return const ErrorPage(errorMessage: 'problem na starcie');
        },
      ),
    );
  }
}
