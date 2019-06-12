
import 'package:app_demo/config/api_url.dart';
import 'package:app_demo/data/maintenance.dart';
import 'package:dio/dio.dart';

Future getSwiperData() async {
  try {
    Response response = await Dio().get(apiUrl + homePagePah['swiperData']);
    return response.data['data'];
  } catch (e) {
    print("请求错误");
  }
}

Future getMaintenanceList() async {
  try {
    List<MaintenanctItem> list = List();
    Response response = await Dio().get(apiUrl + 'maintenanceList');
    if (response.statusCode == 200) {
     final json2 = response.data['data']['list'];
     if (json2 != null) {
      //  list.add(value)
      for (var item in json2) {
        list.add(MaintenanctItem(item));
      }
     }
   }
    return list;
  } catch (e) {
    print('数据请求错误');
  }
}