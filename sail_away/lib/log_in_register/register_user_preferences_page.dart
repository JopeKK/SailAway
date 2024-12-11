import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/cubit/log_in_cubit.dart';
import 'package:sail_away/data/model/allergy.dart';
import 'package:sail_away/data/model/product.dart';

class RegisterUserPreferencesPage extends StatefulWidget {
  final List<ProductModel> products;
  final List<AllergyModel> allergies;

  const RegisterUserPreferencesPage({
    super.key,
    required this.products,
    required this.allergies,
  });

  @override
  State<RegisterUserPreferencesPage> createState() =>
      _RegisterUserPreferencesPageState();
}

class _RegisterUserPreferencesPageState
    extends State<RegisterUserPreferencesPage> {
  List<AllergyModel> wybraneAlergie = [];
  List<ProductModel> wybraneProdukty = [];

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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.15),
            const Text(
              'Masz jakies alergie?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: screenHeight * 0.05),
            buildDropdownWithCheckboxesAllergies(
              title: "Zaznacz to tutaj",
              items: widget.allergies,
              selectedItems: wybraneAlergie,
              onSelectionChanged: (selected) {
                setState(() {
                  wybraneAlergie = selected;
                });
              },
              widgetHeight: screenHeight * 0.4,
            ),
            SizedBox(height: screenHeight * 0.1),
            const Text(
              'A moze nie lubisz jakiegoś produktu?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: screenHeight * 0.05),
            buildDropdownWithCheckboxesProducts(
              title: "Zaznacz je tutaj",
              items: widget.products,
              selectedItems: wybraneProdukty,
              onSelectionChanged: (selected) {
                setState(() {
                  wybraneProdukty = selected;
                });
              },
              widgetHeight: screenHeight * 0.4,
            ),
            SizedBox(height: screenHeight * 0.1),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
              width: screenWidth * 0.8,
              height: screenHeight * 0.06,
              child: ElevatedButton(
                onPressed: () =>
                    registerToTheApp(context, wybraneProdukty, wybraneAlergie),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.strongAccentColor,
                ),
                child: const Text(
                  'Zarejestruj się',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownWithCheckboxesProducts({
    required String title,
    required List<ProductModel> items,
    required List<ProductModel> selectedItems,
    required Function(List<ProductModel>) onSelectionChanged,
    required double widgetHeight,
  }) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Container(
          height: widgetHeight,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: items.map((item) {
                return CheckboxListTile(
                  title: Text(item.name),
                  value: selectedItems.contains(item),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        selectedItems.add(item);
                      } else {
                        selectedItems.remove(item);
                      }
                      onSelectionChanged(selectedItems);
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownWithCheckboxesAllergies({
    required String title,
    required List<AllergyModel> items,
    required List<AllergyModel> selectedItems,
    required Function(List<AllergyModel>) onSelectionChanged,
    required double widgetHeight,
  }) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Container(
          height: widgetHeight,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: items.map((item) {
                return CheckboxListTile(
                  title: Text(item.name),
                  value: selectedItems.contains(item),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        selectedItems.add(item);
                      } else {
                        selectedItems.remove(item);
                      }
                      onSelectionChanged(selectedItems);
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

registerToTheApp(BuildContext context, List<ProductModel> wybraneAlergie,
    List<AllergyModel> wybraneProdukty) {
  final logInCubit = BlocProvider.of<LogInCubit>(context);
  logInCubit.registerUserPreferences(wybraneProdukty, wybraneAlergie);
}
