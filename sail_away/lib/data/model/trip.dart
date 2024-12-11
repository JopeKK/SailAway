class TripModel {
  final String id;
  final String authorId;
  final String name;
  final bool tips;
  final bool transport;
  final DateTime? startingData;
  final String inviteCode;
  final List<String>? members;

  const TripModel({
    required this.id,
    required this.authorId,
    required this.tips,
    required this.name,
    required this.transport,
    this.startingData,
    required this.inviteCode,
    this.members,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        id: json["id"],
        authorId: json["authorId"],
        tips: json["tips"],
        name: json["name"],
        transport: json["transport"],
        startingData: json["startingData"] != null
            ? DateTime.parse(json["startingData"])
            : null,
        inviteCode: json["inviteCode"],
        members:
            json["members"] != null ? List<String>.from(json["members"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "authorId": authorId,
        "tips": tips,
        "transport": transport,
        "startingData": startingData?.toIso8601String(),
        "inviteCode": inviteCode,
        "members": members,
      };

  TripModel copyWith({
    String? id,
    String? authorId,
    bool? tips,
    String? name,
    bool? transport,
    DateTime? startingData,
    String? inviteCode,
    List<String>? members,
  }) {
    return TripModel(
      id: id ?? this.id,
      name: name ?? this.name,
      authorId: authorId ?? this.authorId,
      tips: tips ?? this.tips,
      transport: transport ?? this.transport,
      startingData: startingData ?? this.startingData,
      inviteCode: inviteCode ?? this.inviteCode,
      members: members ?? this.members,
    );
  }
}
