import 'package:flutter/material.dart';
import 'package:phopes_cjw/codeLogin.dart';
import 'selectLogin.dart';
import 'idLogin.dart';
import 'mainPage.dart';
import 'firstPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
            title : "login",
            theme : ThemeData(
                primarySwatch: Colors.blue
            ),
            initialRoute: '/first',
            routes : {'/first' : (context) => FirstPage(),'/main' : (context) => MainPage(), '/code' : (context) => CodeLoginPage() }
        );

  }
}
