class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? rating;
  final String? imageUrl;
  final String? brand;
  final int? stock;
  final List? gallery;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.rating,
    this.imageUrl,
    this.brand,
    this.stock,
    this.gallery,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['thumbnail'] ?? '',
      brand: json['brand'] ?? '',
      stock: json['stock'] ?? 0,
      gallery: json['images'] ?? [],
    );
  }
}
