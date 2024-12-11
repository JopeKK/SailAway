import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sail_away/common/colors.dart';
import 'package:sail_away/common/crew_tile.dart';
import 'package:sail_away/cubit/detail_trip_cubit.dart';
import 'package:sail_away/data/model/user.dart';
import 'package:sail_away/detail_trip/tips_page.dart';

class CrewPage extends StatefulWidget {
  final String uid;
  final List<UserModel> members;
  final String authorId;

  const CrewPage({
    super.key,
    required this.members,
    required this.uid,
    required this.authorId,
  });

  @override
  State<CrewPage> createState() => _CrewPageState();
}

class _CrewPageState extends State<CrewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista załogi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.accentColor,
        leading: IconButton(
          onPressed: () => moveBackToDetailMainScreen(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.members.length,
        itemBuilder: (context, index) {
          final item = widget.members[index];
          bool isAuthor = false;
          if (item.authId == widget.authorId) {
            isAuthor = true;
          }

          return CrewTile(
            name: item.name,
            icon: Icons.remove,
            onPressed: () => removeUserFromGroup(context, item.authId),
            isAuthor: isAuthor,
          );
        },
      ),
    );
  }
}

removeUserFromGroup(BuildContext context, String authId) {
  final detailCubit = BlocProvider.of<DetailTripCubit>(context);
  detailCubit.removeUserWithId(authId);
}
