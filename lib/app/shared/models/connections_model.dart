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
      'group-affiliation': groupAffiliation,
      'relatives': relatives,
    };
  }

  factory ConnectionsModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ConnectionsModel(
      groupAffiliation: map['group-affiliation'],
      relatives: map['relatives'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConnectionsModel.fromJson(String source) =>
      ConnectionsModel.fromMap(json.decode(source));
}
