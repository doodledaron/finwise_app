class LocalNews {
  String title;
  String text;
  String text2;
  String text3;
  String text4;
  String text5;
  String com;
  String imagePath; // Add imagePath property
  int followers;
  int following;
  DateTime date;
  String author;
  String type;
  bool isBookMarked;
  static var length;
  String explanation;
  String quiztitle;
  int points;
  String id;
  Map<String, bool> options;

  LocalNews({
    required this.title,
    required this.com,
    required this.date,
    required this.author,
    required this.type,
    required this.text,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.isBookMarked,
    required this.imagePath,
    required this.followers,
    required this.following,
    required this.id,
    required this.quiztitle,
    required this.points,
    required this.options,
    required this.explanation,
  });
}