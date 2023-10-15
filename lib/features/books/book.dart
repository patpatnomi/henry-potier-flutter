class Book {
  final String isbn;
  final String title;
  final int price;
  final String cover;
  final List<String> synopsis;

  Book({
    required this.isbn,
    required this.title,
    required this.price,
    required this.cover,
    required this.synopsis,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        isbn: json["isbn"],
        title: json["title"],
        price: json["price"],
        cover: json["cover"],
        synopsis: List<String>.from(json["synopsis"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "isbn": isbn,
        "title": title,
        "price": price,
        "cover": cover,
        "synopsis": List<dynamic>.from(synopsis.map((x) => x)),
      };
}
