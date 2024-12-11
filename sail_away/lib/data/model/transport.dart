class TransportModel {
  final String id;
  final String tripId;
  final String type;
  final List<String> members;

  const TransportModel({
    required this.id,
    required this.tripId,
    required this.type,
    required this.members,
  });

  factory TransportModel.fromJson(Map<String, dynamic> json) => TransportModel(
        id: json["id"],
        tripId: json["tripId"],
        type: json["type"] ?? "unknown",
        members: List<String>.from(json["members"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tripId": tripId,
        "type": type,
        "members": members,
      };

  TransportModel copyWith({
    String? id,
    String? tripId,
    String? type,
    List<String>? members,
  }) {
    return TransportModel(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      type: type ?? this.type,
      members: members ?? this.members,
    );
  }
}
