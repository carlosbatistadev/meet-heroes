import 'dart:convert';

class WorkModel {
  final String occupation;
  final String base;
  WorkModel({
    this.occupation,
    this.base,
  });

  Map<String, dynamic> toMap() {
    return {
      'occupation': occupation,
      'base': base,
    };
  }

  factory WorkModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WorkModel(
      occupation: map['occupation'],
      base: map['base'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkModel.fromJson(String source) =>
      WorkModel.fromMap(json.decode(source));
}
