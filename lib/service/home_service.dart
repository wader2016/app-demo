
import 'package:app_demo/config/api_url.dart';
import 'package:dio/dio.dart';

Future getSwiperData() async {
  try {
    Response response = await Dio().get(apiUrl + homePagePah['swiperData']);
    return response.data['data'];
  } catch (e) {
    print("请求错误");
  }
}