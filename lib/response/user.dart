import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? email;
  String? fullname;
  String? shortName;
  String? userCode;
  int? gender;
  String? birthPlace;
  dynamic birthDate;
  String? address;
  String? phoneNumber;
  String? instagram;
  String? tiktok;
  String? facebook;
  int? status;
  String? profileImage;
  int? wallet;
  String? userType;
  DateTime? deleteRequestAt;
  int? activeEvent;
  List<dynamic>? faces;

  User({
    this.id,
    this.email,
    this.fullname,
    this.shortName,
    this.userCode,
    this.gender,
    this.birthPlace,
    this.birthDate,
    this.address,
    this.phoneNumber,
    this.instagram,
    this.tiktok,
    this.facebook,
    this.status,
    this.profileImage,
    this.wallet,
    this.userType,
    this.deleteRequestAt,
    this.activeEvent,
    this.faces,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    fullname: json["fullname"],
    shortName: json["short_name"],
    userCode: json["user_code"],
    gender: json["gender"],
    birthPlace: json["birth_place"],
    birthDate: json["birth_date"],
    address: json["address"],
    phoneNumber: json["phone_number"],
    instagram: json["instagram"],
    tiktok: json["tiktok"],
    facebook: json["facebook"],
    status: json["status"],
    profileImage: json["profile_image"],
    wallet: json["wallet"],
    userType: json["user_type"],
    deleteRequestAt: DateTime.parse(json["delete_request_at"]),
    activeEvent: json["active_event"],
    faces: List<dynamic>.from(json["faces"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "fullname": fullname,
    "short_name": shortName,
    "user_code": userCode,
    "gender": gender,
    "birth_place": birthPlace,
    "birth_date": birthDate,
    "address": address,
    "phone_number": phoneNumber,
    "instagram": instagram,
    "tiktok": tiktok,
    "facebook": facebook,
    "status": status,
    "profile_image": profileImage,
    "wallet": wallet,
    "user_type": userType,
    "delete_request_at": deleteRequestAt?.toIso8601String(),
    "active_event": activeEvent,
    "faces": List<dynamic>.from(faces!.map((x) => x)),
  };
}