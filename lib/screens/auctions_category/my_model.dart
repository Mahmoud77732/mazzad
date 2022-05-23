class MyModel {
  int? id;
  String? name;
  String? description;
  Null? finalPrice;
  double? initialPrice;
  List<String>? images;
  String? type;
  String? startDate;
  String? endDate;
  Null? keywords;
  int? categoryId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  MyModel(
      {this.id,
      this.name,
      this.description,
      this.finalPrice,
      this.initialPrice,
      this.images,
      this.type,
      this.startDate,
      this.endDate,
      this.keywords,
      this.categoryId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  MyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    finalPrice = json['final_price'];
    initialPrice = json['initial_price'].toDouble();
    images = json['images'].cast<String>();
    type = json['type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    // keywords = json['keywords'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}