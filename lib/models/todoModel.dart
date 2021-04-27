import 'dart:convert';

List<TodoModel> todoModelFromJson(String str) =>
    List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
  TodoModel({
    required this.name,
    required this.id,
    required this.isComplete,
  });

  String name;
  int id;
  bool? isComplete;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        name: json["name"],
        id: json["id"],
        isComplete: json["isComplete"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "isComplete": isComplete,
      };
}
