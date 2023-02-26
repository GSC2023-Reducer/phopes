import 'package:flutter/material.dart';
import 'package:phopes_cjw/code_login_page.dart';
import 'package:phopes_cjw/study_plan_page.dart';
import 'id_login_page.dart';
import 'student_home_page.dart';
import 'first_page.dart';
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
            routes : {'/first' : (context) => FirstPage(),'/main' : (context) => StudentHomePage(), '/code' : (context) => CodeLoginPage(),'/study_plan' : (context) => StudyPlanPage(),}
        );

  }
}
