import 'dart:convert';

class BiographyModel {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;
  BiographyModel({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'alterEgos': alterEgos,
      'aliases': aliases,
      'placeOfBirth': placeOfBirth,
      'firstAppearance': firstAppearance,
      'publisher': publisher,
      'alignment': alignment,
    };
  }

  factory BiographyModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BiographyModel(
      fullName: map['fullName'],
      alterEgos: map['alterEgos'],
      aliases: List<String>.from(map['aliases']),
      placeOfBirth: map['placeOfBirth'],
      firstAppearance: map['firstAppearance'],
      publisher: map['publisher'],
      alignment: map['alignment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BiographyModel.fromJson(String source) =>
      BiographyModel.fromMap(json.decode(source));
}
