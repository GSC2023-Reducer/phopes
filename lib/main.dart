import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:phopes/isar_services.dart';
import 'code_login_page.dart';
import '/study_plan_page.dart';
import 'student_home_page.dart';
import 'first_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import "update_page.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/first',
      routes: {
        '/first': (context) => FirstPage(),
        '/main': (context) => StudentHomePage(),
        '/study_plan': (context) => const StudyPlanPage(),
        // '/book_detail_page': (context) => BookDetailPage(),
        '/update': (context) => const UpdatePage()
      },
    );
  }
}
