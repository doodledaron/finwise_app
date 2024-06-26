class Quiz {
  String title;
  int points;
  String id;
  Map<String, bool> options;
  bool isAnswered = false;

  static var length;

  Quiz({
    required this.id,
    required this.title,
    required this.points,
    required this.options,
    required this.isAnswered,
  });

  bool checkAnswer(String optionKey) {
    return options[optionKey] ?? false;
  }
}
