import 'package:flutter/material.dart';
import 'package:sail_away/common/colors.dart';

class CrewTile extends StatefulWidget {
  final String name;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isAuthor;

  const CrewTile({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
    required this.isAuthor,
  });

  @override
  State<CrewTile> createState() => _MainMenuTripTileState();
}

class _MainMenuTripTileState extends State<CrewTile> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                if (!widget.isAuthor)
                  IconButton(
                    onPressed: widget.onPressed,
                    icon: Icon(widget.icon),
                  ),
                if (widget.isAuthor) const SizedBox(width: 10),
                if (widget.isAuthor) const Text('Tworca grupy'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
