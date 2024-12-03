import 'package:flutter/material.dart';
import 'package:sail_away/common/colors.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

//TODO: moze warto zmieni kolor ten grey na ten co maja guziki cos chyba fajniej bedzie

class _LogInPageState extends State<LogInPage> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  String email = '';
  String password = '';
  bool passVisibility = true;

  @override
  void dispose() {
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
          Flexible(
            flex: 2,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1),
                const Text(
                  'Cześć!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Text(
                  'miło cię widzieć',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: Align(
                    widthFactor: screenWidth * 0.8,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Adres emial',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06,
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
                    keyboardType: TextInputType.emailAddress,
                    controller: controllerEmail,
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
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: Align(
                    widthFactor: screenWidth * 0.8,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Hasło',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06,
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
                    onChanged: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: passVisibility,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passVisibility = !passVisibility;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Text('Odzyskaj hasło'),
                      onTap: () => recoveryPassoword(),
                    ),
                    SizedBox(width: screenWidth * 0.1),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () => logIn(context, email, password),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.strongAccentColor,
                    ),
                    child: const Text(
                      'Zaloguj',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Widzimy sie pierwszy raz? ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    'Dołącz do nas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  onTap: () => moveToRegistration(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

recoveryPassoword() {
  //co pop up podaj mail itd
}

logIn(BuildContext context, String email, String password) {}

moveToRegistration(BuildContext context) {}
