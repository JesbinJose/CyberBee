import 'dart:io';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseStorage {
  static Future<String?> upladImageToFirebaseStorage(
    final context, {
    required File file,
    required String userId,
  }) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('profile_pics/$userId.jpg');
      final metadata = SettableMetadata(contentType: 'image/png');
      await storageRef.putData(file.readAsBytesSync(), metadata);
      return await storageRef.getDownloadURL();
    } catch (e) {
      mySnakbar(context, e.toString());
    }
    return null;
  }
  static Future<String?> uploadEventImageToFirebaseStorage(
    final context, {
    required File file,
  }) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('profile_pics/${DateTime.now().microsecondsSinceEpoch}.jpg');
      final metadata = SettableMetadata(contentType: 'image/png');
      await storageRef.putData(file.readAsBytesSync(), metadata);
      return await storageRef.getDownloadURL();
    } catch (e) {
      mySnakbar(context, e.toString());
    }
    return null;
  }
}
