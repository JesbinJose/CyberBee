import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/core/firebase/courses/course_models.dart';

class GetAllCourseDetails {
  final CollectionReference _instance =
      FirebaseFirestore.instance.collection('courses');

  Stream getRecomaendedCourse() {
    return _instance.snapshots();
  }

  Stream getCourses() {
    return _instance.snapshots();
  }

  Future<void> addCourse(MyCourse course) async {
    Map<String, dynamic> data = {
      'description': course.description,
      'amount': course.amount,
      'discount': course.discount,
      'intro_video': course.introVideo,
      'levels_number': course.levelsNumber,
    };
    _instance.doc(course.courseName).set(data);
  }

  Future<void> addLevel(MyLevel level) async {
    _instance.doc(level.courseName).collection(level.levelName);
  }

  Future<void> addPartsInLevel(String courseName, String levelName,)async {}
}
