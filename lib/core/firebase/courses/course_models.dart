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
  quiz,
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

