import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/cubit/main_cubit.dart';

class ShareCreatedTripPage extends StatefulWidget {
  final String name;
  final String inviteCode;
  const ShareCreatedTripPage({
    super.key,
    required this.name,
    required this.inviteCode,
  });

  @override
  State<ShareCreatedTripPage> createState() => _ShareCreatedTripPageState();
}

class _ShareCreatedTripPageState extends State<ShareCreatedTripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SailAway',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.accentColor,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Utworzyles grupe o nazwie ${widget.name}"),
            const Text("Zapros do niej swoich znajomych"),
            const Text("za pomoca kodu"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.inviteCode),
                IconButton(
                    onPressed: () => Clipboard.setData(
                                ClipboardData(text: widget.inviteCode))
                            .then(
                          (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Skopiowano do schowka')),
                            );
                          },
                        ),
                    icon: const Icon(Icons.copy))
              ],
            ),
            ElevatedButton(
              onPressed: () => _moveBackToMainScreen(context),
              child: const Text("Wroc do ekranu glownego"),
            ),
          ],
        ),
      ),
    );
  }
}

_moveBackToMainScreen(BuildContext context) {
  final mainCubit = BlocProvider.of<MainCubit>(context);
  mainCubit.moveToMainFirstPage();
}
