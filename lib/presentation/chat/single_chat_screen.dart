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
  final ScrollController scrollController = ScrollController();

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
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: StreamBuilder(
                stream: ChatControls().getMessages(userId),
                builder: (context, snapshot) {
                  if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                    final List data = snapshot.data!.docs.reversed.toList();
                    return ListView.separated(
                      reverse: true,
                      itemBuilder: (context, index) {
                        final Message message = Message.fromMap(
                          data[index],
                        );
                        final bool isuser = message.touserId == 'true';
                        return SingleMessageTile(
                          isuser: isuser,
                          message: message,
                        );
                      },
                      separatorBuilder: (context, index) => k10Height,
                      itemCount: data.length,
                    );
                  }
                  return const Center(
                    child: Text(
                      'Send a Chat',
                    ),
                  );
                },
              ),
            ),
          ),
          MessageEditPartChatScreen(
            scroll: scrollController,
            message: message,
            userId: userId,
          ),
        ],
      ),
    );
  }
}
