import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  late String touserId;
  late DateTime dateAndTime;
  late String message;
  late String fromUserId;
  Message({
    required this.touserId,
    required this.dateAndTime,
    required this.message,
    required this.fromUserId,
  });
  Message.fromMap(final DocumentSnapshot<Map<String, dynamic>> data) {
    touserId = data['toUser'].toString();
    dateAndTime = (data['time'] as Timestamp).toDate();
    message = data['message'];
    fromUserId = data['fromUser'];
  }
  static Map<String, dynamic> toMap(Message message) {
    return {
      'time': message.dateAndTime,
      'message': message.message,
      'fromUser': message.fromUserId,
      'toUser': message.touserId == 'Admin',
    };
  }
}
