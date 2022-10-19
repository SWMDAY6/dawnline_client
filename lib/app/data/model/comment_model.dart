class CommentModel {
  late String content;
  late String password;
  late String createdAt;
  late String modifiedAt;
  CommentModel({content, password, createdAt, modifiedAt});

  CommentModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    password = json['password'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['password'] = password;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    return data;
  }
}
