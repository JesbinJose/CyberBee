import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/core/firebase/courses/course_models.dart';

class GetAllCourseDetails {
  static final CollectionReference _instance =
      FirebaseFirestore.instance.collection('courses');

  static Stream<QuerySnapshot> getRecomaendedCourse() {
    return _instance.snapshots();
  }

  static Stream<QuerySnapshot> getCourses() {
    return _instance.snapshots();
  }

  static Future<void> addCourse(MyCourse course) async {
    Map<String, dynamic> data = {
      'description': course.description,
      'amount': course.amount,
      'discount': course.discount,
      'intro_video': course.introVideo,
      'intro_image':course.introImageLink,
      'levels_number': course.levelsNumber,
    };
    _instance.doc(course.courseName).set(data);
  }

  static Future<void> addLevel(MyLevel level) async {
    _instance.doc(level.courseName).collection(level.levelName);
  }

  static Future<void> addPartsInLevel(String courseName, String levelName,)async {}
}
