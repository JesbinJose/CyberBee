import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/core/firebase/chat/chat.dart';
import 'package:cyber_bee/core/firebase/chat/chat_models.dart';
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
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: StreamBuilder(
              stream: ChatControls().getMessages(userId),
              builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final Message message = Message.fromMap(
                        snapshot.data!.docs[index],
                      );
                      final bool isuser = message.touserId == 'true';
                      return Align(
                        alignment: isuser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
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
                            color: isuser
                                ? MyColors.primaryRedColor
                                : MyColors.textWhiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(10),
                              topRight: const Radius.circular(10),
                              bottomLeft: isuser
                                  ? const Radius.circular(10)
                                  : Radius.zero,
                              bottomRight: isuser
                                  ? Radius.zero
                                  : const Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            message.message,
                            style: MyTextStyles.h6.copyWith(
                              color: isuser ? null : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => k10Height,
                    itemCount: snapshot.data!.docs.length,
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          MessageEditPartChatScreen(
            message: message,
            userId: userId,
          ),
        ],
      ),
    );
  }
}

class MessageEditPartChatScreen extends StatelessWidget {
  const MessageEditPartChatScreen({
    super.key,
    required this.message,
    required this.userId,
  });

  final TextEditingController message;
  final String userId;

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
            ),
          ],
        ),
      ),
    );
  }
}
