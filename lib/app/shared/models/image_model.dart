import 'dart:convert';

class ImageModel {
  final String url;
  ImageModel({
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ImageModel(
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));
}
