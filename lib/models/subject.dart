import 'dart:convert';

Subject subjectFromJson(String str) => Subject.fromJson(json.decode(str));

String subjectToJson(Subject data) => json.encode(data.toJson());

class Subject {
  Subject({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.data,
  });

  bool status;
  String errNum;
  String msg;
  List<Datum> data;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    status: json["status"],
    errNum: json["errNum"],
    msg: json["msg"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "errNum": errNum,
    "msg": msg,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.subjectId,
    required this.semester,
    required this.year,
    required this.totalMark,
    required this.practicalMark,
    required this.status,
    required this.theoreticalMark,
    required this.name,
    required this.subjectYear,
  });

  int subjectId;
  int semester;
  int year;
  int totalMark;
  int practicalMark;
  String status;
  int theoreticalMark;
  String name;
  int subjectYear;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    subjectId: json["subject_id"],
    semester: json["semester"],
    year: json["year"],
    totalMark: json["total_mark"],
    practicalMark: json["practical_mark"],
    status: json["status"],
    theoreticalMark: json["theoretical_mark"],
    name: json["name"],
    subjectYear: json["subject_year"],
  );

  Map<String, dynamic> toJson() => {
    "subject_id": subjectId,
    "semester": semester,
    "year": year,
    "total_mark": totalMark,
    "practical_mark": practicalMark,
    "status": status,
    "theoretical_mark": theoreticalMark,
    "name": name,
    "subject_year": subjectYear,
  };
}
