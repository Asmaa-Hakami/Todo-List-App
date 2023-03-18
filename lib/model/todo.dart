class TodoModel {
  String? title;
  String? description;
  String? id;
  bool? isFinished;

  TodoModel(this.title, this.description, this.id, this.isFinished);

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json["title"] ?? "";
    description = json["description"] ?? "";
    id = json["id"];
    isFinished = json["isFinished"] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["description"] = description;
    data["id"] = id;
    data["isFinished"] = isFinished;
    return data;
  }
}
