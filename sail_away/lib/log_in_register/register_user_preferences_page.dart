import 'package:flutter/material.dart';
import 'package:sail_away/common/colors.dart';

class RegisterUserPreferencesPage extends StatefulWidget {
  const RegisterUserPreferencesPage({super.key});

  @override
  State<RegisterUserPreferencesPage> createState() =>
      _RegisterUserPreferencesPageState();
}

class _RegisterUserPreferencesPageState
    extends State<RegisterUserPreferencesPage> {
  List<String> alergie = [
    "Alergia 1",
    "Alergia 2",
    "Alergia 3",
    "Alergia 4",
    "Alergia 5",
    "Alergia 6",
    "Alergia 7",
    "Alergia 8",
    "Alergia 9",
  ];
  List<String> czegoNieLube = ["Product 4", "Product 5", "Product 6"];
  List<String> wybraneAlergie = [];
  List<String> wybraneProdukty = [];

  void submitSelectedProducts() {
    print("Wybrane alergie: $wybraneAlergie");
    print("Wybrane produkty: $wybraneProdukty");
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
      ),
      body: SingleChildScrollView(
        // To allow scrolling of the entire screen content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.15),
            const Text(
              'Masz jakies alergie?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: screenHeight * 0.05),
            buildDropdownWithCheckboxes(
              title: "Zaznacz je tutaj",
              items: alergie,
              selectedItems: wybraneAlergie,
              onSelectionChanged: (selected) {
                setState(() {
                  wybraneAlergie = selected;
                });
              },
            ),
            SizedBox(height: screenHeight * 0.1),
            const Text(
              'A moze nie lubisz jakiegoś produktu?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: screenHeight * 0.05),
            buildDropdownWithCheckboxes(
              title: "Zaznacz to tutaj",
              items: czegoNieLube,
              selectedItems: wybraneProdukty,
              onSelectionChanged: (selected) {
                setState(() {
                  wybraneProdukty = selected;
                });
              },
            ),
            SizedBox(height: screenHeight * 0.1),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
              width: screenWidth * 0.8,
              height: screenHeight * 0.06,
              child: ElevatedButton(
                onPressed: submitSelectedProducts,
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

  Widget buildDropdownWithCheckboxes({
    required String title,
    required List<String> items,
    required List<String> selectedItems,
    required Function(List<String>) onSelectionChanged,
  }) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Container(
          height: 200, // Defining the height for the scrollable list
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: SingleChildScrollView(
            // Enables scrolling inside the list
            child: Column(
              children: items.map((item) {
                return CheckboxListTile(
                  title: Text(item),
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
