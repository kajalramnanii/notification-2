class CategoryModel {
  CategoryModel({
    this.category,
    this.data,
  });

  CategoryModel.fromJson(dynamic json) {
    category = json['category'];
    data = json['data'];
  }
  String? category;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['data'] = data;
    return map;
  }
}
