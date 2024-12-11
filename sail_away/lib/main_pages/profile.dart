import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/cubit/main_cubit.dart';
import 'package:sail_away/data/model/allergy.dart';
import 'package:sail_away/data/model/product.dart';

class Profile extends StatefulWidget {
  final String name;
  final String email;
  final List<ProductModel> products;
  final List<AllergyModel> allergies;

  const Profile({
    super.key,
    required this.name,
    required this.email,
    required this.products,
    required this.allergies,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name),
            Text(widget.email),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final item = widget.products[index];
                  return Text(item.name);
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: widget.allergies.length,
                itemBuilder: (context, index) {
                  final item = widget.allergies[index];
                  return Text(item.name);
                },
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () => signOut(context),
                child: const Text("Wyloguj sie "),
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
          ],
        ),
      ),
    );
  }
}

signOut(BuildContext context) {
  final mainCubit = BlocProvider.of<MainCubit>(context);
  mainCubit.signOut();
}

moveBackToMainScreen(BuildContext context) {
  final mainCubit = BlocProvider.of<MainCubit>(context);
  mainCubit.moveToMainPage();
}
