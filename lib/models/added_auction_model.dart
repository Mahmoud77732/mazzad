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

  AddedAuctionModel(
      {this.name,
      this.images,
      this.type,
      this.startDate,
      this.endDate,
      this.description,
      this.categoryId,
      this.initialPrice,
      this.keywords});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['images'] = this.images;
    data['type'] = this.type;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['initial_price'] = this.initialPrice;
    data['keywords'] = this.keywords;
    return data;
  }
}