import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/cubit/detail_trip_cubit.dart';
import 'package:sail_away/cubit/main_cubit.dart';
import 'package:sail_away/data/repository.dart';
import 'package:sail_away/logic/detail_trip_logic.dart';

class MoveToDetailPage extends StatelessWidget {
  final String id;
  final MainCubit mainCubit;
  const MoveToDetailPage({
    super.key,
    required this.id,
    required this.mainCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailTripCubit(DataRepository(), id,mainCubit),
      child: const DetailTripLogic(),
    );
  }
}
