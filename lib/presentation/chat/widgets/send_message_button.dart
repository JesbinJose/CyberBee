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
    required this.scroll,
  });
  final String toUserId;
  final TextEditingController message;
  final String fromUserId;
  final ScrollController scroll;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      decoration: const BoxDecoration(
        color: MyColors.primaryRedColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        onTap: () async {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              scroll.animateTo(
                0.0, // Scroll to offset 0
                duration: const Duration(
                  milliseconds: 300,
                ), // Adjust duration as needed
                curve: Curves.easeInOut, // Use a smooth animation curve
              );
            },
          );
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
