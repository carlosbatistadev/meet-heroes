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
      'full-name': fullName,
      'alter-egos': alterEgos,
      'aliases': aliases,
      'place-of-birth': placeOfBirth,
      'first-appearance': firstAppearance,
      'publisher': publisher,
      'alignment': alignment,
    };
  }

  factory BiographyModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BiographyModel(
      fullName: map['full-name'],
      alterEgos: map['alter-egos'],
      aliases: List<String>.from(map['aliases']),
      placeOfBirth: map['place-of-birth'],
      firstAppearance: map['first-appearance'],
      publisher: map['publisher'],
      alignment: map['alignment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BiographyModel.fromJson(String source) =>
      BiographyModel.fromMap(json.decode(source));
}
