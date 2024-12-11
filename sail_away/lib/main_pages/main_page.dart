import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/common/main_menu_trip_tile.dart';
import 'package:sail_away/cubit/main_cubit.dart';
import 'package:sail_away/data/model/trip.dart';

class MainPage extends StatefulWidget {
  final List<TripModel> trips;
  const MainPage({
    super.key,
    required this.trips,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SailAway',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.accentColor,
        actions: [
          IconButton(
              onPressed: () => moveToProfile(context),
              icon: const Icon(Icons.account_circle))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.trips.length,
                itemBuilder: (context, index) {
                  final item = widget.trips[index];
                  return MainMenuTripTile(id: item.id, name: item.name, date: item.startingData!);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => createNewTrip(context),
                    child: const Text("Stworz nowy rejs")),
                ElevatedButton(
                    onPressed: () => joinPage(context),
                    child: const Text("Dolacz do rejsu"))
              ],
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

createNewTrip(BuildContext context) {
  final mainCubit = BlocProvider.of<MainCubit>(context);
  mainCubit.moveToCreatePage();
}

moveToProfile(BuildContext context) {
  final mainCubit = BlocProvider.of<MainCubit>(context);
  mainCubit.moveToProfile();
}

joinPage(BuildContext context) {
  final mainCubit = BlocProvider.of<MainCubit>(context);
  mainCubit.moveToJoinPage();
}
