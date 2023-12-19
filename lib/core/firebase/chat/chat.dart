import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/core/firebase/chat/chat_models.dart';

class ChatControls {
  ChatControls() {
    instance = FirebaseFirestore.instance.collection('chat');
  }
  late CollectionReference<Map<String, dynamic>> instance;
  Future<void> sendMessageToAdmin(Message message) async {
    instance
        .doc('toAdmin')
        .collection(message.fromUserId)
        .doc(message.dateAndTime.toString())
        .set(Message.toMap(message));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String userId) {
    return instance.doc('toAdmin').collection(userId).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getAllMessages() {
    return instance.doc('toAdmin').snapshots();
  }
  
}
