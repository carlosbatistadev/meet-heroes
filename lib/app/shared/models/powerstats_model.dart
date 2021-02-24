import 'dart:convert';

class PowerstatsModel {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;
  PowerstatsModel({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  Map<String, dynamic> toMap() {
    return {
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat,
    };
  }

  factory PowerstatsModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PowerstatsModel(
      intelligence: map['intelligence'],
      strength: map['strength'],
      speed: map['speed'],
      durability: map['durability'],
      power: map['power'],
      combat: map['combat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PowerstatsModel.fromJson(String source) =>
      PowerstatsModel.fromMap(json.decode(source));
}
