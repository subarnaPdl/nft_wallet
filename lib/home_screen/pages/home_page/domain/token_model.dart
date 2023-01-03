class Token {
  final int id;
  final String shortForm;
  final String fullForm;
  final String img;
  final double value;
  final double changeRate;
  final bool isIncreased;
  Token({
    required this.id,
    required this.shortForm,
    required this.fullForm,
    required this.img,
    required this.value,
    required this.changeRate,
    required this.isIncreased,
  });
}
