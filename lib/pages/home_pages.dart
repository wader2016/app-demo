
import 'package:app_demo/data/car_list.dart';
import 'package:app_demo/data/car_list.dart' as prefix0;
import 'package:app_demo/service/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        // 屏幕适配， iphone6设计比例
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('上汽大众'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
        future: getSwiperData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 获取数据
          if (snapshot.hasData) {
            // 获得轮播数据
            // var swiperList = snapshot.data['projects'];
            var navigatorList = snapshot.data['navigatorLists'];
            var carList2 = snapshot.data['carList'];
            return Column(
              children: <Widget>[
                SwiperPage(swiperList: swiperList),
                NavigatorList(navigatorList: navigatorList),
                Divider(),
                CarList(carList: carList2),
              ],
            );
          } else {
            return Center(
              child: Text('获取数据中...'),
            );
          }
        },
      ),
      )
    );
  }
}

// 轮播组件
class SwiperPage extends StatelessWidget {
  final List<prefix0.SwiperData> swiperList;
  SwiperPage({Key key, this.swiperList}) : super(key: key);

  Widget _swiperBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(swiperList[index].imageUrl, fit: BoxFit.fill),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
       height: ScreenUtil().setHeight(400.0),
       child: Swiper(
        itemCount: swiperList.length,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white
          )
        ),
        autoplay: true,
        onTap: (int index) {
          print('点击了第$index个');
        },
       ),
      );
  }
}

// 菜单导航组件
class NavigatorList extends StatelessWidget {
  final List navigatorList;
  const NavigatorList({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItem(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('你点击了$item');
      },
      child: Container(
        color: Colors.blueAccent,
        height: 50.0,
        width: 100.0,
        child: Center(
          child: Text(
            '$item', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold
            )),
        ),
      )
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Wrap(
        spacing: ScreenUtil().setWidth(48.0),
        runSpacing: ScreenUtil().setWidth(32.0),
        children: navigatorList.map((item) {
          return _gridViewItem(context, item);
        }).toList(),
      )
    );
  }
}

// 列表组件
class CarList extends StatelessWidget {
  final List carList;
  const CarList({Key key, this.carList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      height: ScreenUtil().setHeight(900.0),
      child: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomListItem(
            name: '${carList[index]['name']}',
            price: '${carList[index]['price']}',
            desc: '${carList[index]['desc']}',
            thumbnail: Image.network('${carList[index]['imageUrl']}', fit: BoxFit.fill),
          );
        }
      ),
    );
 
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.thumbnail,
    this.name,
    this.price,
    this.desc,
  });

  final Widget thumbnail;
  final String name;
  final String price;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _CarDescription(name: name, price: price, desc: desc),
          )
        ],
      ),
    );
  }
  
}

class _CarDescription extends StatelessWidget {
  const _CarDescription({Key key, this.name, this.price,this.desc}) : super(key: key);

  final String name;
  final String price;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0
              )
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            Text(desc, style: TextStyle(fontSize: 10.0)
            )
          ],
        ),
      ),
    );
  }
}
