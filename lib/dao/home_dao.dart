import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:iflutter_trip/generated/json/base/json_convert_content.dart';

import 'package:iflutter_trip/model/home_entity.dart';

class HomeDao {
  // 无法处理301 状况
  static Future<HomeEntity> fetch() async {
    var url =
        Uri.parse('http://www.devio.org/io/flutter_app/json/home_page.json');
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return JsonConvert.fromJsonAsT<HomeEntity>(response.body);
    } else {
      throw Exception("请求错误");
    }
  }

  static Future<HomeEntity> fetch2() async {
    var dio = Dio();
    final response = await dio
        .get('http://www.devio.org/io/flutter_app/json/home_page.json');
    print(response.data);

    return JsonConvert.fromJsonAsT<HomeEntity>(response.data);
  }
}
