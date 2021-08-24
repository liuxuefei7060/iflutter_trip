import 'package:iflutter_trip/generated/json/base/json_convert_content.dart';

class TaskEntity with JsonConvert<TaskEntity> {
	late int id;
	late String name;
	late String avatar;
	late String createdAt;
}
