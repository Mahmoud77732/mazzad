// // enum Status { live, scheuled, soon }

// class SearchModel {
//   bool? status;
//   String? message;
//   Data? data;

//   SearchModel({this.status, this.message, this.data});

//   SearchModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<AuctionElement>? data;
//   String? path;
//   int? perPage;

//   Data({
//     this.data,
//     this.path,
//     this.perPage,
//   });

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <AuctionElement>[];
//       json['data'].forEach((v) {
//         data!.add(AuctionElement.fromJson(v));
//       });
//     }
//     path = json['path'];
//     perPage = json['per_page'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['path'] = path;
//     data['per_page'] = perPage;

//     return data;
//   }
// }

// class AuctionElement {
//   int? id;
//   String? name;
//   String? description;
//   int? finalPrice;
//   int? initialPrice;
//   List<String>? images;
//   String? type;
//   String? startDate;
//   String? endDate;
//   List<String>? keywords;
//   int? categoryId;
//   int? userId;

//   AuctionElement({
//     this.id,
//     this.name,
//     this.description,
//     this.finalPrice,
//     this.initialPrice,
//     this.images,
//     this.type,
//     this.startDate,
//     this.endDate,
//     this.keywords,
//     this.categoryId,
//     this.userId,
//   });

//   AuctionElement.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     finalPrice = json['final_price'];
//     initialPrice = json['initial_price'];
//     images = json['images'];
//     type = json['type'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     keywords = json['keywords'];
//     categoryId = json['category_id'];
//     userId = json['user_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['description'] = description;
//     data['final_price'] = finalPrice;
//     data['initial_price'] = initialPrice;
//     data['images'] = images;
//     data['type'] = type;
//     data['start_date'] = startDate;
//     data['end_date'] = endDate;
//     data['keywords'] = keywords;
//     data['category_id'] = categoryId;
//     data['user_id'] = userId;

//     return data;
//   }
// }
