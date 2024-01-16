class PostModel {
  final int userId;
  final String title;

  PostModel({required this.userId, required this.title});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      PostModel(userId: json['userId'], title: json['title']);
}
