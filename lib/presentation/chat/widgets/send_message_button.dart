import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/core/firebase/chat/chat.dart';
import 'package:cyber_bee/core/firebase/chat/chat_models.dart';
import 'package:flutter/material.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({
    super.key,
    required this.toUserId,
    required this.message,
    required this.fromUserId,
  });
  final String toUserId;
  final TextEditingController message;
  final String fromUserId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      decoration: const BoxDecoration(
        color: MyColors.primaryRedColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        onTap: () {
          if (message.text.isNotEmpty) {
            final Message message = Message(
              touserId: toUserId,
              dateAndTime: DateTime.now(),
              message: this.message.text,
              fromUserId: fromUserId,
            );
            ChatControls().sendMessageToAdmin(message);
            this.message.text = '';
          }
        },
        child: Transform.rotate(
          angle: -0.7,
          child: const Icon(
            Icons.send,
          ),
        ),
      ),
    );
  }
}
