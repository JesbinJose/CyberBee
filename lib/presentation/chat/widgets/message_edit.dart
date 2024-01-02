import 'package:cyber_bee/presentation/chat/widgets/send_message_button.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class MessageEditPartChatScreen extends StatelessWidget {
  const MessageEditPartChatScreen({
    super.key,
    required this.message,
    required this.userId, required this.scroll,
  });

  final TextEditingController message;
  final String userId;
  final ScrollController scroll;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          color: MyColors.secondaryGreyColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(5),
          ),
        ),
        width: double.infinity,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: const BoxConstraints(
                minHeight: 50,
                maxHeight: 200,
              ),
              width: MediaQuery.sizeOf(context).width - 100,
              child: TextField(
                minLines: 1,
                maxLines: 50,
                style: MyTextStyles.h4,
                controller: message,
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: MyTextStyles.h4.copyWith(
                    color: Colors.white38,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SendMessageButton(
              toUserId: 'Admin',
              message: message,
              fromUserId: userId,
              scroll:scroll
            ),
          ],
        ),
      ),
    );
  }
}
