import 'dart:convert';

class ConnectionsModel {
  final String groupAffiliation;
  final String relatives;
  ConnectionsModel({
    this.groupAffiliation,
    this.relatives,
  });

  Map<String, dynamic> toMap() {
    return {
      'groupAffiliation': groupAffiliation,
      'relatives': relatives,
    };
  }

  factory ConnectionsModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ConnectionsModel(
      groupAffiliation: map['groupAffiliation'],
      relatives: map['relatives'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConnectionsModel.fromJson(String source) =>
      ConnectionsModel.fromMap(json.decode(source));
}
