import 'dart:convert';

class AppearanceModel {
  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;
  AppearanceModel({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'race': race,
      'height': height,
      'weight': weight,
      'eye-color': eyeColor,
      'hair-color': hairColor,
    };
  }

  factory AppearanceModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AppearanceModel(
      gender: map['gender'],
      race: map['race'],
      height: List<String>.from(map['height']),
      weight: List<String>.from(map['weight']),
      eyeColor: map['eye-color'],
      hairColor: map['hair-color'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppearanceModel.fromJson(String source) =>
      AppearanceModel.fromMap(json.decode(source));
}
