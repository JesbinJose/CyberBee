import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/core/firebase/chat/chat.dart';
import 'package:cyber_bee/core/firebase/chat/chat_models.dart';
import 'package:cyber_bee/presentation/chat/widgets/message_edit.dart';
import 'package:cyber_bee/presentation/chat/widgets/message_tile.dart';
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
                      return SingleMessageTile(
                        isuser: isuser,
                        message: message,
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
