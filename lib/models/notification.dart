
import 'dart:convert';

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.data,
  });

  bool status;
  String errNum;
  String msg;
  List<Notificationn> data;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    status: json["status"],
    errNum: json["errNum"],
    msg: json["msg"],
    data: List<Notificationn>.from(json["Data"].map((x) => Notificationn.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "errNum": errNum,
    "msg": msg,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Notificationn {
  Notificationn({
    required this.id,
    required this.studentId,
    required this.text,
    required this.read,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int studentId;
  String text;
  int read;
  DateTime createdAt;
  DateTime updatedAt;

  factory Notificationn.fromJson(Map<String, dynamic> json) => Notificationn(
    id: json["id"],
    studentId: json["student_id"],
    text: json["text"],
    read: json["read"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_id": studentId,
    "text": text,
    "read": read,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
