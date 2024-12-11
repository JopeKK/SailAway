import 'package:flutter/material.dart';
import 'package:sail_away/common/colors.dart';

class TipsTile extends StatefulWidget {
  final String title;
  final String description;

  const TipsTile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<TipsTile> createState() => _MainMenuTripTileState();
}

class _MainMenuTripTileState extends State<TipsTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
