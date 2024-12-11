import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/common/detail_trip_tile.dart';
import 'package:sail_away/cubit/detail_trip_cubit.dart';

class DetailMainPage extends StatefulWidget {
  final String name;
  final bool tips;
  final bool transport;

  const DetailMainPage({
    super.key,
    required this.name,
    required this.tips,
    required this.transport,
  });

  @override
  State<DetailMainPage> createState() => _MainPageState();
}

class _MainPageState extends State<DetailMainPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.accentColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailTripTile(
              name: 'Czlonkowie rejsu',
              icon: Icons.people,
              onTap: () => openDetailCrewList(context),
            ),
            SizedBox(height: screenHeight * 0.025),
            DetailTripTile(
              name: 'Lista zakupow',
              icon: Icons.shopping_bag,
              onTap: () => openDetailShoppingList(context),
            ),
            if (widget.transport) SizedBox(height: screenHeight * 0.025),
            if (widget.transport)
              DetailTripTile(
                name: 'Sposoby dojazdu',
                icon: Icons.train,
                onTap: () => openDetailTransport(context),
              ),
            if (widget.tips) SizedBox(height: screenHeight * 0.025),
            if (widget.tips)
              DetailTripTile(
                name: 'Porady',
                icon: Icons.tips_and_updates,
                onTap: () => openDetailTips(context),
              ),
            SizedBox(height: screenHeight * 0.3),
            ElevatedButton(
              onPressed: () async {
                if (await leaveTrip(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Wyjdz z rejsu'),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}

Future<bool> leaveTrip(BuildContext context) async {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  return await detailCubit.removeUser();
}

openDetailTransport(BuildContext context) {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  detailCubit.moveToTransport();
}

openDetailTips(BuildContext context) {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  detailCubit.moveToTips();
}

openDetailShoppingList(BuildContext context) {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  detailCubit.moveToShoppingList();
}

openDetailCrewList(BuildContext context) {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  detailCubit.moveToCrew();
}
