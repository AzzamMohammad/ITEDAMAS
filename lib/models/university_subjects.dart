import 'dart:convert';

UniversitySubjects universitySubjectsFromJson(String str) => UniversitySubjects.fromJson(json.decode(str));

String universitySubjectsToJson(UniversitySubjects data) => json.encode(data.toJson());

class UniversitySubjects {
  UniversitySubjects({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.data,
  });

  bool status;
  String errNum;
  String msg;
  List<UniversitySubject> data;

  factory UniversitySubjects.fromJson(Map<String, dynamic> json) => UniversitySubjects(
    status: json["status"],
    errNum: json["errNum"],
    msg: json["msg"],
    data: List<UniversitySubject>.from(json["Data"].map((x) => UniversitySubject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "errNum": errNum,
    "msg": msg,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UniversitySubject {
  UniversitySubject({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory UniversitySubject.fromJson(Map<String, dynamic> json) => UniversitySubject(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
