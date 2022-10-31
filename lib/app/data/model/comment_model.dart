class CommentModel {
  String? content;
  String? createdAt;
  String? modifiedAt;
  CommentModel({
    required this.content,
    required this.createdAt,
    required this.modifiedAt,
  });

  CommentModel.fromJson(Map<String, Object?> json)
      : this(
          content: json['content'] == null ? '' : json['content'] as String,
          createdAt:
              json['createdAt'] == null ? '' : json['createdAt'] as String,
          modifiedAt:
              json['modifiedAt'] == null ? '' : json['modifiedAt'] as String,
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    return data;
  }
}
