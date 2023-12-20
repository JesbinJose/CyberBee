import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';
import '../../../core/firebase/chat/chat_models.dart';

class SingleMessageTile extends StatelessWidget {
  const SingleMessageTile({
    super.key,
    required this.isuser,
    required this.message,
  });

  final bool isuser;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isuser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: isuser ? MyColors.primaryRedColor : MyColors.textWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomLeft: isuser ? const Radius.circular(10) : Radius.zero,
            bottomRight: isuser ? Radius.zero : const Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isuser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 280,
                    minWidth: 40,
                  ),
                  child: Text(
                    message.message,
                    textAlign: message.message.length < 10 && !isuser
                        ? TextAlign.right
                        : TextAlign.left,
                    style: TextStyle(
                      color: !isuser ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              getDateandTime('${message.dateAndTime}'),
              style: TextStyle(
                color: !isuser ? Colors.black : Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDateandTime(String dateAndTime) {
    return dateAndTime.split('.').first.split(' ').last.substring(0, 5);
  }
}
