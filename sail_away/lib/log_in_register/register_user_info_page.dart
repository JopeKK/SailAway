import 'package:flutter/material.dart';
import 'package:sail_away/common/colors.dart';

class RegisterUserInfoPage extends StatefulWidget {
  const RegisterUserInfoPage({super.key});

  @override
  State<RegisterUserInfoPage> createState() => _RegisterUserInfoPageState();
}

class _RegisterUserInfoPageState extends State<RegisterUserInfoPage> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  String name = '';
  String email = '';
  String password = '';
  bool passVisibility = true;

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPass.dispose();
    super.dispose();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.07),
          const Text(
            'Dołącz do nas ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const Text(
            'To tylko 2 proste kroki',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.07),
              const Text(
                'Imię',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: TextField(
              controller: controllerName,
              onChanged: (String value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Tomek Kolanko',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.07),
              const Text(
                'Adres email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: TextField(
              controller: controllerEmail,
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'name@mail.com',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.07),
              const Text(
                'Hasło',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: TextField(
              controller: controllerPass,
              obscureText: passVisibility,
              onChanged: (String value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passVisibility
                          ? passVisibility = false
                          : passVisibility = true;
                    });
                  },
                  icon: passVisibility
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                ),
                hintText: 'password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
            width: screenWidth * 0.8,
            height: screenHeight * 0.06,
            child: ElevatedButton(
              onPressed: () => moveToSecondPartOfRegistration(
                  context, name, email, password),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.strongAccentColor,
              ),
              child: const Text(
                'Przejdź dalej',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Masz juz konto ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              GestureDetector(
                child: const Text(
                  'Zaloguj się',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                onTap: () => moveToLogIn(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

moveToSecondPartOfRegistration(BuildContext context, name, email, password) {}

moveToLogIn(BuildContext context) {}
