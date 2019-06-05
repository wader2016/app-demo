import 'package:flutter/material.dart';

class Car {
  final String name;
  final String price;
  final String desc;
  final String imageUrl;

  Car({Key key, this.name, this.price, this.desc, this.imageUrl});
}

final List<Car> carList = [
  Car(
      name: "Polo GTI",
      price: "143900",
      desc: "当速度成为深入骨髓的信仰，没有什么能阻止。是赛道狂热分子，亦是速度玩家的专属座驾。",
      imageUrl: "https://brand.svw-volkswagen.com/images/poloGti.png"),
  Car(
      name: "Polo GTI",
      price: "143900",
      desc: "当速度成为深入骨髓的信仰，没有什么能阻止。是赛道狂热分子，亦是速度玩家的专属座驾。",
      imageUrl: "https://brand.svw-volkswagen.com/images/poloGti.png"),
];

class SwiperData {
  final String name;
  final String imageUrl;

  SwiperData({Key key, this.name, this.imageUrl});
}

final List<SwiperData> swiperList = [
      SwiperData(
        name: "途观",
        imageUrl: "https://www.svw-volkswagen.com/content/dam/vw-ngw/svw/homepage/kv/%E4%B8%BB%E9%A1%B5%20T-cross%20KV.jpg/jcr:content/renditions/original.transform/max/img.jpg"
      ),
      SwiperData(
        name: "帕萨特",
        imageUrl: "https://www.svw-volkswagen.com/content/dam/vw-ngw/svw/homepage/kv/AllNewPassat-20181112.jpg/jcr:content/renditions/original.transform/max/img.jpg"
      ),
      SwiperData(
        name: "迈腾",
        imageUrl: "https://www.svw-volkswagen.com/content/dam/vw-ngw/svw/homepage/kv/Tharu-20181112New.jpg/jcr:content/renditions/original.transform/max/img.jpg"
      ),
      SwiperData(
        name: "速腾",
        imageUrl: "https://brand.svw-volkswagen.com/company_news/images/wallpaperImg/wallpaper_pic12_big01.jpg"
      )
];
