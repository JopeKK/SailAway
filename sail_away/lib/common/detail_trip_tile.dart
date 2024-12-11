import 'package:flutter/material.dart';
import 'package:sail_away/common/colors.dart';

class DetailTripTile extends StatefulWidget {
  final String name;
  final IconData icon;
  final GestureTapCallback? onTap;

  const DetailTripTile({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  State<DetailTripTile> createState() => _MainMenuTripTileState();
}

class _MainMenuTripTileState extends State<DetailTripTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        color: AppColors.backgroundColor,
        elevation: 1,
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
                    widget.name,
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
      ),
    );
  }
}
