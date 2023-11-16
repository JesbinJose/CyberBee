class MyCourse {
  MyCourse({
    required this.courseName,
    required this.description,
    required this.amount,
    required this.discount,
    required this.introVideo,
    required this.levelsNumber,
  });
  final String courseName;
  final String description;
  final int amount;
  final int discount;
  final String introVideo;
  final int levelsNumber;
}

class MyLevel {
  MyLevel(
    this.partsName, {
    required this.levelName,
    required this.courseName,
  });
  final String courseName;
  final String levelName;
  final int partsName;
}

enum PartType {
  video,
  pdf,
}

class MyParts {
  MyParts({
    required this.partName,
    required this.partType,
  });
  final int partName;
  final PartType partType;
}

class VideoPart {
  VideoPart({
    required this.videoUrl,
    required this.description,
  });
  final String videoUrl;
  final String description;
}

class Quiz {
  Quiz({
    required this.quizName,
    required this.questions,
    required this.totalMark,
  });
  final String quizName;
  final List<Question> questions;
  final int totalMark;
}

class Question {
  Question({
    required this.question,
    required this.ans1,
    required this.ans2,
    required this.ans3,
    required this.ans4,
    required this.correctAns,
    required this.mark,
  });
  final int mark;
  final String question;
  final String ans1;
  final String ans2;
  final String ans3;
  final String ans4;
  final int correctAns;
}