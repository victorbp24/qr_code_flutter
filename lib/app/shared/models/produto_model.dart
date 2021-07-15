class ProdutoModel {
  final String title;
  final String author;
  final String year;
  final String language;

  ProdutoModel(
      {required this.title,
      required this.author,
      required this.year,
      required this.language});

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
        title: json['title'],
        author: json['author'],
        year: json['year'],
        language: json['language']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['author'] = this.author;
    data['year'] = this.year;
    data['language'] = this.language;
    return data;
  }
}
