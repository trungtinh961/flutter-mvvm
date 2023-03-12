enum SubjectContentTypeEnum {
  theory,
  exercises,
  videos,
  sampleTests,
  answers,
}

extension SubjectContentExtension on SubjectContentTypeEnum {
  String get description {
    switch (this) {
      case SubjectContentTypeEnum.theory:
        return "Lý thuyết";
      case SubjectContentTypeEnum.exercises:
        return "Bài tập";
      case SubjectContentTypeEnum.videos:
        return "Video";
      case SubjectContentTypeEnum.sampleTests:
        return "Đề thi thử";
      case SubjectContentTypeEnum.answers:
        return "Giải đáp";
      default:
        return "";
    }
  }
}
