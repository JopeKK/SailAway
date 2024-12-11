import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/common/transport_tile.dart';
import 'package:sail_away/cubit/detail_trip_cubit.dart';
import 'package:sail_away/data/model/transport.dart';
import 'package:sail_away/detail_trip/tips_page.dart';

class TransportPage extends StatefulWidget {
  final List<TransportModel> transport;
  final String uid;
  const TransportPage({
    super.key,
    required this.transport,
    required this.uid,
  });

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  final TextEditingController nameControler = TextEditingController();
  String transportName = '';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Porady',
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
            Expanded(
              child: ListView.builder(
                itemCount: widget.transport.length,
                itemBuilder: (context, index) {
                  final item = widget.transport[index];
                  bool isMine = false;
                  if (item.members.contains(widget.uid)) {
                    isMine = true;
                  }
                  return TransportTile(
                    name: item.type,
                    onPressedRemove: () => removeTransport(context, item.id),
                    onPressedJoin: () => joinToTransport(context, item.id),
                    myTransport: isMine,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
                  width: screenWidth * 0.5,
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
                    controller: nameControler,
                    onChanged: (String value) {
                      setState(() {
                        transportName = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Samolot Warszawa',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.3,
                  child: ElevatedButton(
                    onPressed: () => moveToAddTransport(context, transportName),
                    child: const Text(
                      'Dodaj transport',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}

joinToTransport(BuildContext context, String id) {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  detailCubit.joinToTransport(id);
}

moveToAddTransport(BuildContext context, String transportName) {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  detailCubit.createTransport(transportName);
}

removeTransport(BuildContext context, String id) {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  detailCubit.removeTransport(id);
}
