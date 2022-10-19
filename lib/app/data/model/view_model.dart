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

  // ViewModel.fromJson(Map<String, dynamic?> json) {
  //   postId = json['postId'] ?? 0;
  //   content = json['content'] ?? '123';
  //   password = json['password'] ?? '123';
  //   latitude = json['latitude'] ?? 0.0;
  //   longitude = json['longitude'] ?? 0.0;
  //   createdAt = json['createdAt'] ?? '123';
  //   modifiedAt = json['modifiedAt'] ?? '123';
  //   comments = json['comments']
  //       .map((comment) => CommentModel.fromJson(comment))
  //       .toList();
  // }

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

  // Content.fromJson(Map<String, Object?> json)
  //     : this(
  //         id: json['contentId'] == null ? 0 : json['contentId'] as int,
  //         title: json['title'] == null ? '' : json['title'] as String,
  //         subtitle: json['subtitle'] == null ? '' : json['subtitle'] as String,
  //         content: json['content'] == null ? '' : json['content'] as String,
  //         latitude: json['latitude'] == null ? 0 : json['latitude'] as double,
  //         longitude:
  //             json['longitude'] == null ? 0 : json['longitude'] as double,
  //         address: json['address'] == null ? '' : json['address'] as String,
  //         likes: json['likes'] == null ? 0 : json['likes'] as int,
  //         articles: json['articles'] == null
  //             ? []
  //             : Content.articleListFromJson(json['articles']),
  //         contentType:
  //             json['contentType'] == null ? '' : json['contentType'] as String,
  //         rating: json['rating'] == null ? 0 : json['rating'] as double,
  //         blogReview:
  //             json['blogReview'] == null ? 0 : json['blogReview'] as int,
  //         visitorReview:
  //             json['visitorReview'] == null ? 0 : json['visitorReview'] as int,
  //         detailUrl: json['contentDetailUrl'] == null
  //             ? ''
  //             : json['contentDetailUrl'] as String,
  //         phone:
  //             json['phoneNumber'] == null ? '' : json['phoneNumber'] as String,
  //         imageList: json['imageList'] == null
  //             ? []
  //             : Content.imageListFromJson(json['imageList']),
  //         distance: json['distance'] == null ? 0.0 : json['distance'] as double,
  //       );
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
