//handling response after login or register for examble

class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;

  // named constructor
  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null) ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? accessToken; //token
  String? refreshToken;
  // DateTime? secExpiresDate;
  int? secExpiresDate;
  int? clientId;

  // named constructor
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    // phone = json['phone'];
    phone = json['phone_number'];
    // image = json['image'];
    // points = json['points'];
    // credit = json['credit'];

    // token = json['token'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    clientId = json['id'];
    secExpiresDate = json['expires_in'];
    // secExpiresDate = DateTime.now().add(Duration(seconds: (json['expires_in'] != null ) ? json['expires_in'] : 0));
  }
}
