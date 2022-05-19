class AddedAuctionModel {
  String? name;
  List<String>? images;
  String? type;
  String? startDate;
  String? endDate;
  String? description;
  String? categoryId;
  String? initialPrice;
  List<String>? keywords;

  AddedAuctionModel({
    required this.name,
    required this.images,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.categoryId,
    required this.initialPrice,
    required this.keywords,
  });

  AddedAuctionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    images = json['images'].cast<String>();
    type = json['type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    categoryId = json['category_id'];
    initialPrice = json['initial_price'];
    keywords = json['keywords'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['images'] = images;
    data['type'] = type;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    data['category_id'] = categoryId;
    data['initial_price'] = initialPrice;
    data['keywords'] = keywords;
    return data;
  }
}
