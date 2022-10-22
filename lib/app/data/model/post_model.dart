class PostModel {
  String content;
  String password;
  double latitude;
  double longitude;

  PostModel({
    required this.content,
    required this.password,
    required this.latitude,
    required this.longitude,
  });

  PostModel.fromJson(Map<String, Object?> json)
      : this(
          content: json['content'] == null ? '' : json['content'] as String,
          password: json['password'] == null ? '' : json['password'] as String,
          latitude: json['latitude'] == null ? 0.0 : json['latitude'] as double,
          longitude:
              json['longitude'] == null ? 0.0 : json['longitude'] as double,
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['password'] = password;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  static PostModel getInitialViewModel() {
    return PostModel(
      content: '',
      password: '',
      latitude: 0.0,
      longitude: 0.0,
    );
  }
}
