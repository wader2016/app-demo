
import 'package:flutter/material.dart';
import 'pages/home_pages.dart';
import 'pages/login_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 去除页面右上角的debug图标
      debugShowCheckedModeBanner: false,
      // 设置全局主题
      theme: ThemeData(
        primaryColor: Colors.lightBlue
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage()
      }
    );
  }
}
