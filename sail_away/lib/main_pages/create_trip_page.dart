import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/cubit/main_cubit.dart';
import 'package:sail_away/main_pages/profile.dart';

class CreateTripPage extends StatefulWidget {
  const CreateTripPage({super.key});

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  DateTime selectedDate = DateTime(2024);
  bool useAdvice = false;
  bool useTransport = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
        leading: IconButton(
          onPressed: () => moveBackToMainScreen(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Podaj nazwę', style: TextStyle(fontSize: 16)),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Wpisz nazwę rejsu',
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            const Text('Podaj datę startu', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Text(
                  selectedDate != null
                      ? "${selectedDate.toLocal()}".split(' ')[0]
                      : 'Nie wybrano daty',
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Wybierz datę'),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            const Text('Rejon', style: TextStyle(fontSize: 16)),
            TextField(
              controller: regionController,
              decoration: const InputDecoration(
                hintText: 'Wpisz rejon',
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              children: [
                Checkbox(
                  value: useAdvice,
                  onChanged: (bool? value) {
                    setState(() {
                      useAdvice = value ?? false;
                    });
                  },
                ),
                const Text('Czy korzystać z porad'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: useTransport,
                  onChanged: (bool? value) {
                    setState(() {
                      useTransport = value ?? false;
                    });
                  },
                ),
                const Text('Czy korzystać z dojazdu'),
              ],
            ),
            SizedBox(height: screenHeight * 0.1),
            Center(
              child: ElevatedButton(
                onPressed: () => createNewTrip(
                  context,
                  nameController.text,
                  regionController.text,
                  selectedDate,
                  useAdvice,
                  useTransport,
                ),
                child: const Text('Stwórz rejs'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

createNewTrip(
  BuildContext context,
  String text,
  String text2,
  DateTime selectedDate,
  bool useAdvice,
  bool useTransport,
) {
  final mainCubit = BlocProvider.of<MainCubit>(context);
  mainCubit.createNewTrip(
    text,
    text2,
    selectedDate,
    useTransport,
    useAdvice,
  );
}
