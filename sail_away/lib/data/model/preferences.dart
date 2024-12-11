class UserPreferencesModel {
  final String id;
  final String? userId;
  final List<String>? hatedProduct;
  final List<String>? allergies;

  const UserPreferencesModel({
    required this.id,
    required this.userId,
    required this.hatedProduct,
    required this.allergies,
  });

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) => UserPreferencesModel(
        id: json['id'] as String,
        userId: json['userId'] as String,
        hatedProduct: List<String>.from(json['hatedProduct'] ?? []),
        allergies: List<String>.from(json['allergies'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'hatedProduct': hatedProduct,
        'allergies': allergies,
      };

  UserPreferencesModel copyWith({
    String? id,
    String? userId,
    List<String>? hatedProduct,
    List<String>? allergies,
  }) {
    return UserPreferencesModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      hatedProduct: hatedProduct ?? this.hatedProduct,
      allergies: allergies ?? this.allergies,
    );
  }
}
