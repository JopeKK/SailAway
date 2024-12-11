import 'package:flutter/material.dart';
import 'package:sail_away/common/colors.dart';

class TransportTile extends StatefulWidget {
  final String name;
  final VoidCallback? onPressedRemove;
  final VoidCallback? onPressedJoin;
  final bool myTransport;

  const TransportTile({
    super.key,
    required this.name,
    required this.onPressedRemove,
    required this.myTransport,
    required this.onPressedJoin,
  });

  @override
  State<TransportTile> createState() => _MainMenuTripTileState();
}

class _MainMenuTripTileState extends State<TransportTile> {
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
                const SizedBox(width: 5),
                if (widget.myTransport) const Icon(Icons.person),
                const SizedBox(width: 5),
                if (!widget.myTransport)
                  ElevatedButton(
                    onPressed: widget.onPressedJoin,
                    child: const Text("Dolacz"),
                  ),
                IconButton(
                  onPressed: widget.onPressedRemove,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
