import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirebaseEvents {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static Stream<QuerySnapshot> getAllEvents(){
    return _instance.collection('events').snapshots();
  }
}
