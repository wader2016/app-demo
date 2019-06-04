class SwiperData {
  SwiperData(this.title, this.imageUrl); 
  final String title;
  final String imageUrl;
}

final List<SwiperData> swiperList = [
  SwiperData('title', 'https://www.svw-volkswagen.com/content/dam/vw-ngw/svw/homepage/kv/%E4%B8%BB%E9%A1%B5%20T-cross%20KV.jpg/jcr:content/renditions/original.transform/max/img.jpg'),
  SwiperData('title', 'https://www.svw-volkswagen.com/content/dam/vw-ngw/svw/homepage/kv/AllNewPassat-20181112.jpg/jcr:content/renditions/original.transform/max/img.jpg'),
  SwiperData('title', 'https://www.svw-volkswagen.com/content/dam/vw-ngw/svw/homepage/kv/Tharu-20181112New.jpg/jcr:content/renditions/original.transform/max/img.jpg'),
  SwiperData('title', 'https://brand.svw-volkswagen.com/company_news/images/wallpaperImg/wallpaper_pic12_big01.jpg')
];

final List<String> modelList = ['TPMS', 'POI', 'INLINE', '应用1', '应用2', '应用3'];