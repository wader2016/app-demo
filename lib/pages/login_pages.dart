
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.orange
        ),
        child:  Container(
        // 设置页面边距
        decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/images/login-bg.jpg'),
           fit: BoxFit.cover,
         )
          
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          // 设置主轴对齐方式
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginForm()
          ],
        ),
      ),
      )
    );
  }
}


class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final loginFormKey = GlobalKey<FormState>();
  String username;
  String password;
  // 设置自动验证
  bool _autoValidate = false;

  String userNameValidator(String username) {
    if (username.isEmpty) {
      return '用户名是必填项';
    }
    return null;
  }

  String pwdValidator(String password) {
    if (password.isEmpty) {
      return '密码为必填项';
    } 
    return null;
  }

  void login() {
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      Navigator.of(context).pushNamed('/home');
    } else {
      // 防止第一次自动验证
      setState(() {
        _autoValidate = true;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
         key: loginFormKey,
         child: Column(
           children: <Widget>[
             TextFormField(
               decoration: InputDecoration(
                 labelText: '用户名',
                 helperText: '',
                 icon: Icon(Icons.person),
               ),
               onSaved: (value) {
                //  username = value;
               },
               validator: userNameValidator,
               autovalidate: _autoValidate,
             ),
             TextFormField(
               // 密码不可见
               obscureText: true,
               decoration: InputDecoration(
                 labelText: '密码',
                 helperText: '',
                 icon: Icon(Icons.lock)
               ),
               onSaved: (value) {
                //  password = value;
               },
               validator: pwdValidator,
               autovalidate: _autoValidate,
             ),
             SizedBox(height: 32.0),
             Container(
               width: double.infinity,
               child: RaisedButton(
                 color: Colors.orange,
                 child: Text('登录', style: TextStyle(color: Colors.white)),
                 onPressed: login,
               )
               
             )
           ],
         ),
       );
  }
}