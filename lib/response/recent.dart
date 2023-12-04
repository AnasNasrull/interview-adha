import 'dart:convert';

Recent recentFromJson(String str) => Recent.fromJson(json.decode(str));

String recentToJson(Recent data) => json.encode(data.toJson());

class Recent {
  String? id;
  String? code;
  String? name;
  String? location;
  String? city;
  String? description;
  DateTime? dateStart;
  DateTime? dateFinish;
  String? timeStart;
  String? timeFinish;
  String? eventGroupId;
  String? picEvent;
  String? teamAId;
  String? teamAName;
  String? teamBId;
  String? teamBName;
  String? paymentMethod;
  String? photoPrice;
  String? videoPrice;
  String? coverImage;
  String? thumbnail;
  String? linkYoutube;
  String? createdBy;
  String? groupCode;
  String? groupName;
  String? eventType;
  dynamic jerseyNo;
  bool? isSingle;

  Recent({
    this.id,
    this.code,
    this.name,
    this.location,
    this.city,
    this.description,
    this.dateStart,
    this.dateFinish,
    this.timeStart,
    this.timeFinish,
    this.eventGroupId,
    this.picEvent,
    this.teamAId,
    this.teamAName,
    this.teamBId,
    this.teamBName,
    this.paymentMethod,
    this.photoPrice,
    this.videoPrice,
    this.coverImage,
    this.thumbnail,
    this.linkYoutube,
    this.createdBy,
    this.groupCode,
    this.groupName,
    this.eventType,
    this.jerseyNo,
    this.isSingle,
  });

  factory Recent.fromJson(Map<String, dynamic> json) => Recent(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    location: json["location"],
    city: json["city"],
    description: json["description"],
    dateStart: DateTime.parse(json["date_start"]),
    dateFinish: DateTime.parse(json["date_finish"]),
    timeStart: json["time_start"],
    timeFinish: json["time_finish"],
    eventGroupId: json["event_group_id"],
    picEvent: json["pic_event"],
    teamAId: json["team_a_id"],
    teamAName: json["team_a_name"],
    teamBId: json["team_b_id"],
    teamBName: json["team_b_name"],
    paymentMethod: json["payment_method"],
    photoPrice: json["photo_price"],
    videoPrice: json["video_price"],
    coverImage: json["cover_image"],
    thumbnail: json["thumbnail"],
    linkYoutube: json["link_youtube"],
    createdBy: json["created_by"],
    groupCode: json["group_code"],
    groupName: json["group_name"],
    eventType: json["event_type"],
    jerseyNo: json["jersey_no"],
    isSingle: json["is_single"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "location": location,
    "city": city,
    "description": description,
    "date_start": dateStart?.toIso8601String(),
    "date_finish": dateFinish?.toIso8601String(),
    "time_start": timeStart,
    "time_finish": timeFinish,
    "event_group_id": eventGroupId,
    "pic_event": picEvent,
    "team_a_id": teamAId,
    "team_a_name": teamAName,
    "team_b_id": teamBId,
    "team_b_name": teamBName,
    "payment_method": paymentMethod,
    "photo_price": photoPrice,
    "video_price": videoPrice,
    "cover_image": coverImage,
    "thumbnail": thumbnail,
    "link_youtube": linkYoutube,
    "created_by": createdBy,
    "group_code": groupCode,
    "group_name": groupName,
    "event_type": eventType,
    "jersey_no": jerseyNo,
    "is_single": isSingle,
  };
}