import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../data/home_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SwiperPage(),
          ModelList(),
        ],
      )
    );
  }
}

class SwiperPage extends StatefulWidget {
  SwiperPage({Key key}) : super(key: key);

  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {

  Widget _swiperBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(swiperList[index].imageUrl, fit: BoxFit.fill),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width,
       height: 240.0,
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
       ),
    );
  }
}

class ModelList extends StatelessWidget {
  Widget _modelBuilder(BuildContext context, int index) {
  return Container(
    height: 32.0,
    color: Colors.lightBlue,
    child: Text(modelList[index], style: TextStyle(color: Colors.white))
  );
}
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:200.0,
      child: GridView.builder(
      itemCount: modelList.length,
      itemBuilder: _modelBuilder,
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,

      ),
    ),
    );
   
  }
}