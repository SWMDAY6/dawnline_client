import 'package:dawnline/app/data/model/comment_model.dart';

class ViewModel {
  int postId;
  String content;
  String password;
  double latitude;
  double longitude;
  String createdAt;
  String modifiedAt;
  List<CommentModel>? comments;

  ViewModel({
    required this.postId,
    required this.content,
    required this.password,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.modifiedAt,
    this.comments,
  });

  static List<CommentModel> makeCommentList(json) {
    return json.map((comment) => CommentModel.fromJson(comment)).toList();
  }

  ViewModel.fromJson(Map<String, Object?> json)
      : this(
          postId: json['postId'] == null ? 0 : json['postId'] as int,
          content: json['content'] == null ? '' : json['content'] as String,
          createdAt:
              json['createdAt'] == null ? '' : json['createdAt'] as String,
          latitude: json['latitude'] == null ? 0.0 : json['latitude'] as double,
          longitude:
              json['longitude'] == null ? 0.0 : json['longitude'] as double,
          modifiedAt:
              json['modifiedAt'] == null ? '' : json['modifiedAt'] as String,
          password: json['password'] == null ? '' : json['password'] as String,
          comments:
              json['comment'] == null ? [] : makeCommentList(json['comments']),
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['content'] = content;
    data['password'] = password;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    data['comments'] = comments;
    return data;
  }

  static ViewModel getInitialViewModel() {
    return ViewModel(
        postId: 0,
        content: '',
        password: '',
        latitude: 0.0,
        longitude: 0.0,
        createdAt: '',
        modifiedAt: '');
  }
}
