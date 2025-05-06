class CategoryModel {
  final String name;
  final String slug;
  final String url;

  CategoryModel({required this.name, required this.slug, required this.url});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      slug: json['slug'],
      url: json['url'],
    );
  }
}
