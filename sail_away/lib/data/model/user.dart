class UserModel {
  final String id;
  final String authId;
  final String name;
  final String email;

  const UserModel({
    required this.id,
    required this.authId,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["user_id"],
        authId: json["auth_id"],
        name: json["user_name"],
        email: json["user_email"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": id,
        "auth_id": authId,
        "user_name": name,
        "user_email": email,
      };

  UserModel copyWith({
    String? id,
    String? authId,
    String? name,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      authId: authId ?? this.authId,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
