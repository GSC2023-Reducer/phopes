import 'package:flutter/material.dart';
import 'code_login_page.dart';
import '/study_plan_page.dart';
import 'student_home_page.dart';
import 'first_page.dart';
import 'book_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "login",
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/first',
        routes: {
          '/first': (context) => const FirstPage(),
          '/main': (context) => const StudentHomePage(),
          '/code': (context) => const CodeLoginPage(),
          '/study_plan': (context) => const StudyPlanPage(),
          '/book_detail_page': (context) => const BookDetailPage(),
        });
  }
}
