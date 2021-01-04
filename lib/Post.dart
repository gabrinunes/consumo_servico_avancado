class Post {
  int user_id;
  int id;
  String title;
  String body;

  Post(this.body, this.id, this.title, this.user_id);

  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        user_id = json["user_id"],
        title = json["title"],
        body = json["body"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "title": title,
        "body": body,
      };
}
