enum MenuType {
  subject,
  feedback,
}

enum SubjectType {
  literature,
  mathematics,
  english,
  physics,
  chemistry,
  biology,
  history,
  geography,
  civics,
  informatics,
  technology,
  music,
}

enum FeedbackType {
  suggestions,
  psychologicalCounseling,
  healthCare,
  movement,
}

class MenuModel {
  String name;
  String image;
  MenuType type;
  SubjectType? subjectType;
  FeedbackType? feedbackType;

  MenuModel({
    this.name = "",
    this.image = "",
    this.type = MenuType.subject,
    this.subjectType,
    this.feedbackType,
  });
}
