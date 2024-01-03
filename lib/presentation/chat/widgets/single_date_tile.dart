import 'package:cyber_bee/constants/constants.dart';
import 'package:flutter/material.dart';

class MessageDateTile extends StatelessWidget {
  const MessageDateTile({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Text(
          date,
          style: MyTextStyles.h6,
        ),
      ),
    );
  }
}
