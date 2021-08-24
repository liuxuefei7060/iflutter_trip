/// status : 0
/// message : "ok"

class TaskModel {
  int? status;
  String? message;

  TaskModel({
      this.status, 
      this.message});

  TaskModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}