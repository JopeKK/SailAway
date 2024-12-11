import 'package:flutter/material.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/detail_trip/tips_page.dart';

class TransportCreatePage extends StatefulWidget {
  const TransportCreatePage({super.key});

  @override
  State<TransportCreatePage> createState() => _TransportCreatePageState();
}

class _TransportCreatePageState extends State<TransportCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stworz transport',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.accentColor,
        leading: IconButton(
          onPressed: () => moveBackToDetailMainScreen(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            
          ],
        ),
      ),
    );
  }
}