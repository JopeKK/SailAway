class TipModel {
  final String id;
  final String title;
  final String description;

  const TipModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory TipModel.fromJson(Map<String, dynamic> json) => TipModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };

  TipModel copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return TipModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
