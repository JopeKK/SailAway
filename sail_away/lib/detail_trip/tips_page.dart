import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/common/tips_tile.dart';
import 'package:sail_away/cubit/detail_trip_cubit.dart';
import 'package:sail_away/data/model/tips.dart';

class TipsPage extends StatefulWidget {
  final List<TipModel> items;
  const TipsPage({
    super.key,
    required this.items,
  });

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Porady',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.accentColor,
        leading: IconButton(
          onPressed: () => moveBackToDetailMainScreen(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return TipsTile(
            title: item.title,
            description: item.description,
          );
        },
      ),
    );
  }
}

moveBackToDetailMainScreen(BuildContext context) {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  detailCubit.getMainScreen();
}
