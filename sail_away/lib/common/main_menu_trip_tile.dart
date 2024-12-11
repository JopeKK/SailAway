import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/cubit/main_cubit.dart';
import 'package:sail_away/navigation/move_to_detail_page.dart';

class MainMenuTripTile extends StatefulWidget {
  final String id;
  final String name;
  final DateTime date;

  const MainMenuTripTile({
    super.key,
    required this.id,
    required this.name,
    required this.date,
  });

  @override
  State<MainMenuTripTile> createState() => _MainMenuTripTileState();
}

class _MainMenuTripTileState extends State<MainMenuTripTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => moveToDetailPageOfTrip(context, widget.id),
      child: Card(
        color: AppColors.backgroundColor,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text("${DateFormat('yyyy-MM-dd').format(widget.date)}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

moveToDetailPageOfTrip(BuildContext context, String id) {
  MainCubit mcubit = BlocProvider.of<MainCubit>(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MoveToDetailPage(
        id: id,
        mainCubit: mcubit,
      ),
    ),
  );
}
