
// enum Status { live, scheuled, soon }

class SearchModel {
  bool? status;
  String? message;
  Data? data;

  SearchModel({this.status, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<AuctionElement>? data;
  String? path;
  int? perPage;
  Null? nextCursor;
  Null? nextPageUrl;
  Null? prevCursor;
  Null? prevPageUrl;

  Data(
      {this.data,
      this.path,
      this.perPage,
      this.nextCursor,
      this.nextPageUrl,
      this.prevCursor,
      this.prevPageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AuctionElement>[];
      json['data'].forEach((v) {
        data!.add(AuctionElement.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    nextCursor = json['next_cursor'];
    nextPageUrl = json['next_page_url'];
    prevCursor = json['prev_cursor'];
    prevPageUrl = json['prev_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['next_cursor'] = this.nextCursor;
    data['next_page_url'] = this.nextPageUrl;
    data['prev_cursor'] = this.prevCursor;
    data['prev_page_url'] = this.prevPageUrl;
    return data;
  }
}

class AuctionElement {
  int? id;
  String? name;
  String? description;
  Null? finalPrice;
  double? initialPrice;
  List<String>? images;
  String? type;
  String? startDate;
  String? endDate;
  List<String>? keywords;
  int? categoryId;
  int? userId;
  Null? createdAt;
  Null? updatedAt;

  AuctionElement(
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

  AuctionElement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    finalPrice = json['final_price'];
    initialPrice = json['initial_price'];
    images = json['images'].cast<String>();
    type = json['type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    keywords = json['keywords'].cast<String>();
    categoryId = json['category_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['final_price'] = this.finalPrice;
    data['initial_price'] = this.initialPrice;
    data['images'] = this.images;
    data['type'] = this.type;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['keywords'] = this.keywords;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


