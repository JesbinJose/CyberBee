import 'package:cyber_bee/application/function/date_time.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/core/firebase/chat/chat.dart';
import 'package:cyber_bee/core/firebase/chat/chat_models.dart';
import 'package:cyber_bee/presentation/chat/widgets/message_edit.dart';
import 'package:cyber_bee/presentation/chat/widgets/message_tile.dart';
import 'package:cyber_bee/presentation/chat/widgets/single_date_tile.dart';
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
                    final List messages = snapshot.data!.docs.reversed.toList();
                    return ListView.separated(
                      controller: scrollController,
                      reverse: true,
                      itemBuilder: (context, index) {
                        final Message message = Message.fromMap(
                          messages[index],
                        );
                        String? date;
                        if (index > 0) {
                          date = getDate(
                            message.dateAndTime,
                            Message.fromMap(
                              messages[index - 1],
                            ).dateAndTime,
                            index == messages.length - 1,
                          );
                        }
                        return Column(
                          children: [
                            if (date != null && index == messages.length - 1)
                              MessageDateTile(date: date),
                            SingleMessageTile(
                              isuser: message.touserId == 'true',
                              message: message,
                            ),
                            if (date != null && index != messages.length - 1)
                              MessageDateTile(date: date),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => k10Height,
                      itemCount: messages.length,
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
