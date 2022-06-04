class Blog {
  final int id;
  final int userId;
  final String title;
  final String body;

  Blog({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}
