
class ProductModel {
  final String id;
  final String name;
  final String storageType;

  const ProductModel({
    required this.id,
    required this.name,
    required this.storageType,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["product_id"],
        name: json["product_name"] ?? "test product", 
        storageType: json["storage_type"] ?? "test storage type", 
      );

  Map<String, dynamic> toJson() => {
        "product_id": id,
        "product_name": name,
        "storage_type": storageType,
      };

  ProductModel copyWith({
    String? id,
    String? name,
    String? storageType,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      storageType: storageType ?? this.storageType,
    );
  }
}