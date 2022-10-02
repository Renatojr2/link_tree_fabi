class SocialModel {
  final String socialName;
  final String sociallink;

  SocialModel({
    required this.socialName,
    required this.sociallink,
  });

  factory SocialModel.fromJson(Map<String, dynamic> json) {
    return SocialModel(
      socialName: json['socialName'],
      sociallink: json['sociallink'],
    );
  }
}
