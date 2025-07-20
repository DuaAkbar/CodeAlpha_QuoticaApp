class Quotemodel {
  final String content;
  final String author;

  Quotemodel({required this.content, required this.author});

  factory Quotemodel.fromJson(Map<String, dynamic> json) {
    return Quotemodel(
      content: json['q'] ?? '',
      author: json['a'] ?? 'Unknown',
    );
  }
}
