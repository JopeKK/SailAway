import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/cubit/main_cubit.dart';

class JoinTripPage extends StatefulWidget {
  const JoinTripPage({super.key});

  @override
  State<JoinTripPage> createState() => _JoinTripPageState();
}

class _JoinTripPageState extends State<JoinTripPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => moveBackToMainScreen(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'SailAway',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.accentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(child: Text('Dołącz do rejsu')),
            const SizedBox(height: 20),
            const Text('Podaj kod rejsu:'),
            const SizedBox(height: 10),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '23535345',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => moveBackToMainScreen(context),
                  child: const Text('Anuluj'),
                ),
                ElevatedButton(
                  onPressed: () => joinNewTrip(context, textController.text),
                  child: const Text('Dołącz'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  moveBackToMainScreen(BuildContext context) {
    final mainCubit = BlocProvider.of<MainCubit>(context);
    mainCubit.moveToMainPage();
  }

  joinNewTrip(BuildContext context, String code) {
    final mainCubit = BlocProvider.of<MainCubit>(context);
    mainCubit.joinExistingTrip(code);
  }
}
