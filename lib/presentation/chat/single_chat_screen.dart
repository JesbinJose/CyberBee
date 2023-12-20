import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/presentation/chat/widgets/send_message_button.dart';
import 'package:flutter/material.dart';

class SingleChatScreen extends StatelessWidget {
  SingleChatScreen({
    super.key,
    required this.isAdmin,
    required this.userId,
    required this.userName,
  });
  final bool isAdmin;
  final String userId;
  final String userName;
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userName,
        ),
      ),
      body: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                color: MyColors.secondaryGreyColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
              ),
              width: double.infinity,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 100,
                    child: TextField(
                      controller: message,
                    ),
                  ),
                  SendMessageButton(
                    toUserId: 'Admin',
                    message: message,
                    fromUserId: userId,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
