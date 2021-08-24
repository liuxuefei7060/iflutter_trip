import 'package:iflutter_trip/model/task_entity.dart';
import 'package:iflutter_trip/model/task_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'net_api_test.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/tasks")
  Future<List<TaskModel>> getTasks();
}
