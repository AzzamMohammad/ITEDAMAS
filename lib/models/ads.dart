import 'dart:convert';

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));

String adsToJson(Ads data) => json.encode(data.toJson());

class Ads {
  Ads({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.data,
  });

  bool status;
  String errNum;
  String msg;
  List<SingleAds> data;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
    status: json["status"],
    errNum: json["errNum"],
    msg: json["msg"],
    data: List<SingleAds>.from(json["Data"].map((x) => SingleAds.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "errNum": errNum,
    "msg": msg,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SingleAds {
  SingleAds({
    required this.id,
    required this.description,
    required this.img,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String description;
  String img;
  DateTime date;
  DateTime createdAt;
  DateTime updatedAt;

  factory SingleAds.fromJson(Map<String, dynamic> json) => SingleAds(
    id: json["id"],
    description: json["description"],
    img: json["img"],
    date: DateTime.parse(json["date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "img": img,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
