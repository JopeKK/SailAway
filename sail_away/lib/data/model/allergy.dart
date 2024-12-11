
class AllergyModel {
  final String id; 
  final String name;

  const AllergyModel({
    required this.id,
    required this.name,
  });

  factory AllergyModel.fromJson(Map<String, dynamic> json) => AllergyModel(
        id: json["allergy_id"],
        name: json["allergy_name"],
      );

  Map<String, dynamic> toJson() => {
        "allergy_id": id,
        "allergy_name": name,
      };

  AllergyModel copyWith({
    String? id,
    String? name,
  }) {
    return AllergyModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
